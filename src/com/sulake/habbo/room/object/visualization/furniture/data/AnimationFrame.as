package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_527:int = -1;
      
      public static const const_926:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1713:int = -1;
      
      private var var_88:int = 0;
      
      private var var_1123:int = 1;
      
      private var var_744:int = 1;
      
      private var var_1715:Boolean = false;
      
      private var var_1714:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_1715 = param5;
         if(param4 < 0)
         {
            param4 = const_527;
         }
         var_744 = param4;
         var_1123 = param4;
         if(param6 >= 0)
         {
            var_1713 = param6;
            var_1714 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_744 > 0 && param1 > var_744)
         {
            param1 = var_744;
         }
         var_1123 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_744;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1714;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_744 < 0)
         {
            return const_527;
         }
         return var_1123;
      }
      
      public function get activeSequence() : int
      {
         return var_1713;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1715;
      }
      
      public function get x() : int
      {
         return var_88;
      }
   }
}
