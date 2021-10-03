package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1918:String = "";
      
      private var var_158:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1918 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_158 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1918;
      }
      
      public function get objectId() : String
      {
         return var_158;
      }
   }
}
