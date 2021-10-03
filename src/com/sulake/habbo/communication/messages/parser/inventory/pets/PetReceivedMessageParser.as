package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_945:PetData;
      
      private var var_1386:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1386 = param1.readBoolean();
         var_945 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1386 + ", " + var_945.id + ", " + var_945.name + ", " + pet.figure + ", " + var_945.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1386;
      }
      
      public function get pet() : PetData
      {
         return var_945;
      }
   }
}
