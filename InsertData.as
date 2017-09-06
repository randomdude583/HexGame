package {

	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.events.*;
	import flash.filesystem.File;

	public class InsertData {

		function insertData(sqlConn:SQLConnection, dbInsert:String):void
		{
			var insertStmt:SQLStatement = new SQLStatement();
			insertStmt.sqlConnection = sqlConn;
			
			var sql:String = "INSERT INTO testtb (textInput) VALUES ('" + dbInsert + "')";
			insertStmt.text = sql;
			insertStmt.addEventListener(SQLEvent.RESULT, insertResult);
			insertStmt.addEventListener(SQLErrorEvent.ERROR, insertError);
			
			try
			{
				insertStmt.execute();
				//trace("Table created");
			}
			catch(error:SQLError)
			{
				//trace("Error message:", error.message);
				//trace("Error details:", error.details);
			}
		}

		function insertResult(evt:SQLEvent):void
		{
			trace("Entry inserted");
		}

		function insertError(evt:SQLErrorEvent):void
		{
			trace("Error message:", evt.error.message);
			trace("Details:", evt.error.details);
		}
	}
}