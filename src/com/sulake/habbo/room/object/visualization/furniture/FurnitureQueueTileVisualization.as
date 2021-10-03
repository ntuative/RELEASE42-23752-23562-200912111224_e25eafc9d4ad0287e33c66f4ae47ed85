package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1099:int = 1;
      
      private static const const_1024:int = 3;
      
      private static const const_1100:int = 2;
      
      private static const const_1098:int = 15;
       
      
      private var var_849:int;
      
      private var var_222:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1100)
         {
            var_222 = new Array();
            var_222.push(const_1099);
            var_849 = const_1098;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_849 > 0)
         {
            --var_849;
         }
         if(var_849 == 0)
         {
            if(false)
            {
               super.setAnimation(var_222.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
