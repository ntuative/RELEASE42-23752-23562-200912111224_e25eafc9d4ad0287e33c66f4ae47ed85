package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_119:String = "RWPUE_VOTE_RESULT";
      
      public static const const_115:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1162:int;
      
      private var var_1007:String;
      
      private var var_668:Array;
      
      private var var_966:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1007 = param2;
         var_966 = param3;
         var_668 = param4;
         if(var_668 == null)
         {
            var_668 = [];
         }
         var_1162 = param5;
      }
      
      public function get votes() : Array
      {
         return var_668.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1162;
      }
      
      public function get question() : String
      {
         return var_1007;
      }
      
      public function get choices() : Array
      {
         return var_966.slice();
      }
   }
}
