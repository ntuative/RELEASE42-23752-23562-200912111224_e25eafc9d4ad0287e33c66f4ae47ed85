package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CallForHelpResultMessageParser implements IMessageParser
   {
       
      
      private var var_1256:int;
      
      public function CallForHelpResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1256 = -1;
         return true;
      }
      
      public function get resultType() : int
      {
         return var_1256;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1256 = param1.readInteger();
         return true;
      }
   }
}
