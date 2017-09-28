package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.ByteArray; 

	
	

	
	public class MovementOne extends MovieClip{
		
		var hex_id:Vector.<MovieClip> = new Vector.<MovieClip>();
		var hex_cord:Array = [[150,400],[150,650],[150,900],[150,1150],[2410,400],[2410,650],[2410,900],[2410,1150]];
		var test1:neighborTest;
		var firstVar;
		var secondVar;
		
		
		var selected:Vector.<String> = new Vector.<String>();
		var turn:int = 1;
		var locked:Vector.<String> = new Vector.<String>();
		
		//  Hex Variables  //
		var hexLocation:Array = new Array("home", "home", "home", "home", "home", "home", "home", "home"); 
		var hexLocationTemp:Array = new Array("home", "home", "home", "home", "home", "home", "home", "home");
		//var hexValue
		//var hexSides:Array
		var hexRotation:Array = new Array(0,0,0,0,0,0,0,0);
		//var hexDiceValue:
		
		//  End Hex Variables  //

		public function MovementOne() {
			// constructor code
			
			
			
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
					hex_id[i].rotation += 60;
					trace("rotation")
					hexRotation[i] += 60
					trace(hexRotation);
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
			test1 = new neighborTest();
			trace(hexLocation);
			trace();
			trace(test1.test(evt.currentTarget.dropTarget.parent.name, hexLocationTemp));
			if (test1.test(evt.currentTarget.dropTarget.parent.name, hexLocation) == "can play here"){
				evt.currentTarget.x=evt.currentTarget.dropTarget.parent.x;
				evt.currentTarget.y=evt.currentTarget.dropTarget.parent.y;
				
	
				hexLocationTemp[hex_id.indexOf(evt.currentTarget)] = evt.currentTarget.dropTarget.parent.name;
				trace(hexLocationTemp);
				trace(hexLocation);
			}
		}
		
		
		
		private function resetPieces ():void{
			var i:int = -1;
			while (++i < hex_id.length) {
				if (hex_id[i].name != selected[0]){
					if (locked.indexOf(hex_id[i].name) == -1){
						hex_id[i].x = hex_cord[i][0];
						hex_id[i].y = hex_cord[i][1];
						hex_id[i].rotation = 0;
						hexLocationTemp[i] = "home";
						hexRotation[i] = 0;
					} 
				}
			}
		}
		
		function areEqual(a:Array,b:Array):Boolean {
			if(a.length != b.length) {
				return true;
			}
			var len:int = a.length;
			for(var i:int = 0; i < len; i++) {
				if(a[i] !== b[i]) {
					return true;
				}
			}
			return false;
		}
		
		private function continueIt (evt:MouseEvent):void{
			trace();
			trace();
			trace(hexLocationTemp);
			trace(hexLocation);
			trace();
			trace();
			if (areEqual(hexLocation, hexLocationTemp)){
				trace ("false");
				locked.push(selected[0]);
				hexLocation.length = 0;
				hexLocation = clone(hexLocationTemp);
				if (turn == 1){
					turn = 2;
				} else {
					turn = 1
				}
				trace("Player " + turn + "'s Turn");
			} else {
				trace ("You cant continue until you play")
			}
		}
		
		function clone(source:Object):* { 
			var myBA:ByteArray = new ByteArray(); 
			myBA.writeObject(source); 
			myBA.position = 0; 
			return(myBA.readObject()); 
		}
		
		

	}
	
}
