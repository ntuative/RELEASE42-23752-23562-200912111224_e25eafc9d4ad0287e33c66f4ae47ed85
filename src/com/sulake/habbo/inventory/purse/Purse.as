package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1989:Boolean = false;
      
      private var var_1990:int = 0;
      
      private var var_1796:int = 0;
      
      private var var_1988:int = 0;
      
      private var var_1511:int = 0;
      
      private var var_1795:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1511 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1990;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1989;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1989 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1990 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1796 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1511;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1988 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1796;
      }
      
      public function get pixelBalance() : int
      {
         return var_1988;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1795 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1795;
      }
   }
}
