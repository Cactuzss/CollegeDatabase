USE _Institute_;

INSERT INTO students(full_name, birth_date, contact_mail, contact_phone, faculty_id, speciality_id)
	VALUES(
		'������ ���� ��������',
		'2002-05-20',
		'ivanov@gmail.com',
		'+79001234567',
		(SELECT id FROM faculties WHERE title = '��������� �����������'),
		(SELECT id FROM specialities WHERE title = '���������������� � ���������� ����������')
	);

INSERT INTO students(full_name, birth_date, contact_mail, contact_phone, faculty_id, speciality_id)
	VALUES(
		'�������� ����� ��������',
		'2003-06-15',
		'smirnova@gmail.com',
		'+79007654321',
		(SELECT id FROM faculties WHERE title = '��������� ���������'),
		(SELECT id FROM specialities WHERE title = '������������� ������������� ���������')
	);
	
INSERT INTO students(full_name, birth_date, contact_mail, contact_phone, faculty_id, speciality_id)
	VALUES(
		'����� ������� ���������',
		'2002-07-30',
		'popov@gmail.com',
		'+79001112233',
		(SELECT id FROM faculties WHERE title = '��������� ��������'),
		(SELECT id FROM specialities WHERE title = '����������� ��������� � ������')
	);