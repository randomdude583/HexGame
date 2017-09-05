package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MovementOne extends MovieClip{
		
		var hex_id:Vector.<MovieClip> = new Vector.<MovieClip>();
		var hex_cord:Array = [[150,400],[150,650],[150,900],[150,1150],[2410,400],[2410,650],[2410,900],[2410,1150]];
		
		var selected:Vector.<String> = new Vector.<String>();

			

		public function MovementOne() {
			// constructor code
			
			//Add movie clips
			hex_id.push(hex1, hex2, hex3, hex4, hex5, hex6, hex7, hex8);
			
			var i:int = -1;
			while (++i < hex_id.length) {
				trace(hex_id[i].x);
				trace(hex_id[i].y);
				trace();
			}
			
			this.rotate_btn.addEventListener(MouseEvent.MOUSE_DOWN, rotateIt);
			
			i = -1
			while (++i < hex_id.length) {
				hex_id[i].addEventListener (MouseEvent.MOUSE_DOWN, onStartDrag);
				hex_id[i].addEventListener (MouseEvent.MOUSE_UP, onStopDrag);
			}
		}
		
		private function rotateIt(evt:MouseEvent):void {
			trace("hit");
			var i:int = -1;
			while (++i < hex_id.length) {
				if (hex_id[i].name == selected[0]){
					hex_id[i].rotation += 20;
				}
			}
			
		}
		
		private function onStartDrag (evt:MouseEvent):void{
			evt.target.startDrag();
			selected.length = 0;
			trace(evt.target.name);
			selected.push(evt.target.name);
			resetPieces ();

			
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
					hex_id[i].x = hex_cord[i][0];
					hex_id[i].y = hex_cord[i][1];
					hex_id[i].rotation = 0;
				}
			}
		}
		
		

	}
	
}
