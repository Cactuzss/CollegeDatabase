CREATE TRIGGER adress_deletion
ON adresses
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @adress_id INT;
    SELECT @adress_id = id FROM deleted;
    
    UPDATE buildings
    set adress_id = NULL
    WHERE adress_id = @adress_id
    
    DELETE FROM adresses
    WHERE id = @adress_id
END;