package utils
{
	import mx.core.IDataRenderer;
	import mx.core.UIComponent;
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	import mx.charts.ChartItem;
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	import mx.charts.ChartItem;
	import mx.charts.chartClasses.GraphicsUtilities;
	import mx.core.IDataRenderer;
	import mx.graphics.IFill;
	import mx.graphics.IStroke;
	import mx.skins.ProgrammaticSkin;
	import mx.graphics.SolidColor;
	import mx.utils.ColorUtil;
	//import mx.events;
	import flash.events.EventDispatcher;
	import mx.events.FlexEvent;
	
	import flash.events.*;
	import mx.charts.ColumnChart;
	import mx.charts.chartClasses.LegendData;
	import flash.filters.DropShadowFilter;

    import mx.charts.chartClasses.ChartLabel;
    import mx.charts.*;
    import flash.display.*; 
    import flash.geom.Matrix;
    import flash.text.TextField;   

    
    public class MyTitleRenderer extends ChartLabel {
    
        // The title is renderered in a TextField.
        private var myText:TextField; 
    
        public function MyTitleRenderer() {
            super();            
        }       
        
        override protected function createChildren():void{ 
            super.createChildren();
            myText = new TextField();
        }
        
        override protected function updateDisplayList(w:Number, h:Number):void {
            super.updateDisplayList(w, h);
            
            // The data property provides access to the title text.
            if(data.hasOwnProperty('text')) {
                myText.text = data.text;
            } else {
                myText.text = data.toString();        
            }
            
            this.setStyle("textAlign","center");
            var g:Graphics = graphics; 
            g.clear();  
            var m:Matrix = new Matrix();
            m.createGradientBox(w+100,h,0,0,0);
            g.beginGradientFill(GradientType.LINEAR,[0xfa9f36,0xfbbe78],
                [.2,1],[0,255],m,null,null,0);
            g.drawRect(-50,0,w+100,h);
            g.endFill(); 
        }
    }
	

}


