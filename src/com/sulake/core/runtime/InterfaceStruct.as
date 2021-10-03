package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_954:IID;
      
      private var var_385:uint;
      
      private var var_1153:IUnknown;
      
      private var var_1152:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_954 = param1;
         var_1152 = getQualifiedClassName(var_954);
         var_1153 = param2;
         var_385 = 0;
      }
      
      public function get iid() : IID
      {
         return var_954;
      }
      
      public function get references() : uint
      {
         return var_385;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_385) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1153;
      }
      
      public function get iis() : String
      {
         return var_1152;
      }
      
      public function reserve() : uint
      {
         return ++var_385;
      }
      
      public function dispose() : void
      {
         var_954 = null;
         var_1152 = null;
         var_1153 = null;
         var_385 = 0;
      }
   }
}
