package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_605:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_1579:BitmapData;
      
      private var var_1578:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_605,param3,param4);
         var_1578 = param1;
         var_1579 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_1579;
      }
      
      public function get badgeID() : String
      {
         return var_1578;
      }
   }
}
