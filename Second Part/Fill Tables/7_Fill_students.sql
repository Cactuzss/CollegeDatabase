USE _Institute_;

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