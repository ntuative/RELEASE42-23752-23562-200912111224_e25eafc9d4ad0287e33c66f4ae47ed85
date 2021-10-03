package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1775:int;
      
      private var var_377:Boolean;
      
      private var var_1776:Boolean;
      
      private var var_758:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1776 = param1.readBoolean();
         if(var_1776)
         {
            var_1775 = param1.readInteger();
            var_377 = param1.readBoolean();
         }
         else
         {
            var_758 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_758 != null)
         {
            var_758.dispose();
            var_758 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1775;
      }
      
      public function get owner() : Boolean
      {
         return var_377;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1776;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_758;
      }
   }
}
