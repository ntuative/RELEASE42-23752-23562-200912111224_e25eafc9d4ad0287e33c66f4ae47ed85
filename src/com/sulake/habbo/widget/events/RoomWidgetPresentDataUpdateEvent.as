package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_434:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_444:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_73:String = "RWPDUE_CONTENTS";
      
      public static const const_385:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_360:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_57:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_202:String;
      
      private var var_1532:BitmapData;
      
      private var var_158:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_158 = param2;
         var_202 = param3;
         _controller = param4;
         var_1532 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1532;
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
