package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1220:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1159:int;
      
      private var var_936:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_936 = param2;
         var_1159 = param3;
      }
      
      public function get classId() : int
      {
         return var_1159;
      }
      
      public function get itemType() : String
      {
         return var_936;
      }
   }
}
