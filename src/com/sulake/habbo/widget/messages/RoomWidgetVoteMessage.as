package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_129:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1264:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_129);
         var_1264 = param1;
      }
      
      public function get vote() : int
      {
         return var_1264;
      }
   }
}
