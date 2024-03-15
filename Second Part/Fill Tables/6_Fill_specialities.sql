USE _Institute_;

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = 'Факультет информатики'),
		'Программирование и разработка риложений',
		'Разработчик программного обеспечения'
		);

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = 'Факультет экономики'),
		'Международные экономические отношения',
		'Специалист по международной экономике'
	);

INSERT INTO specialities(faculty_id, title, qualification)
	VALUES(
		(SELECT id FROM faculties WHERE title = 'Факультет искусств'),
		'Современное искусство и дизайн',
		'Дизайнер'
	);