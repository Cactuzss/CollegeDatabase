USE _Institute_;

INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = '��������� �����������'),
		'������� ����������� ���������',
		'����������� ���� ��������',
		'dept-software@university.com',
		'+92782406295'
	);

INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = '��������� �����������'),
		'������� �������������� ������������',
		'������ ������ ������������',
		'dept-security@university.com',
		'+79202164290'
	);

INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = '��������� ��������'),
		'������� ������������ ���������',
		'������ ��������� ���������',
		'dept-modernart@university.com',
		'+74829052894'
	);