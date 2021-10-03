package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_184:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1866:Boolean = false;
      
      private var var_1867:int = 0;
      
      private var var_1865:int = 0;
      
      private var var_1864:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_184,param5,param6);
         var_1864 = param1;
         var_1865 = param2;
         var_1867 = param3;
         var_1866 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1867;
      }
      
      public function get periodsLeft() : int
      {
         return var_1865;
      }
      
      public function get daysLeft() : int
      {
         return var_1864;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1866;
      }
   }
}
