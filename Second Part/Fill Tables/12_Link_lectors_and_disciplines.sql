USE _Institute_;

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
