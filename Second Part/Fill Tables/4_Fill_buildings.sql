USE _Institute_;

INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет информатики'),
		'Петров Иван Петрович',
		'pevan@sobaka.mail',
		'+89012421232'
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет искусств'),
		'Пандов Вячеслав Станиславович',
		'pandusvladislav@pochta.kva',
		'+28421404012'
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет экономики'),
		'Фамилия Ольга Константиновна',
		'kolyailitolya@chto.to',
		'+190212449202'
	);