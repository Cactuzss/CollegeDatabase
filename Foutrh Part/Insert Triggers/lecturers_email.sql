CREATE TRIGGER lecturers_EMAIL_CHECK
ON lecturers
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @inserted_mail VARCHAR(64);
	SELECT @inserted_mail = contact_mail FROM inserted;

	BEGIN TRY
		
	END TRY

	BEGIN CATCH
	END CATCH
END;