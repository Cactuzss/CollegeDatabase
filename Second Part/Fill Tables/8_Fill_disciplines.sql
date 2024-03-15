USE _Institute_;

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'���������������� �� Python',
		120,
		'������ ���������������� �� ����� Python, ������� ���������, ��������� ������, ������� � ������',
		(SELECT id FROM departaments WHERE title = '������� ����������� ���������'),
		(SELECT id FROM control_forms WHERE title = '�������')
	);

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'������������ ����',
		80,
		'�������� ����� ������ � �������������� ������������ �����. �������� � ���� ������ ���������� �������� ������, ��������� ������� ������������ � ������� ���������� �����',
		(SELECT id FROM departaments WHERE title = '������� �������������� ������������'),
		(SELECT id FROM control_forms WHERE title = '�����')
	);

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'����������� ���������',
		100,
		'�������� �������� ������� � ����������� � ����������� ���������, ������� ������ �������� ������������',
		(SELECT id FROM departaments WHERE title = '������� ������������ ���������'),
		(SELECT id FROM control_forms WHERE title = '������������������ �����')
	);

