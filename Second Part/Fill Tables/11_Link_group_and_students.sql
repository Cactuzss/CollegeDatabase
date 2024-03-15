USE _Institute_;

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