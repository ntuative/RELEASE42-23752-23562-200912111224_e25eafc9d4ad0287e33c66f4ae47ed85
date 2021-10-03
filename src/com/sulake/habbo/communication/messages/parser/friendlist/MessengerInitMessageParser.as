package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2222:int;
      
      private var var_2220:int;
      
      private var var_2223:int;
      
      private var var_221:Array;
      
      private var var_2221:int;
      
      private var var_2219:int;
      
      private var var_333:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_333 = new Array();
         this.var_221 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2222;
      }
      
      public function get friends() : Array
      {
         return this.var_221;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2223;
      }
      
      public function get categories() : Array
      {
         return this.var_333;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2220;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2219;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2219 = param1.readInteger();
         this.var_2223 = param1.readInteger();
         this.var_2222 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_333.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_221.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2220 = param1.readInteger();
         this.var_2221 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2221;
      }
   }
}
