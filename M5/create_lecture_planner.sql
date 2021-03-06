CONNECT TO LABOR;

CREATE SEQUENCE glkeit00_VERANSTALTUNG_SEQ
          MINVALUE 1
          START WITH 1
          INCREMENT BY 1
          CACHE 10;
          
CREATE SEQUENCE glkeit00_MODUL_SEQ
          MINVALUE 1000
          START WITH 1000
          INCREMENT BY 1
          CACHE 10;

CREATE TABLE glkeit00_AUFGABEN
        ( AUFGABENID VARCHAR(40) NOT NULL
        , AUFGABENNAME VARCHAR(40)
        , AUFGABENSWS INTEGER
        , DOZENTID INTEGER
        , LASTNAME varchar(40)
        , ZEITSEMESTERID VARCHAR(40) NOT NULL
        );
CREATE TABLE glkeit00_DOZENT
        ( DOZENTID INTEGER NOT NULL
        , LASTNAME VARCHAR(40) NOT NULL
        , FIRSTNAME VARCHAR(40)
        , FAKULTAETID CHAR(2)
        );
CREATE TABLE glkeit00_FAKULTAET
        ( FAKULTAETID CHAR(2) NOT NULL
        );
CREATE TABLE glkeit00_IST_VERANTWORTLICH
        ( SPOID CHAR(4) NOT NULL
        , MODULID INTEGER NOT NULL
        , DOZENTID INTEGER NOT NULL
        , LASTNAME VARCHAR(40) NOT NULL
        , TEILGEBIET VARCHAR(40) NOT NULL
        );
CREATE TABLE glkeit00_LB
        ( DOZENTID INTEGER NOT NULL
        , ZEITSEMESTERID VARCHAR(40) NOT NULL
        , LASTNAME VARCHAR(40) NOT NULL
        , EINTRITTSZEIT_LB DATE
        );
CREATE TABLE glkeit00_MODUL
        ( SPOID CHAR(4) NOT NULL
        , MODULID INTEGER NOT NULL
        , TEILGEBIET VARCHAR(40) NOT NULL
        , MODULTITEL VARCHAR(40)
        );
CREATE TABLE glkeit00_MODUL_SPO
        ( MODULID INTEGER NOT NULL
        , TEILGEBIET VARCHAR(40) NOT NULL
        , SPOID CHAR(4) NOT NULL
        , SEMESTER INTEGER NOT NULL
        , SWS INTEGER
        );
CREATE TABLE glkeit00_PROF
        ( DOZENTID INTEGER NOT NULL
        , LASTNAME VARCHAR(40) NOT NULL
        , EINTRITTSZEIT_PROF DATE
        );
CREATE TABLE glkeit00_PROF_ZEITSEMESTER
        ( DEPUTAT INTEGER NOT NULL
        , DOZENTID INTEGER NOT NULL
        , ZEITSEMESTERID VARCHAR(40) NOT NULL
        , LASTNAME VARCHAR(40) NOT NULL
        , KONTOSTANDVORSEMESTER INTEGER WITH DEFAULT 0
        );
CREATE TABLE glkeit00_SPO
        ( SPOID CHAR(4) NOT NULL
        , FAKULTAETID CHAR(2) NOT NULL
        );
CREATE TABLE glkeit00_VERANSTALTUNG
        ( VERANSTALTUNGSID INTEGER NOT NULL --PK
        , ZEITSEMESTERID VARCHAR(40) NOT NULL -- AKADHJ
        , MODULID INTEGER NOT NULL
        , TEILGEBIET VARCHAR(40) NOT NULL
        , SPOID CHAR(4) NOT NULL
        , SEMESTER INTEGER NOT NULL
        , RAUM VARCHAR(10) NOT NULL
        , TAG CHAR(2) NOT NULL
        , STUNDE INTEGER NOT NULL
        );
CREATE TABLE glkeit00_HAT
        ( VERANSTALTUNGSSWS INTEGER NOT NULL
        , DOZENTID INTEGER NOT NULL
        , LASTNAME VARCHAR(40) NOT NULL
        , VERANSTALTUNGSID INTEGER NOT NULL
        , TEILGEBIET VARCHAR(40) NOT NULL
        , ZEITSEMESTERID VARCHAR(40) NOT NULL -- AKADHJ
        , RAUM VARCHAR(10) NOT NULL
        , TAG CHAR(2) NOT NULL
        , STUNDE INTEGER NOT NULL
        );
CREATE TABLE glkeit00_ZEITSEMESTER
        ( ZEITSEMESTERID VARCHAR(40) NOT NULL
        );
ALTER TABLE glkeit00_AUFGABEN
        ADD CONSTRAINT PK_AUFGABEN PRIMARY KEY
        ( AUFGABENID
        );
ALTER TABLE glkeit00_DOZENT
        ADD CONSTRAINT PK_DOZENT PRIMARY KEY
        ( DOZENTID
        , LASTNAME
        );
ALTER TABLE glkeit00_FAKULTAET
        ADD CONSTRAINT PK_FAKULTAET PRIMARY KEY
        ( FAKULTAETID
        );
ALTER TABLE glkeit00_LB
        ADD CONSTRAINT PK_LB PRIMARY KEY
        ( DOZENTID
        , LASTNAME
        );
ALTER TABLE glkeit00_MODUL
        ADD CONSTRAINT PK_MODUL PRIMARY KEY
        ( SPOID
        , MODULID
        , TEILGEBIET
        );
ALTER TABLE glkeit00_MODUL_SPO
        ADD CONSTRAINT PK_MODUL PRIMARY KEY
        ( MODULID
        , TEILGEBIET
        , SEMESTER
        , SPOID
        );
ALTER TABLE glkeit00_PROF
        ADD CONSTRAINT PK_PROF PRIMARY KEY
        ( DOZENTID
        , LASTNAME
        );
ALTER TABLE glkeit00_SPO
        ADD CONSTRAINT PK_SPO PRIMARY KEY
        ( SPOID
        );
ALTER TABLE glkeit00_ZEITSEMESTER
        ADD CONSTRAINT PK_ZEITSEMESTER PRIMARY KEY
        ( ZEITSEMESTERID
        );
ALTER TABLE glkeit00_VERANSTALTUNG
        ADD CONSTRAINT PK_VERANSTALTUNG PRIMARY KEY
        ( VERANSTALTUNGSID --STDPL
        );
ALTER TABLE glkeit00_AUFGABEN
        ADD CONSTRAINT AUFGABEN_ZEITSEMESTERID FOREIGN KEY
        ( ZEITSEMESTERID )
        REFERENCES glkeit00_ZEITSEMESTER
        ( ZEITSEMESTERID
        );
ALTER TABLE glkeit00_AUFGABEN
        ADD CONSTRAINT AUFGABEN_PROFID FOREIGN KEY
        ( DOZENTID
        , LASTNAME )
        REFERENCES glkeit00_PROF
        ( DOZENTID
        , LASTNAME
        );
ALTER TABLE glkeit00_DOZENT
        ADD CONSTRAINT DOZENT_FAKULTAET FOREIGN KEY
        ( FAKULTAETID )
        REFERENCES glkeit00_FAKULTAET
        ( FAKULTAETID
        );
ALTER TABLE glkeit00_HAT
        ADD CONSTRAINT HAT_DOZENT FOREIGN KEY
        ( DOZENTID
        , LASTNAME )
        REFERENCES glkeit00_DOZENT
        ( DOZENTID
        , LASTNAME
        );
        
ALTER TABLE glkeit00_HAT
        ADD CONSTRAINT HAT_VERANSTALTUNG FOREIGN KEY
        ( VERANSTALTUNGSID
        )
        REFERENCES glkeit00_VERANSTALTUNG
        ( VERANSTALTUNGSID
        );
ALTER TABLE glkeit00_IST_VERANTWORTLICH
        ADD CONSTRAINT IST_VERANTWORTLICH_MODUL FOREIGN KEY
        ( SPOID, MODULID, TEILGEBIET )
        REFERENCES glkeit00_MODUL
        ( SPOID, MODULID, TEILGEBIET
        );
ALTER TABLE glkeit00_IST_VERANTWORTLICH
        ADD CONSTRAINT IST_VERANTWORTLICH_DOZENT FOREIGN KEY
        ( DOZENTID
        , LASTNAME )
        REFERENCES glkeit00_DOZENT
        ( DOZENTID
        , LASTNAME
        );
ALTER TABLE glkeit00_LB
        ADD CONSTRAINT LB_DOZENT FOREIGN KEY
        ( DOZENTID
        , LASTNAME )
        REFERENCES glkeit00_DOZENT
        ( DOZENTID
        , LASTNAME )
        ON DELETE CASCADE;
ALTER TABLE glkeit00_LB
        ADD CONSTRAINT LB_ZEITSEMESTER FOREIGN KEY
        ( ZEITSEMESTERID )
        REFERENCES glkeit00_ZEITSEMESTER
        ( ZEITSEMESTERID
        );
ALTER TABLE glkeit00_MODUL
        ADD CONSTRAINT GET_SPOID FOREIGN KEY
        ( SPOID )
        REFERENCES glkeit00_SPO
        ( SPOID
        );
ALTER TABLE glkeit00_MODUL_SPO
        ADD CONSTRAINT SPO_MODULID FOREIGN KEY
        ( SPOID
        , MODULID
        , TEILGEBIET )
        REFERENCES glkeit00_MODUL
        ( SPOID
        , MODULID
        , TEILGEBIET
        );
ALTER TABLE glkeit00_MODUL_SPO
        ADD CONSTRAINT MODUL_SPO FOREIGN KEY
        ( SPOID )
        REFERENCES glkeit00_SPO
        ( SPOID
        );
ALTER TABLE glkeit00_PROF
        ADD CONSTRAINT PROF_DOZENT FOREIGN KEY
        ( DOZENTID
        , LASTNAME )
        REFERENCES glkeit00_DOZENT
        ( DOZENTID
        , LASTNAME )
        ON DELETE CASCADE
        ;
ALTER TABLE glkeit00_PROF_ZEITSEMESTER
        ADD CONSTRAINT PROF_ZEITSEMESTER_PROF FOREIGN KEY
        ( DOZENTID
        , LASTNAME )
        REFERENCES glkeit00_PROF
        ( DOZENTID
        , LASTNAME
        );
ALTER TABLE glkeit00_PROF_ZEITSEMESTER
        ADD CONSTRAINT PROF_ZEITSEMESTER_ZEITSEMESTER FOREIGN KEY
        ( ZEITSEMESTERID )
        REFERENCES glkeit00_ZEITSEMESTER
        ( ZEITSEMESTERID
        );
ALTER TABLE glkeit00_SPO
        ADD CONSTRAINT SPO_FAKULTAET FOREIGN KEY
        ( FAKULTAETID )
        REFERENCES glkeit00_FAKULTAET
        ( FAKULTAETID
        );
ALTER TABLE glkeit00_VERANSTALTUNG
        ADD CONSTRAINT VERANSTALTUNG_ZEITSEMESTER FOREIGN KEY
        ( ZEITSEMESTERID )
        REFERENCES glkeit00_ZEITSEMESTER
        ( ZEITSEMESTERID
        );
ALTER TABLE glkeit00_VERANSTALTUNG
        ADD CONSTRAINT VERANSTALTUNG_MODULELEMENT FOREIGN KEY
        ( MODULID
        , TEILGEBIET
        , SPOID
        , SEMESTER
        )
        REFERENCES glkeit00_MODUL_SPO
        ( MODULID
        , TEILGEBIET
        , SPOID
        , SEMESTER
        );

CONNECT RESET;
