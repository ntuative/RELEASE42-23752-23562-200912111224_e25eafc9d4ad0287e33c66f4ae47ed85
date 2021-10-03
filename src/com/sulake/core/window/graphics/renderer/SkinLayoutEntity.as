package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_234:uint = 1;
      
      public static const const_467:uint = 0;
      
      public static const const_994:uint = 8;
      
      public static const const_251:uint = 4;
      
      public static const const_402:uint = 2;
       
      
      private var var_379:uint;
      
      private var var_1836:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1837:uint;
      
      private var var_103:Rectangle;
      
      private var var_578:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_103 = param3;
         _color = param4;
         var_379 = param5;
         var_1836 = param6;
         var_1837 = param7;
         var_578 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1836;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_379;
      }
      
      public function get scaleV() : uint
      {
         return var_1837;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_103 = null;
         var_578 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_103;
      }
   }
}
