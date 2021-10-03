package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1140:int;
      
      private var var_1090:int;
      
      private var var_1139:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1140;
      }
      
      public function flush() : Boolean
      {
         var_1090 = 0;
         var_1140 = 0;
         var_1139 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1090;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1140 = param1.readInteger();
         var_1090 = param1.readInteger();
         var_1139 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1139;
      }
   }
}
