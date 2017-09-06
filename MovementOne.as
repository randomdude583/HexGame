package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	//import flash.data.SQLConnection;
	
	

	
	public class MovementOne extends MovieClip{
		
		var hex_id:Vector.<MovieClip> = new Vector.<MovieClip>();
		var hex_cord:Array = [[150,400],[150,650],[150,900],[150,1150],[2410,400],[2410,650],[2410,900],[2410,1150]];
		
		var selected:Vector.<String> = new Vector.<String>();
		var turn:int = 1;
		var locked:Vector.<String> = new Vector.<String>();
		
		//var SQLC:SQLConnect;
		//var SQLC:SqlCreateTable;
		//var ID:InsertData;
		//var sqlconn:SQLConnection;

			

		public function MovementOne() {
			// constructor code
			
			// Connect to Database
			//sqlconn = new SQLConnection();
			//SQLC.sqlCreateTable(sqlconn);
			
			
			//Add movie clips
			hex_id.push(hex1, hex2, hex3, hex4, hex5, hex6, hex7, hex8);
			
			var i:int = -1;
			while (++i < hex_id.length) {
			}
			
			this.rotate_btn.addEventListener(MouseEvent.MOUSE_DOWN, rotateIt);
			this.continue_btn.addEventListener(MouseEvent.MOUSE_DOWN, continueIt);
			
			i = -1
			while (++i < hex_id.length) {
				hex_id[i].addEventListener (MouseEvent.MOUSE_DOWN, onStartDrag);
				hex_id[i].addEventListener (MouseEvent.MOUSE_UP, onStopDrag);
			}
		}
		
		private function rotateIt(evt:MouseEvent):void {
			var i:int = -1;
			while (++i < hex_id.length) {
				if (hex_id[i].name == selected[0]){
					hex_id[i].rotation += 20;
				}
			}
			
		}
		
		private function onStartDrag (evt:MouseEvent):void{
			if (turn == 1){
				if (evt.target.name == "hex1" || evt.target.name == "hex2" || evt.target.name == "hex3" || evt.target.name == "hex4") {
					if (locked.indexOf(evt.target.name) == -1){
						evt.target.startDrag();
						selected.length = 0;
						selected.push(evt.target.name);
						resetPieces ();
					}
				}
			} else {
				if (evt.target.name == "hex5" || evt.target.name == "hex6" || evt.target.name == "hex7" || evt.target.name == "hex8") {
					if (locked.indexOf(evt.target.name) == -1){
						evt.target.startDrag();
						selected.length = 0;
						selected.push(evt.target.name);
						resetPieces ();
					}
				}
			}
		

			
		}
		
		private function onStopDrag (evt:MouseEvent):void{
			evt.currentTarget.stopDrag();
			evt.currentTarget.x=evt.currentTarget.dropTarget.parent.x;
			evt.currentTarget.y=evt.currentTarget.dropTarget.parent.y;
		}
		
		private function resetPieces ():void{
			var i:int = -1;
			while (++i < hex_id.length) {
				if (hex_id[i].name != selected[0]){
					if (locked.indexOf(hex_id[i].name) == -1){
						hex_id[i].x = hex_cord[i][0];
						hex_id[i].y = hex_cord[i][1];
						hex_id[i].rotation = 0;
					} 
				}
			}
		}
		
		private function continueIt (evt:MouseEvent):void{
			locked.push(selected[0]);
			if (turn == 1){
				turn = 2;
			} else {
				turn = 1
			}
			trace("Player " + turn + "'s Turn");
			
			
		}
		
		

	}
	
}
