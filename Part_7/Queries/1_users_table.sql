USE _Institute_;

CREATE TABLE application_users(
	id			INTEGER IDENTITY(0, 1) NOT NULL PRIMARY KEY,
	username	VARCHAR(64),
	logen		VARCHAR(64),
	passwodr	VARCHAR(64),
	is_admin	BIT
)