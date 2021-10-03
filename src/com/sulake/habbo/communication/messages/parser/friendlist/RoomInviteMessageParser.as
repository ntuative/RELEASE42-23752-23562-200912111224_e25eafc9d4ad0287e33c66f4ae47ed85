package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomInviteMessageParser implements IMessageParser
   {
       
      
      private var var_1997:String;
      
      private var var_909:int;
      
      public function RoomInviteMessageParser()
      {
         super();
      }
      
      public function get senderId() : int
      {
         return this.var_909;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_909 = param1.readInteger();
         this.var_1997 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get messageText() : String
      {
         return this.var_1997;
      }
   }
}
