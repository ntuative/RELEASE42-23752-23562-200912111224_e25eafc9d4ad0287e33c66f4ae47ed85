package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1023:Boolean;
      
      private var var_1024:Boolean;
      
      private var var_1025:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1023;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1024;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1025 = param1.readBoolean();
         var_1024 = param1.readBoolean();
         var_1023 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1025;
      }
      
      public function flush() : Boolean
      {
         var_1025 = false;
         var_1024 = false;
         var_1023 = false;
         return true;
      }
   }
}
