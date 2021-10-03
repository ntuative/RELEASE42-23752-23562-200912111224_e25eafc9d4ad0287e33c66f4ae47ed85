package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_49:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1;
      
      private var var_1815:Number = -1;
      
      private var var_730:IGraphicAsset = null;
      
      private var var_1816:Number = 1;
      
      private var var_1817:Number = -1;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1)
      {
         super();
         var_1815 = param2;
         _normalMaxX = param3;
         var_1817 = param4;
         var_1816 = param5;
         var_730 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1816;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1815;
      }
      
      public function get normalMinY() : Number
      {
         return var_1817;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_730;
      }
      
      public function dispose() : void
      {
         var_730 = null;
      }
   }
}
