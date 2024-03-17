USE _Institute_;

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