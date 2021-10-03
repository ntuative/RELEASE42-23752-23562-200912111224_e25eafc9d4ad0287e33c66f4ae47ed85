package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1772:int;
      
      private var var_2039:int = 0;
      
      private var var_2037:String;
      
      private var var_2038:int;
      
      private var var_2040:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1772 = param1;
         var_2038 = param2;
         var_2040 = param3;
         var_2037 = param4;
      }
      
      public function get length() : int
      {
         return var_2038;
      }
      
      public function get name() : String
      {
         return var_2040;
      }
      
      public function get creator() : String
      {
         return var_2037;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2039;
      }
      
      public function get id() : int
      {
         return var_1772;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2039 = param1;
      }
   }
}
