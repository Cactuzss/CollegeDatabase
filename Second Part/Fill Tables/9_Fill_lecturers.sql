USE _Institute_;

INSERT INTO lecturers(full_name, degree, contact_mail, contact_phone, departament_id)
	VALUES(
		'������� ��������� ��������',
		'������ ����������� ����',
		'smirnov@university.com',
		'+79001234567',
		(SELECT id FROM departaments WHERE title = '������� ����������� ���������')
	);
	
INSERT INTO lecturers(full_name, degree, contact_mail, contact_phone, departament_id)
	VALUES(
		'������� ����� ���������',
		'������ ����������� ����',
		'petrova@university.com',
		'+79007654321',
		(SELECT id FROM departaments WHERE title = '������� �������������� ������������')
	);
	
INSERT INTO lecturers(full_name, degree, contact_mail, contact_phone, departament_id)
	VALUES(
		'������ ������ ��������',
		'������ ����������������',
		'ivanov@university.com',
		'+79001112233',
		(SELECT id FROM departaments WHERE title = '������� ������������ ���������')
	);