package  {
	import flash.display.MovieClip;
	
	public class neighborTest extends MovieClip{
		var DSCol:int = 2;
		var DSRow:int = 5;
		var concat:String;
		var index:int;
		var above:String;
		var below:String;
		var result:String;
		
		var snapcol1:Array = new Array("snap1", "snap6", "snap11", "snap16", "snap21");
		var snapcol2:Array = new Array("snap2", "snap7", "snap12", "snap17");
		var snapcol3:Array = new Array("snap3", "snap8", "centerhex", "snap18", "snap23");
		var snapcol4:Array = new Array("snap4", "snap9", "snap14", "snap19");
		var snapcol5:Array = new Array("snap5", "snap10", "snap15", "snap20", "snap25");

		public function neighborTest() {
			// constructor code
		}
		
		function test(input, hexLocation) {
			input = removeNonNumericChars(input);
			result = testinrow(input, hexLocation);
			return result;
		}
		
		function removeNonNumericChars($str:String):String {
			var newStr:String = "";
			for (var i:int = 0; i<$str.length; i++) {
				var currentCharCode:Number = $str.charCodeAt(i);
				if ((currentCharCode >= 48) && (currentCharCode <= 57)) {
					newStr += $str.charAt(i);
				}
			}
			return newStr;
		}
		
		function testinrow (test, hexLocation){
			concat = "snap" + test;
			trace(concat);
			if (hexLocation.indexOf(concat) != -1){
				return("Cant Play Here");
			} else {
				if (concat == "snap"){
					return("cant play here");
				} else {
					if (snapcol1.indexOf(concat) != -1){
						trace("column 1");
						index = snapcol1.indexOf(concat);
						above = snapcol1[index + 1];
						below = snapcol1[index - 1];
						if (hexLocation.indexOf(above) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(snapcol2[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol2[index - 1]) != -1){
							return("can play here");
						}
						
					} else if (snapcol2.indexOf(concat) != -1){
						trace("column 2");
						index = snapcol2.indexOf(concat);
						above = snapcol2[index + 1];
						below = snapcol2[index - 1];
						if (hexLocation.indexOf(above) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(snapcol1[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol1[index + 1]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol3[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol3[index + 1]) != -1){
							return("can play here");
						} else if ((concat == "snap7") || (concat == "snap12")){
							return("can play here");
						}
						
					} else if (snapcol3.indexOf(concat) != -1){
						trace("column 3");
						index = snapcol3.indexOf(concat);
						above = snapcol3[index + 1];
						below = snapcol3[index - 1];
						if (hexLocation.indexOf(above) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						}  else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(snapcol2[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol2[index - 1]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol4[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol4[index - 1]) != -1){
							return("can play here");
						} else if (above == "centerhex"){
							return("can play here");
						} else if (below == "centerhex"){
							return("can play here");
							
						}
						
					} else if (snapcol4.indexOf(concat) != -1){
						trace("column 4");
						index = snapcol4.indexOf(concat);
						above = snapcol4[index + 1];
						below = snapcol4[index - 1];
						if (hexLocation.indexOf(above) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(snapcol3[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol3[index + 1]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol5[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol5[index + 1]) != -1){
							return("can play here");
						} else if ((concat == "snap9") || (concat == "snap14")){
							return("can play here");
						}
						
					} else if (snapcol5.indexOf(concat) != -1){
						trace("column 5");
						index = snapcol5.indexOf(concat);
						above = snapcol5[index + 1];
						below = snapcol5[index - 1];
						if (hexLocation.indexOf(above) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(below) != -1){
							return("can play here");
						} else if (hexLocation.indexOf(snapcol4[index]) != -1) {
							return("can play here");
						} else if (hexLocation.indexOf(snapcol4[index - 1]) != -1) {
							return("can play here");
						} 
					}
				}
			}
		}

	}
	
}
