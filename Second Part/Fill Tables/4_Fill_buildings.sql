USE _Institute_;

INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = '��������� �����������'),
		'������ ���� ��������',
		'pevan@sobaka.mail',
		'+89012421232'
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = '��������� ��������'),
		'������ �������� �������������',
		'pandusvladislav@pochta.kva',
		'+28421404012'
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = '��������� ���������'),
		'������� ����� ��������������',
		'kolyailitolya@chto.to',
		'+190212449202'
	);