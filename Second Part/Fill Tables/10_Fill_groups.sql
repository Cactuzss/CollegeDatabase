USE _Institute_;

INSERT INTO groups(year_of_study, speciality_id, curator_id)
	VALUES(
		1,
		(SELECT id FROM specialities WHERE title = '���������������� � ���������� ����������'),
		(SELECT id FROM lecturers WHERE full_name = '������� ��������� ��������')
	);
	

INSERT INTO groups(year_of_study, speciality_id, curator_id)
	VALUES(
		2,
		(SELECT id FROM specialities WHERE title = '���������������� � ���������� ����������'),
		(SELECT id FROM lecturers WHERE full_name = '������� ����� ���������')
	);
	

INSERT INTO groups(year_of_study, speciality_id, curator_id)
	VALUES(
		1,
		(SELECT id FROM specialities WHERE title = '����������� ��������� � ������'),
		(SELECT id FROM lecturers WHERE full_name = '������ ������ ��������')
	);