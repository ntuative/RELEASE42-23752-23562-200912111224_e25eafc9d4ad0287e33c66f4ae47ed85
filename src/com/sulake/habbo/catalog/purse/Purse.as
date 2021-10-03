package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1796:int = 0;
      
      private var var_1797:int = 0;
      
      private var var_1798:int = 0;
      
      private var var_1795:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1797;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1797 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1796 = param1;
      }
      
      public function get credits() : int
      {
         return var_1798;
      }
      
      public function get clubDays() : int
      {
         return var_1796;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1795 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1798 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1795;
      }
   }
}
