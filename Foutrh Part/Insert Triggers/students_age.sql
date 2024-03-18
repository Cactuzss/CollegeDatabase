CREATE TRIGGER student_AGE_CHECK
ON students
INSTEAD OF INSERT
AS
BEGIN
  DECLARE @birth_date date;
  SELECT @birth_date = birth_date FROM inserted;
  BEGIN TRY
	IF DATEDIFF(year, @birth_date, GETDATE()) < 18
		THROW 51001, 'Student must be more than 18 years old', 1

	INSERT INTO grades
	SELECT * FROM inserted;

  END TRY
  BEGIN CATCH
	PRINT @@ERROR;
    ROLLBACK TRANSACTION;
  END CATCH;
END;