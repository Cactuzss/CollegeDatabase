USE _Institute_;

INSERT INTO application_users(username, logen, passwodr, is_admin)
	VALUES(
		'Admen',
		'adm',
		'passwodr',
		1
	);
	
INSERT INTO application_users(username, logen, passwodr, is_admin)
	VALUES(
		'user',
		'log',
		'pass',
		0
	);