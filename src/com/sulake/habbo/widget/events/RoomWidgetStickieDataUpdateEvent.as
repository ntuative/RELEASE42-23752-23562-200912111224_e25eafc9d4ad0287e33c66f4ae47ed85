package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_642:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_202:String;
      
      private var var_598:String;
      
      private var var_1324:String;
      
      private var var_158:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_158 = param2;
         var_1324 = param3;
         var_202 = param4;
         var_598 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1324;
      }
      
      public function get colorHex() : String
      {
         return var_598;
      }
      
      public function get text() : String
      {
         return var_202;
      }
      
      public function get objectId() : int
      {
         return var_158;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
