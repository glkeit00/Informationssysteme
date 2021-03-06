--*******************************************
--**
--** REPORTS
--**
--*******************************************

--*******************************************
--** 19. deputatkonto
--*******************************************

connect to labor;

select 
    res.dozentid
    , res.lastname
    , sum(sumVeranstaltungsSWS+coalesce(sumAufgabenSWS, 0) - kontostandvorsemester) as summe
    , deputat
    , res.zeitsemesterid
from (
  select zsem.dozentid
    , zsem.lastname
    , sumVeranstaltungsSWS
    , deputat
    , kontostandvorsemester
    , zsem.zeitsemesterid 
  from (
    select 
    h.dozentid
    , h.lastname
    , sum(veranstaltungssws) as sumVeranstaltungssws
    , h.zeitsemesterid
    from glkeit00_hat as h
    join glkeit00_veranstaltung as v
    on h.veranstaltungsid = v.veranstaltungsid
    group by dozentid, lastname, h.zeitsemesterid
  )tmp
  join glkeit00_prof_zeitsemester as zsem
  on tmp.zeitsemesterid = zsem.zeitsemesterid
  and tmp.dozentid = zsem.dozentid
  and tmp.lastname = zsem.lastname
)res
full outer join (select 
    dozentid
    , lastname
    , zeitsemesterid
    , sum(aufgabensws) as sumAufgabensws
    from glkeit00_aufgaben 
    group by dozentid
      , lastname
      , zeitsemesterid
    )a
on a.dozentid = res.dozentid
and a.lastname = res.lastname
and a.zeitsemesterid = res.zeitsemesterid
group by 
    res.dozentid
    , res.lastname
    , deputat
    , res.zeitsemesterid
;

CONNECT RESET;