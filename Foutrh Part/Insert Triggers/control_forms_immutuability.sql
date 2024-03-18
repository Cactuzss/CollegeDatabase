CREATE TRIGGER control_forms_IMMUTUABILITY
ON control_forms
INSTEAD OF INSERT
AS
BEGIN
	BEGIN TRY
    	THROW 51005, 'Control forms are immutuable, if you want to change something, disable the trigger', 1
	END TRY

	BEGIN CATCH
    IF @@ERROR != 0
    	PRINT @@ERROR
		ROLLBACK TRANSACTION
	END CATCH
END