package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_496:int = 2;
      
      public static const const_955:int = 6;
      
      public static const const_584:int = 1;
      
      public static const const_599:int = 3;
      
      public static const const_861:int = 4;
      
      public static const const_550:int = 5;
       
      
      private var var_1998:String;
      
      private var var_909:int;
      
      private var var_1997:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_909 = param2;
         var_1997 = param3;
         var_1998 = param4;
      }
      
      public function get time() : String
      {
         return var_1998;
      }
      
      public function get senderId() : int
      {
         return var_909;
      }
      
      public function get messageText() : String
      {
         return var_1997;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
