USE _Institute_;

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = '��������� �����������'),
		'���������������� � ���������� ���������',
		'����������� ������������ �����������'
		);

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = '��������� ���������'),
		'������������� ������������� ���������',
		'���������� �� ������������� ���������'
	);

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = '��������� ��������'),
		'����������� ��������� � ������',
		'��������'
	);