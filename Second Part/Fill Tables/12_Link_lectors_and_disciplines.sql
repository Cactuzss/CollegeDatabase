USE _Institute_;

INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = '���������������� �� Python'),
		(SELECT id FROM lecturers WHERE full_name = '������� ��������� ��������')
	);
	
INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = '������������ ����'),
		(SELECT id FROM lecturers WHERE full_name = '������� ��������� ��������')
	);
	

INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = '������������ ����'),
		(SELECT id FROM lecturers WHERE full_name = '������� ����� ���������')
	);


INSERT INTO disciplines_lecturers(discipline_id, lecturer_id)
	VALUES(
		(SELECT id FROM disciplines WHERE title = '����������� ���������'),
		(SELECT id FROM lecturers WHERE full_name = '������ ������ ��������')
	);
