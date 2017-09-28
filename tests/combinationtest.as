package  {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	
	public class combinationtest extends MovieClip{
		var sides:Array = [Edge, Edge, Edge, Edge, Edge, Edge]; 		


		public function combinationtest() {
			// constructor code
			stage.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);

		}
		
		function onClick (evt:MouseEvent):void {
			var j:uint;
			for (var i in sides) { 
				randomizer(i);
				if (i != 0){
					while (sides[i] == sides[i-1]){
						trace("match", i);
						randomizer(i);
						
					}
				}
				
			}
 
			
			var centerHex:Center = new Center();
			centerHex.x = mouseX;
			centerHex.y = mouseY;
			stage.addChildAt (centerHex, 0);
			
			
			var SideClass1:Class = sides[0];
			var Side1:DisplayObject = new SideClass1;
			Side1.y = Side1.y - 86.525;
			centerHex.addChild(Side1);
			

			
			
			var SideClass2:Class = sides[1];
			var Side2:DisplayObject = new SideClass2;
			Side2.x = Side2.x + 74.9024;
			Side2.y = Side2.y - 43.2027;
			Side2.rotation = 60;
			centerHex.addChild(Side2);
			
			var SideClass3:Class = sides[2];
			var Side3:DisplayObject = new SideClass3;
			Side3.x = Side3.x + 74.9024;
			Side3.y = Side3.y + 43.2027;
			Side3.rotation = 120;
			centerHex.addChild(Side3);
			
			var SideClass4:Class = sides[3];
			var Side4:DisplayObject = new SideClass4;
			Side4.y = Side4.y + 86.525;
			Side4.rotation = 180;
			centerHex.addChild(Side4);
			
			var SideClass5:Class = sides[4];
			var Side5:DisplayObject = new SideClass5;
			Side5.x = Side5.x - 74.9024
			Side5.y = Side5.y + 43.2027;
			Side5.rotation = 240;
			centerHex.addChild(Side5);
			
			var SideClass6:Class = sides[5];
			var Side6:DisplayObject = new SideClass6;
			Side6.x = Side6.x - 74.9024;
			Side6.y = Side6.y - 43.2027;
			Side6.rotation = 300;
			centerHex.addChild(Side6);
			
			
			
			var colorInfo:ColorTransform = centerHex.transform.colorTransform; 
			colorInfo.color = 0x003399; 
			centerHex.transform.colorTransform = colorInfo; 
			
		}
		
		function randomizer (i){
			
				var randint:Number = Math.round(Math.random()*3);
				if (randint == 1){
					sides[i] = Edge
				}
				if (randint == 2){
					sides[i] = Insharp
				}
				if (randint == 3){
					sides[i] = Inround
				} 
				if (randint == 4){
					sides[i] = Outsharp
				} 
				if (randint == 5){
					sides[i] = Outround
				} 
				else {
					trace("fail");
				}
				
				if (sides[i] == sides[i-1]){
					
				}
			
			//trace (sides);
			
		}

	}
	
}
