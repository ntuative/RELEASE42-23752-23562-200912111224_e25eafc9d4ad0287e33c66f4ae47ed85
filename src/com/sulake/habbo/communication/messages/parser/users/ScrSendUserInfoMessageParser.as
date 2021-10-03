package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1656:int;
      
      private var var_1173:String;
      
      private var var_1655:int;
      
      private var var_1653:int;
      
      private var var_1654:int;
      
      private var var_1652:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1173;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1652;
      }
      
      public function get responseType() : int
      {
         return var_1653;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1655;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1173 = param1.readString();
         var_1655 = param1.readInteger();
         var_1656 = param1.readInteger();
         var_1654 = param1.readInteger();
         var_1653 = param1.readInteger();
         var_1652 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1656;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1654;
      }
   }
}
