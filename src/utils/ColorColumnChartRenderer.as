package utils
{
	import mx.core.IDataRenderer;
	import mx.core.UIComponent;
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	import mx.charts.ChartItem;
	

	import mx.charts.ColumnChart;
	import mx.charts.chartClasses.LegendData;



	public class ColorColumnChartRenderer extends UIComponent implements IDataRenderer
	{
		// Array of colors to use
		// YELLOW,GREEN, RED,WHITE		
		private var colors:Array = [0xa1b07f,0x688995,0xf69a52,0xc6653d,0x8e6284]; 

	    public function ColorColumnChartRenderer():void
	    {
	        super();
	    }
	    private var _chartItem:ChartItem;
	
		public function set data(value:Object):void
	    {
	        if (_chartItem == value)
	            return;
	          // setData also is executed if there is a Legend Data 
	          //defined for the chart. We validate that only chartItems are 
	          //assigned to the chartItem class. 
	        if (value is LegendData) 
	        	return;
	        _chartItem = ChartItem(value);
	        
	    }	
	    
	    public function get data():Object
	    {
	        return _chartItem;
	    }
		

	                                            
    override protected function 
    updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void
    {
        super.updateDisplayList(unscaledWidth, unscaledHeight);
                
        var rc:Rectangle = new Rectangle(0, 0, width , height );
        var columnColor:uint;
        var g:Graphics = graphics;
	        g.clear();        
	        g.moveTo(rc.left,rc.top);
   	        
   	        // Only if the _chartItem has data
	        if (_chartItem == null)
	           return;
	           
	        g.beginFill(colors[(_chartItem == null)? 0:(_chartItem.index % colors.length)]);
	        	
			// Draw the column	
	        g.lineTo(rc.right-10,rc.top);
	        g.lineTo(rc.right-10,rc.bottom);
	        g.lineTo(rc.left,rc.bottom);
	        g.lineTo(rc.left,rc.top);
	        g.endFill();    
  		}
                              

		
	}
}


