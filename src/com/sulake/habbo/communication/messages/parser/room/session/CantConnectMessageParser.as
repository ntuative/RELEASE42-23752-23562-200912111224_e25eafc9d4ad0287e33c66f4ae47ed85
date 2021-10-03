package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1417:int = 2;
      
      public static const const_300:int = 4;
      
      public static const const_1237:int = 1;
      
      public static const const_1143:int = 3;
       
      
      private var var_970:int = 0;
      
      private var var_791:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_970;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_970 = param1.readInteger();
         if(var_970 == 3)
         {
            var_791 = param1.readString();
         }
         else
         {
            var_791 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_970 = 0;
         var_791 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_791;
      }
   }
}
