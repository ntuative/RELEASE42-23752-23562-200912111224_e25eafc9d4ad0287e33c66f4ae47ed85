package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1023:int = 31;
      
      private static const const_1024:int = 32;
      
      private static const const_736:int = 10;
      
      private static const const_482:int = 20;
       
      
      private var var_503:Boolean = false;
      
      private var var_222:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_503 = true;
            var_222 = new Array();
            var_222.push(const_1023);
            var_222.push(const_1024);
            return;
         }
         if(param1 > 0 && param1 <= const_736)
         {
            if(var_503)
            {
               var_503 = false;
               var_222 = new Array();
               var_222.push(const_736 + param1);
               var_222.push(const_482 + param1);
               var_222.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
