CREATE TRIGGER faculties_PHONES
ON faculties
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @phone VARCHAR(16)
	SELECT @phone = contact_phone FROM inserted
    
	DECLARE @error_message INT = 51006

	BEGIN TRY
		IF UNICODE(@phone) != UNICODE('+')
        	THROW @error_message, 'Phone numbers should be in +7... format', 1
    
    	INSERT INTO faculties(title, dean, contact_mail, contact_phone)
   		SELECT title, dean, contact_mail, contact_phone FROM inserted
	END TRY
    BEGIN CATCH
    IF @@ERROR != 0
    	PRINT @@ERROR
		ROLLBACK TRANSACTION
	END CATCH
END