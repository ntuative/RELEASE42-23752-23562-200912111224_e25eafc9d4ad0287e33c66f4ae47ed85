package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1462:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1468:String = "ROE_MOUSE_ENTER";
      
      public static const const_400:String = "ROE_MOUSE_MOVE";
      
      public static const const_1475:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_218:String = "ROE_MOUSE_CLICK";
      
      public static const const_356:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1732:Boolean;
      
      private var var_1731:Boolean;
      
      private var var_1734:Boolean;
      
      private var var_1733:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1734 = param4;
         var_1733 = param5;
         var_1732 = param6;
         var_1731 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1731;
      }
      
      public function get altKey() : Boolean
      {
         return var_1734;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1733;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1732;
      }
   }
}
