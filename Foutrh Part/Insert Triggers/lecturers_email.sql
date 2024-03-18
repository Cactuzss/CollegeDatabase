CREATE TRIGGER lecturers_EMAIL_CHECK
ON lecturers
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @inserted_mail VARCHAR(64)
	SELECT @inserted_mail = contact_mail FROM inserted

	BEGIN TRY;
		IF EXISTS(SELECT * FROM lecturers WHERE contact_mail = @inserted_mail)
        	THROW 51003, 'This email already exists', 1;
            
			INSERT INTO lecturers(departament_id, full_name, degree, contact_mail, contact_phone)
			SELECT departament_id, full_name, degree, contact_mail, contact_phone FROM inserted;
	END TRY

	BEGIN CATCH
    IF @@ERROR != 0
    	PRINT @@ERROR
		ROLLBACK TRANSACTION
	END CATCH
END