package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_123:int = 0;
      
      public static const const_113:int = 1;
      
      public static const const_94:int = 2;
      
      public static const const_684:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1097:int = 0;
      
      private var var_2100:String = "";
      
      private var var_202:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_202 = param2;
         var_1097 = param3;
         var_2100 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2100;
      }
      
      public function get chatType() : int
      {
         return var_1097;
      }
      
      public function get text() : String
      {
         return var_202;
      }
   }
}
