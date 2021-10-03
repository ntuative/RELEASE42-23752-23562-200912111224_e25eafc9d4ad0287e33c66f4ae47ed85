package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1599:int;
      
      private var var_1125:PetData;
      
      private var var_2083:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1599;
      }
      
      public function get petData() : PetData
      {
         return var_1125;
      }
      
      public function flush() : Boolean
      {
         var_1125 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2083;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1599 = param1.readInteger();
         var_2083 = param1.readInteger();
         var_1125 = new PetData(param1);
         return true;
      }
   }
}
