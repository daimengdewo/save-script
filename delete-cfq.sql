CREATE TRIGGER [dbo].[delete_trigger] ON [test].[dbo].[kaoqin]
FOR DELETE
AS 
                 DECLARE @ID varchar(50)
                 SELECT @ID =ID FROM DELETED ;
BEGIN
	 EXEC loopback .test. dbo.delete_kaoqin @ID;
END