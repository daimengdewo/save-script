CREATE PROCEDURE [dbo].[delete_kaoqin]
@ID varchar(50)
AS
BEGIN
                 SET NOCOUNT ON
                 BEGIN  try
                                DELETE OPENQUERY (MYSQLTEST,'SELECT * FROM kaoqin ') where ID =@ID
                 END try
                 BEGIN catch
INSERT INTO LogTable values(ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(), ERROR_LINE() ,ERROR_MESSAGE());
                 END catch
                 SET NOCOUNT OFF
END