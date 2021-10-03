package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_439:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_548:int = 0;
      
      public static const const_791:int = 2;
      
      public static const const_872:int = 1;
      
      public static const const_597:Boolean = false;
      
      public static const const_651:String = "";
      
      public static const const_387:int = 0;
      
      public static const const_379:int = 0;
      
      public static const const_455:int = 0;
       
      
      private var var_1861:int = 0;
      
      private var var_1629:String = "";
      
      private var var_1470:int = 0;
      
      private var var_1860:int = 0;
      
      private var var_1859:Number = 0;
      
      private var var_1645:int = 255;
      
      private var var_1862:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1861;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1470 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1859;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1860 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1861 = param1;
      }
      
      public function get tag() : String
      {
         return var_1629;
      }
      
      public function get alpha() : int
      {
         return var_1645;
      }
      
      public function get ink() : int
      {
         return var_1470;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1859 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1860;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1862 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1862;
      }
      
      public function set tag(param1:String) : void
      {
         var_1629 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1645 = param1;
      }
   }
}
