-- CREATE DATABASE _Institute_;

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
	contact_phone	VARCHAR(16),
	adress_id	INTEGER FOREIGN KEY REFERENCES adresses(id),
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




INSERT INTO faculties(title, dean, contact_mail, contact_phone)
	VALUES(
		'Факультет информатики',
		'Иванов Иван Иванович',
		'dean@cs-faculty.com',
		'+1234567890'
	);
	
INSERT INTO faculties(title, dean, contact_mail, contact_phone)
	VALUES(
		'Факультет искусств',
		'Петров Петр Петрович',
		'dean@arts-faculty.com',
		'+0987654321'
	);
	
INSERT INTO faculties(title, dean, contact_mail, contact_phone)
	VALUES(
		'Факультет экономики',
		'Сидоров Сидр Сидорович',
		'dean@economics-faculty.com',
		'+1122334455'
	);
	
	
	

INSERT INTO control_forms(title, descript)
	VALUES(
		'Экзамен',
		'Итоговая форма оценки знаний.'
	);

INSERT INTO control_forms(title, descript)
	VALUES(
		'Зачёт',
		'Форма проверки знаний обучающихся. Вместо выставлени¤ отметки, при успешном прохождении зачёта в ведомость и зачётную книжку ставится пометка об успешном прохождении испытания по учебной дисциплине или её разделу'
	);

INSERT INTO control_forms(title, descript)
	VALUES(
		'Дифференцированный зачёт',
		'Форма итогового (промежуточного) контроля, которая предусматривает оценивание усвоени¤ студентами обучающего материала по определЄнной учебной дисциплине на основании результатов выполненных ими индивидуальных заданий.'
	);




INSERT INTO adresses(city, district, street, house_number)
	VALUES(
		'Вавучинск',
		'Днепропетровский',
		'Улица Карла CJ',
		'12/1'
	);

INSERT INTO adresses(city, district, street, house_number)
	VALUES(
		'Вавучинск',
		'Днепропетровский',
		'Вгунгавская',
		'42'
	);

INSERT INTO adresses(city, district, street, house_number)
	VALUES(
		'Вавучинск',
		'Тот-самый',
		'Дом',
		'1'
	);






INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone, adress_id)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет информатики'),
		'Петров Иван Петрович',
		'pevan@sobaka.mail',
		'+89012421232',
      	(SELECT id FROM adresses WHERE adresses.street = 'Улица Карла CJ')
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone, adress_id)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет искусств'),
		'Пандов Вячеслав Станиславович',
		'pandusvladislav@pochta.kva',
		'+28421404012',
      	(SELECT id FROM adresses WHERE adresses.street = 'Вгунгавская')
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone, adress_id)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет экономики'),
		'Фамилия Ольга Константиновна',
		'kolyailitolya@chto.to',
		'+190212449202',
      	(SELECT id FROM adresses WHERE adresses.street = 'Дом')
	);
	
	
	

INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет информатики'),
		'Кафедра программной инженерии',
		'Вавучинский Иван Петрович',
		'dept-software@university.com',
		'+92782406295'
	);

INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет информатики'),
		'Кафедра информационной безопасности',
		'Волков Михаил Владимирович',
		'dept-security@university.com',
		'+79202164290'
	);

INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет искусств'),
		'Кафедра современного искусства',
		'Егоров Александр Сергеевич',
		'dept-modernart@university.com',
		'+74829052894'
	);
	
	
	
	
	

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = 'Факультет информатики'),
		'Программирование и разработка риложений',
		'Разработчик программного обеспечения'
		);

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = 'Факультет экономики'),
		'Международные экономические отношения',
		'Специалист по международной экономике'
	);

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = 'Факультет искусств'),
		'Современное искусство и дизайн',
		'Дизайнер'
	);
	
	
	
	
	

INSERT INTO students(full_name, birth_date, contact_mail, contact_phone, faculty_id, speciality_id)
	VALUES(
		'Иванов Иван Иванович',
		'2002-05-20',
		'ivanov@gmail.com',
		'+79001234567',
		(SELECT id FROM faculties WHERE title = 'Факультет информатики'),
		(SELECT id FROM specialities WHERE title = 'Программирование и разработка приложений')
	);

INSERT INTO students(full_name, birth_date, contact_mail, contact_phone, faculty_id, speciality_id)
	VALUES(
		'Смирнова Мария Петровна',
		'2003-06-15',
		'smirnova@gmail.com',
		'+79007654321',
		(SELECT id FROM faculties WHERE title = 'Факультет экономики'),
		(SELECT id FROM specialities WHERE title = 'Международные экономические отношения')
	);
	
INSERT INTO students(full_name, birth_date, contact_mail, contact_phone, faculty_id, speciality_id)
	VALUES(
		'Попов Алексей Сергеевич',
		'2002-07-30',
		'popov@gmail.com',
		'+79001112233',
		(SELECT id FROM faculties WHERE title = 'Факультет искусств'),
		(SELECT id FROM specialities WHERE title = 'Современное искусство и дизайн')
	);
	
	
	

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'Программирование на Python',
		120,
		'Основы программирования на языке Python, включая синтаксис, структуры данных, функции и классы',
		(SELECT id FROM departaments WHERE title = 'Кафедра программной инженерии'),
		(SELECT id FROM control_forms WHERE title = 'Экзамен')
	);

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'Компьютерные сети',
		80,
		'Изучение основ работы и проектирования компьютерных сетей. Включает в себя основы протоколов передачи данных, концепций сетевой безопасности и методов управления сетью',
		(SELECT id FROM departaments WHERE title = 'Кафедра информационной безопасности'),
		(SELECT id FROM control_forms WHERE title = 'Зачёт')
	);

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'Современное искусство',
		100,
		'Изучение основных течений и направлений в современном искусстве, включая анализ ключевых произведений',
		(SELECT id FROM departaments WHERE title = 'Кафедра современного искусства'),
		(SELECT id FROM control_forms WHERE title = 'Дифференцированный зачёт')
	);



INSERT INTO lecturers(full_name, degree, contact_mail, contact_phone, departament_id)
	VALUES(
		'Смирнов Александр Иванович',
		'доктор технических наук',
		'smirnov@university.com',
		'+79001234567',
		(SELECT id FROM departaments WHERE title = 'Кафедра программной инженерии')
	);
	
INSERT INTO lecturers(full_name, degree, contact_mail, contact_phone, departament_id)
	VALUES(
		'Петрова Елена Сергеевна',
		'доктор технических наук',
		'petrova@university.com',
		'+79007654321',
		(SELECT id FROM departaments WHERE title = 'Кафедра информационной безопасности')
	);
	
INSERT INTO lecturers(full_name, degree, contact_mail, contact_phone, departament_id)
	VALUES(
		'Иванов Сергей Петрович',
		'доктор искусствоведения',
		'ivanov@university.com',
		'+79001112233',
		(SELECT id FROM departaments WHERE title = 'Кафедра современного искусства')
	);
	
	
	
INSERT INTO groups(year_of_study, speciality_id, curator_id)
	VALUES(
		1,
		(SELECT id FROM specialities WHERE title = 'Программирование и разработка приложений'),
		(SELECT id FROM lecturers WHERE full_name = 'Смирнов Александр Иванович')
	);
	

INSERT INTO groups(year_of_study, speciality_id, curator_id)
	VALUES(
		2,
		(SELECT id FROM specialities WHERE title = 'Программирование и разработка приложений'),
		(SELECT id FROM lecturers WHERE full_name = 'Петрова Елена Сергеевна')
	);
	

INSERT INTO groups(year_of_study, speciality_id, curator_id)
	VALUES(
		1,
		(SELECT id FROM specialities WHERE title = 'Современное искусство и дизайн'),
		(SELECT id FROM lecturers WHERE full_name = 'Иванов Сергей Петрович')
	);
	
	
	
UPDATE groups
SET headman_id = (SELECT id FROM students WHERE full_name = 'Иванов Иван Иванович')
WHERE curator_id = (SELECT id FROM lecturers WHERE full_name = 'Смирнов Александр Иванович')

UPDATE groups
SET headman_id = (SELECT id FROM students WHERE full_name = 'Смирнова Мария Петровна')
WHERE curator_id = (SELECT id FROM lecturers WHERE full_name = 'Петрова Елена Сергеевна')

UPDATE groups
SET headman_id = (SELECT id FROM students WHERE full_name = 'Попов Алексей Сергеевич')
WHERE curator_id = (SELECT id FROM lecturers WHERE full_name = 'Иванов Сергей Петрович')




UPDATE students
SET group_id =	(SELECT id FROM groups WHERE curator_id = 
				(SELECT id FROM lecturers WHERE full_name = 'Смирнов Александр Иванович'))
WHERE full_name = 'Иванов Иван Иванович'

UPDATE students
SET group_id =	(SELECT id FROM groups WHERE curator_id = 
				(SELECT id FROM lecturers WHERE full_name = 'Петрова Елена Сергеевна'))
WHERE full_name = 'Смирнова Мария Петровна'

UPDATE students
SET group_id =	(SELECT id FROM groups WHERE curator_id = 
				(SELECT id FROM lecturers WHERE full_name = 'Иванов Сергей Петрович'))
WHERE full_name = 'Попов Алексей Сергеевич'



INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = 'Программирование на Python'),
		(SELECT id FROM lecturers WHERE full_name = 'Смирнов Александр Иванович')
	);
	
INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = 'Компьютерные сети'),
		(SELECT id FROM lecturers WHERE full_name = 'Смирнов Александр Иванович')
	);
	

INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = 'Компьютерные сети'),
		(SELECT id FROM lecturers WHERE full_name = 'Петрова Елена Сергеевна')
	);


INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = 'Современное искусство'),
		(SELECT id FROM lecturers WHERE full_name = 'Иванов Сергей Петрович')
	);




INSERT INTO grades(student_id, discipline_id, result)
	VALUES(
		(SELECT id FROM students WHERE full_name = 'Иванов Иван Иванович'),
		(SELECT id FROM disciplines WHERE title = 'Компьютерные сети'),
		'Зачёт'
	);
