package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_936:int;
      
      private var var_1134:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_936 = param1;
         var_1134 = param2;
      }
      
      public function get itemType() : int
      {
         return var_936;
      }
      
      public function get itemName() : String
      {
         return var_1134;
      }
   }
}
