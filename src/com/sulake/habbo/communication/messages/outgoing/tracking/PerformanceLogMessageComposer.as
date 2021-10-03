package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_902:int = 0;
      
      private var var_1137:int = 0;
      
      private var var_1592:String = "";
      
      private var var_901:int = 0;
      
      private var var_1791:String = "";
      
      private var var_1794:int = 0;
      
      private var var_1329:String = "";
      
      private var var_1790:int = 0;
      
      private var var_1792:int = 0;
      
      private var var_1593:String = "";
      
      private var var_1793:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1790 = param1;
         var_1593 = param2;
         var_1329 = param3;
         var_1592 = param4;
         var_1791 = param5;
         if(param6)
         {
            var_1137 = 1;
         }
         else
         {
            var_1137 = 0;
         }
         var_1794 = param7;
         var_1792 = param8;
         var_901 = param9;
         var_1793 = param10;
         var_902 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1790,var_1593,var_1329,var_1592,var_1791,var_1137,var_1794,var_1792,var_901,var_1793,var_902];
      }
      
      public function dispose() : void
      {
      }
   }
}
