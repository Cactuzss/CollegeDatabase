USE _Institute_;

INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone, adress_id)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет информатики'),
		'Петров Иван Петрович',
		'pevan@sobaka.mail',
		'+89012421232',
      	(SELECT id FROM adresses WHERE adresses.street = 'Улица Карла CJ')
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone, adress_id)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет искусств'),
		'Пандов Вячеслав Станиславович',
		'pandusvladislav@pochta.kva',
		'+28421404012',
      	(SELECT id FROM adresses WHERE adresses.street = 'Вгунгавская')
	);
	
INSERT INTO buildings(faculty_id, director_name, contact_mail, contact_phone, adress_id)
	VALUES(
		(SELECT id FROM faculties WHERE faculties.title = 'Факультет экономики'),
		'Фамилия Ольга Константиновна',
		'kolyailitolya@chto.to',
		'+190212449202',
      	(SELECT id FROM adresses WHERE adresses.street = 'Дом')
	);
