USE _Institute_;


INSERT INTO grades(student_id, discipline_id, result)
	VALUES(
		(SELECT id FROM students WHERE full_name = '������ ���� ��������'),
		(SELECT id FROM disciplines WHERE title = '������������ ����'),
		'�����'
	);