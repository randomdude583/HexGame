package {

	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.errors.SQLError;
	import flash.filesystem.File;

	public class SqlCreateTable {

		function sqlCreateTable(sqlConn:SQLConnection):void {
			trace("Creating Table");
			var createStmt:SQLStatement = new SQLStatement();
			createStmt.sqlConnection = sqlConn;
			
			var sql:String = "CREATE TABLE IF NOT EXISTS testtb (testID INTEGER PRIMARY KEY AUTOINCREMENT, textInput TEXT)";
			createStmt.text = sql;
			createStmt.addEventListener(SQLEvent.RESULT, createResult);
			createStmt.addEventListener(SQLErrorEvent.ERROR, createError);
			
			try
			{
				createStmt.execute();
				//trace("Table created");
			}
			catch(error:SQLError)
			{
				//trace("Error message:", error.message);
				//trace("Error details:", error.details);
			}
			
			/*tbCreate.sqlConnection = sqlConn;
			tbCreate.text = dbtbStmt;
			
			sqlConn.addEventListener(SQLEvent.OPEN, dbCreated);
			sqlConn.addEventListener(SQLErrorEvent.ERROR, dbError);
			tbCreate.addEventListener(SQLEvent.RESULT, tbCreated);
			tbCreate.addEventListener(SQLErrorEvent.ERROR, tbError);
			
			tbCreate.execute();*/
		}

		private function createResult(evt:SQLEvent):void
		{
			trace("Table Created");
		}

		private function createError(evt:SQLErrorEvent):void
		{
			trace("Error message:", evt.error.message);
			trace("Details:", evt.error.details);
		}
	}
}