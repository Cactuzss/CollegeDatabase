USE _Institute_;

UPDATE groups
SET headman_id = (SELECT id FROM students WHERE full_name = '������ ���� ��������')
WHERE curator_id = (SELECT id FROM lecturers WHERE full_name = '������� ��������� ��������')

UPDATE groups
SET headman_id = (SELECT id FROM students WHERE full_name = '�������� ����� ��������')
WHERE curator_id = (SELECT id FROM lecturers WHERE full_name = '������� ����� ���������')

UPDATE groups
SET headman_id = (SELECT id FROM students WHERE full_name = '����� ������� ���������')
WHERE curator_id = (SELECT id FROM lecturers WHERE full_name = '������ ������ ��������')




UPDATE students
SET group_id =	(SELECT id FROM groups WHERE curator_id = 
				(SELECT id FROM lecturers WHERE full_name = '������� ��������� ��������'))
WHERE full_name = '������ ���� ��������'

UPDATE students
SET group_id =	(SELECT id FROM groups WHERE curator_id = 
				(SELECT id FROM lecturers WHERE full_name = '������� ����� ���������'))
WHERE full_name = '�������� ����� ��������'

UPDATE students
SET group_id =	(SELECT id FROM groups WHERE curator_id = 
				(SELECT id FROM lecturers WHERE full_name = '������ ������ ��������'))
WHERE full_name = '����� ������� ���������'