package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_994:int;
      
      private var var_1723:int;
      
      private var var_1365:int;
      
      private var var_114:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1365 = param1.readInteger();
         var_1723 = param1.readInteger();
         var_994 = param1.readInteger();
         var_114 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1365);
      }
      
      public function get reportedUserId() : int
      {
         return var_994;
      }
      
      public function get callerUserId() : int
      {
         return var_1723;
      }
      
      public function get callId() : int
      {
         return var_1365;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_114;
      }
   }
}
