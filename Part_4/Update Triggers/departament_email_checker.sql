CREATE TRIGGER departament_CHECK_MAIL
ON departaments
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @inserted_email VARCHAR(64)
    SELECT @inserted_email = contact_mail FROM inserted
    
    DECLARE @error_code INT = 52001;
    
    BEGIN TRY
    	IF @inserted_email NOT LIKE '%@%.%'
        	THROW @error_code, 'Wrong email format', 1
            
        INSERT INTO departaments(faculty_id, title, director, contact_mail, contact_phone)
        SELECT faculty_id, title, director, contact_mail, contact_phone FROM inserted
    END TRY
    
    BEGIN CATCH
    	PRINT @error_code
		ROLLBACK TRANSACTION
    END CATCH
END