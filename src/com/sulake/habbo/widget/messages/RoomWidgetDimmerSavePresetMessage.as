package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_615:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2099:int;
      
      private var var_2098:int;
      
      private var var_2106:Boolean;
      
      private var var_892:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_615);
         var_2098 = param1;
         var_2099 = param2;
         _color = param3;
         var_892 = param4;
         var_2106 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_2099;
      }
      
      public function get presetNumber() : int
      {
         return var_2098;
      }
      
      public function get brightness() : int
      {
         return var_892;
      }
      
      public function get apply() : Boolean
      {
         return var_2106;
      }
   }
}
