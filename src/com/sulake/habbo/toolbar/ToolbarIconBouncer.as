package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1933:Number;
      
      private var var_538:Number = 0;
      
      private var var_1934:Number;
      
      private var var_537:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1933 = param1;
         var_1934 = param2;
      }
      
      public function update() : void
      {
         var_537 += var_1934;
         var_538 += var_537;
         if(var_538 > 0)
         {
            var_538 = 0;
            var_537 = var_1933 * -1 * var_537;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_537 = param1;
         var_538 = 0;
      }
      
      public function get location() : Number
      {
         return var_538;
      }
   }
}
