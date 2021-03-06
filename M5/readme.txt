-------------------------------------------------
----- Übersicht über enthaltene Dateien:
-------------------------------------------------

mission objectives.txt			----- Enthält Zielsetzungen für das Projekt.
requirements.txt			----- Enthält Anforderungen an das DBSystem.

group_structure.csv			----- Enthält die Gruppenaufteilung.
user_views.csv				----- Enthält die Userviews.
list_of_entities.csv        ----- Enthält eine Beschreibung aller Entitäten.
list_of_relationships.csv     ----- Enthält eine Liste aller Relationen.

lecture_planner-logical_datamodel.png	----- Abbildung des logischen Datenmodells in Crawfoot.
lecture_planner-physical_datamodel.png	----- Abbildung des physischen Datenmodells in Crawfoot.
lecture_planner_conceptual_chen.png	----- Abbildung des konzeptionellen Datenmodells in Chen.

restart.txt 		----- Enthält DB2-Konsolen Code. Gibt die Reihenfolge vor, in welcher die SQL Dateien auszuführen sind.
create_lecture_planner.sql			----- Enthält das DBSchema (Tabellen, Primärschlüssel, etc)
constraints_check.sql 				----- Enthält Check Constraints, welche mögliche Spatenwerte eingrenzen.
trigger_checks.sql				----- Enthält für Trigger.
drop.sql				----- Enthält sql-Code um sämtliche Tabellen, Trigger & Sequenzen aus der Datenbank zu entfernen.
import_testdata.sql 			----- Enthält sql-Code um Testdaten aus Testtabellen in das DBSystem zu importieren.
report_19_deputat.sql				----- Enthält Code für den Deputats Report.
report_20_list-modules.sql            ----- Enthält Code für den Report zum Anzeigen aller Module eines Studiengangs.
report_21_list-Lehrbeauftragte        ----- Enthält Code für den Report zum Anzeigen der Externen Lehrbeauftragten.
report_22_angebotene_dienste.sql      ----- Enthält Code für den Report zum Anzeigen von für andere Fakultäten angebotene Dienste.
report_23_used_services.sql           ----- Enthält Code für den Report zum Anzeigen von externen Diensten die eine Fakultät annimmt.


-------------------------------------------------
----- Voraussetzungen
-------------------------------------------------

Sämtliche .sql Dateien müssen sich im selben Verzeichnis befinden.
Die Testdaten müssen als Tabellen mit folgenden Namen in der Datenbank vorliegen:
  - 'TD_DOZENTEN' enthält die Daten der Dozenten.
  - 'TD_SPO' enthält die Daten einer SPO.
  - 'TD_STPL' enthält die Daten für Vorlesungen eines Semesters.


-------------------------------------------------
----- Anleitung
-------------------------------------------------

Die SQL-Dateien müssen in der Reihenfolge ausgeführt werden, wie in 'restart.txt' beschrieben.
Diese Datei enthält bereits vorgefertigte DB2 Konsolen Befehle.
Der 1. Schritt (Ausführen von 'drop.sql') ist nur nötig, falls bereits Tabellen, Trigger oder Sequenzen erstellt wurden. Ansonsten kann dieser Befehl ausgelassen werden.

Zum Erzeugen der Reports muss die jeweilige .sql Datei ausgeführt werden (siehe Liste der enthaltenen Dateien). Um Parameter zu spezifizieren muss das jeweilige Parameter in der WHERE-clause geändert werden.
