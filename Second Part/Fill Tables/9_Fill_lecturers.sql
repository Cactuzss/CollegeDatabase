USE _Institute_;

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