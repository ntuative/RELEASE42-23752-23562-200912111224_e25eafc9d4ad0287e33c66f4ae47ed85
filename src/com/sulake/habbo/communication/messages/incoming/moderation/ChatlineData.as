package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1312:String;
      
      private var var_1951:int;
      
      private var var_1948:int;
      
      private var var_1950:int;
      
      private var var_1949:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1951 = param1.readInteger();
         var_1950 = param1.readInteger();
         var_1948 = param1.readInteger();
         var_1949 = param1.readString();
         var_1312 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1312;
      }
      
      public function get hour() : int
      {
         return var_1951;
      }
      
      public function get minute() : int
      {
         return var_1950;
      }
      
      public function get chatterName() : String
      {
         return var_1949;
      }
      
      public function get chatterId() : int
      {
         return var_1948;
      }
   }
}
