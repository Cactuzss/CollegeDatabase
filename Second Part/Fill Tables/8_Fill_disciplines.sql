USE _Institute_;

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'Программирование на Python',
		120,
		'Основы программирования на языке Python, включая синтаксис, структуры данных, функции и классы',
		(SELECT id FROM departaments WHERE title = 'Кафедра программной инженерии'),
		(SELECT id FROM control_forms WHERE title = 'Экзамен')
	);

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'Компьютерные сети',
		80,
		'Изучение основ работы и проектирования компьютерных сетей. Включает в себя основы протоколов передачи данных, концепций сетевой безопасности и методов управления сетью',
		(SELECT id FROM departaments WHERE title = 'Кафедра информационной безопасности'),
		(SELECT id FROM control_forms WHERE title = 'Зачёт')
	);

INSERT INTO disciplines(title, hours_of_study, descript, departament_id, control_fofm_id)
	VALUES(
		'Современное искусство',
		100,
		'Изучение основных течений и направлений в современном искусстве, включая анализ ключевых произведений',
		(SELECT id FROM departaments WHERE title = 'Кафедра современного искусства'),
		(SELECT id FROM control_forms WHERE title = 'Дифференцированный зачёт')
	);

