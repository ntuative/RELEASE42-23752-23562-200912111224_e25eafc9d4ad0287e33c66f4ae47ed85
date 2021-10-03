package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_547:String = "RWOCM_CLUB_MAIN";
      
      public static const const_703:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1627:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_703);
         var_1627 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1627;
      }
   }
}
