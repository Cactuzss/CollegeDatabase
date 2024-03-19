USE _Institute_;


INSERT INTO grades(student_id, discipline_id, result)
	VALUES(
		(SELECT id FROM students WHERE full_name = 'Иванов Иван Иванович'),
		(SELECT id FROM disciplines WHERE title = 'Компьютерные сети'),
		'Зачёт'
	);