package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_552:String;
      
      private var var_1600:int;
      
      private var var_1946:String;
      
      private var var_986:int;
      
      private var var_1089:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1089;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1089 = param1.readInteger();
         var_1946 = param1.readString();
         var_1600 = param1.readInteger();
         var_552 = param1.readString();
         var_986 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1946;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_552;
      }
      
      public function get petType() : int
      {
         return var_986;
      }
      
      public function get level() : int
      {
         return var_1600;
      }
   }
}
