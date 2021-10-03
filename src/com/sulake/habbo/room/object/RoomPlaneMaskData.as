package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1573:Number = 0;
      
      private var var_1574:Number = 0;
      
      private var var_1571:Number = 0;
      
      private var var_1572:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1574 = param1;
         var_1571 = param2;
         var_1573 = param3;
         var_1572 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1574;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1573;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1571;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1572;
      }
   }
}
