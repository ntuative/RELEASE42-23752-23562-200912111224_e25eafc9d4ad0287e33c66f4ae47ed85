package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_943:String = "select_outfit";
       
      
      private var var_1877:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_943);
         var_1877 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1877;
      }
   }
}
