package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1162:int;
      
      private var var_1007:String;
      
      private var var_668:Array;
      
      private var var_966:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_668.slice();
      }
      
      public function flush() : Boolean
      {
         var_1007 = "";
         var_966 = [];
         var_668 = [];
         var_1162 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1162;
      }
      
      public function get question() : String
      {
         return var_1007;
      }
      
      public function get choices() : Array
      {
         return var_966.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1007 = param1.readString();
         var_966 = [];
         var_668 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_966.push(param1.readString());
            var_668.push(param1.readInteger());
            _loc3_++;
         }
         var_1162 = param1.readInteger();
         return true;
      }
   }
}
