package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1731:Boolean = false;
      
      private var var_1734:Boolean = false;
      
      private var var_1918:String = "";
      
      private var _type:String = "";
      
      private var var_1732:Boolean = false;
      
      private var var_1915:Number = 0;
      
      private var var_1916:Number = 0;
      
      private var var_1917:Number = 0;
      
      private var var_1920:String = "";
      
      private var var_1919:Number = 0;
      
      private var var_1733:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1920 = param2;
         var_1918 = param3;
         var_1916 = param4;
         var_1917 = param5;
         var_1915 = param6;
         var_1919 = param7;
         var_1733 = param8;
         var_1734 = param9;
         var_1732 = param10;
         var_1731 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1733;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1731;
      }
      
      public function get localX() : Number
      {
         return var_1915;
      }
      
      public function get localY() : Number
      {
         return var_1919;
      }
      
      public function get canvasId() : String
      {
         return var_1920;
      }
      
      public function get altKey() : Boolean
      {
         return var_1734;
      }
      
      public function get spriteTag() : String
      {
         return var_1918;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1916;
      }
      
      public function get screenY() : Number
      {
         return var_1917;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1732;
      }
   }
}
