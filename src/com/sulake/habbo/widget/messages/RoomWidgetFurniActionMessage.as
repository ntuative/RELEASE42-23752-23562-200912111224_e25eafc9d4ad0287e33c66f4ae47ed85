package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_242:String = "RWFAM_MOVE";
      
      public static const const_609:String = "RWFUAM_ROTATE";
      
      public static const const_587:String = "RWFAM_PICKUP";
       
      
      private var var_1607:int = 0;
      
      private var var_2027:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1607 = param2;
         var_2027 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1607;
      }
      
      public function get furniCategory() : int
      {
         return var_2027;
      }
   }
}
