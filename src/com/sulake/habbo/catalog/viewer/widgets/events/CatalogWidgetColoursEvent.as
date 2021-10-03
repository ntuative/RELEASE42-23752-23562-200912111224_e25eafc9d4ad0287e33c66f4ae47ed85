package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1235:Array;
      
      private var var_2070:String;
      
      private var var_2068:String;
      
      private var var_2069:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1235 = param1;
         var_2070 = param2;
         var_2068 = param3;
         var_2069 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1235;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_2070;
      }
      
      public function get colourAssetName() : String
      {
         return var_2068;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_2069;
      }
   }
}
