USE _Institute_;

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