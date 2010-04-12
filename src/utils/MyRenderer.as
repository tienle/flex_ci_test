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

	public class MyRenderer extends UIComponent implements IDataRenderer
	{
		// Array of colors to use
		// YELLOW,GREEN, RED,WHITE		
		private var colors:Array = [0xa1b07f,0x688995,0xf69a52,0xc6653d,0x8e6284]; 

		private static var FILTERS:Array /* of BitMapFilter */ =
		 [ new DropShadowFilter(8, 45,  0x333333, 1, 8, 8, 0.4) ];
	
		private static var rcFill:Rectangle = new Rectangle();

	    public function MyRenderer():void
	    {
	        super();
	        
	        filters = FILTERS;
	    }
	    
		private var _data:Object;
	  
		[Inspectable(environment="none")]
	
   	/**
	 *  The chartItem that this itemRenderer is displaying.
	 *  This value is assigned by the owning series
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */
	 [Bindable(event="dataChange")]
	public function get data():Object
	{
		return _data;
	}

	/**
	 *  @private
	 */
	public function set data(value:Object):void
	{
		if (_data == value)
			return;
		_data = value;
		this.invalidateProperties();
		dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
	}
		
	protected override function commitProperties():void
	 {
	 super.commitProperties();
	 }
	 protected override function measure():void
	 {
	 super.measure();
	 }
	                                            
    override protected function 
    updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void
    {
       		super.updateDisplayList(unscaledWidth, unscaledHeight);
				
			var fill:IFill;
			var state:String = "";
			
			if (_data is ChartItem && _data.hasOwnProperty('fill'))
			{
				state = _data.currentState;
				fill = _data.fill;
			}	 	
			else
			 	fill = GraphicsUtilities.fillFromStyle(getStyle('fill'));
	
			var color:uint;
			var adjustedRadius:Number = 0;
			
			color = ColorUtil.adjustBrightness2(GraphicsUtilities.colorFromFill(fill),-20);
			fill = new SolidColor(color);		
			adjustedRadius = getStyle('adjustedRadius');
			if (!adjustedRadius)
				adjustedRadius = 0;
			
			
			var stroke:IStroke = getStyle("stroke");
					
			var w:Number = stroke ? stroke.weight / 2 : 0;
			
			var rc:Rectangle = new Rectangle(w - adjustedRadius, w - adjustedRadius, width - 2 * w + adjustedRadius * 2, height - 2 * w + adjustedRadius * 2);
			
			var g:Graphics = graphics;
			g.clear();		
			g.moveTo(rc.left,rc.top);
			if (stroke)
				stroke.apply(g);
			if (fill)
				fill.begin(g,rc);
			g.lineTo(rc.right-3,rc.top);
			g.lineTo(rc.right-3,rc.bottom);
			g.lineTo(rc.left+3,rc.bottom);
			g.lineTo(rc.left+3,rc.top);
			if (fill)
				fill.end(g);
  	
  	}
                              

		
	}

  
}


