package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_692:String;
      
      private var var_1562:int;
      
      private var var_1403:Boolean;
      
      private var _roomId:int;
      
      private var var_1563:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1403 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_692 = param1.readString();
         var_1563 = param1.readInteger();
         var_1562 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1403;
      }
      
      public function get roomName() : String
      {
         return var_692;
      }
      
      public function get enterMinute() : int
      {
         return var_1562;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1563;
      }
   }
}
