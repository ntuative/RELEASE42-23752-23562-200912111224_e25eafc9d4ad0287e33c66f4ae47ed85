package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_649:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_649 = new ByteArray();
         var_649.writeShort(param1);
         var_649.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_649.position = 0;
         if(false)
         {
            _loc1_ = var_649.readShort();
            var_649.position = 0;
         }
         return _loc1_;
      }
   }
}
