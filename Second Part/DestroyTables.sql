USE _Institute_;

DROP TABLE grades;
DROP TABLE disciplines_lecturers;
DROP TABLE disciplines;
DROP TABLE buildings;
DROP TABLE adresses;
DROP TABLE control_forms;

ALTER TABLE students DROP CONSTRAINT group_id;
ALTER TABLE students DROP COLUMN group_id;

DROP TABLE groups;
DROP TABLE students;
DROP TABLE lecturers;
DROP TABLE departaments;
DROP TABLE specialities;
DROP TABLE faculties;