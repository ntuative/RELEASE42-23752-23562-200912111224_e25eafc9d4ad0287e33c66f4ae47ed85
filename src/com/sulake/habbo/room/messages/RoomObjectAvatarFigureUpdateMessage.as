package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1853:String;
      
      private var var_552:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_552 = param1;
         var_1853 = param2;
      }
      
      public function get race() : String
      {
         return var_1853;
      }
      
      public function get figure() : String
      {
         return var_552;
      }
   }
}
