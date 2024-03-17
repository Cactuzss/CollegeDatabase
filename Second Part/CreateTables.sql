				-- Obviously should be executed after database creation
USE _Institute_;

CREATE TABLE faculties(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	title			VARCHAR(64),
	dean			VARCHAR(64),
	contact_mail	VARCHAR(64),
	contact_phone	VARCHAR(16)
);

CREATE TABLE adresses(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	city			VARCHAR(64),
	district		VARCHAR(64),
	street			VARCHAR(128),
	house_number	VARCHAR(16),									-- in case of something like "XD HOUSE NUMERO 12/1"
);

CREATE TABLE control_forms(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	title			VARCHAR(128),
	descript		VARCHAR(256)
);

CREATE TABLE buildings(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	faculty_id		INTEGER FOREIGN KEY REFERENCES faculties(id),
	director_name	VARCHAR(64),
	contact_mail	VARCHAR(64),
	contact_phone	VARCHAR(16)
);

CREATE TABLE specialities(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	faculty_id		INTEGER FOREIGN KEY REFERENCES faculties(id),
	title			VARCHAR(64),
	qualification	VARCHAR(64)
);

CREATE TABLE departaments(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	faculty_id		INTEGER FOREIGN KEY REFERENCES faculties(id),
	title			VARCHAR(64),
	director		VARCHAR(64),
	contact_mail	VARCHAR(64),
	contact_phone	VARCHAR(16)
);

CREATE TABLE students(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	faculty_id		INTEGER FOREIGN KEY REFERENCES faculties(id),
	speciality_id	INTEGER FOREIGN KEY REFERENCES specialities(id),
	group_id		INTEGER,
	full_name		VARCHAR(64),
	birth_date		DATE,
	contact_mail	VARCHAR(64),
	contact_phone	VARCHAR(16)
);

CREATE TABLE lecturers(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	departament_id	INTEGER FOREIGN KEY REFERENCES departaments(id),
	full_name		VARCHAR(64),
	degree			VARCHAR(64),
	contact_mail	VARCHAR(64),
	contact_phone	VARCHAR(16)
);

CREATE TABLE groups(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	speciality_id	INTEGER FOREIGN KEY REFERENCES specialities(id),
	curator_id		INTEGER FOREIGN KEY REFERENCES lecturers(id),
	headman_id		INTEGER FOREIGN KEY REFERENCES students(id),
	year_of_study	INTEGER
);

--==================================================--
ALTER TABLE students
	ADD CONSTRAINT group_id FOREIGN KEY (group_id)
	REFERENCES groups(id);
--==================================================--

CREATE TABLE disciplines(
	id				INTEGER PRIMARY KEY IDENTITY(0, 1) NOT NULL,
	departament_id	INTEGER FOREIGN KEY REFERENCES departaments(id),
	control_fofm_id	INTEGER FOREIGN KEY REFERENCES control_forms(id),
	title			VARCHAR(64),
	hours_of_study	INTEGER,
	descript		TEXT
);

CREATE TABLE disciplines_lecturers(
	discipline_id	INTEGER FOREIGN KEY REFERENCES disciplines(id),
	lecturer_id		INTEGER FOREIGN KEY REFERENCES lecturers(id),
);

CREATE TABLE grades(
	student_id		INTEGER FOREIGN KEY REFERENCES students(id),
	discipline_id	INTEGER FOREIGN KEY REFERENCES disciplines(id),
	result			VARCHAR(64)
);
