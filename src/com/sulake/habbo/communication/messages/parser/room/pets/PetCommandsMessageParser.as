package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_903:Array;
      
      private var var_1089:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1089 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_903 = new Array();
         while(_loc2_-- > 0)
         {
            var_903.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return var_903;
      }
      
      public function get petId() : int
      {
         return var_1089;
      }
      
      public function flush() : Boolean
      {
         var_1089 = -1;
         var_903 = null;
         return true;
      }
   }
}
