package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_1526:int;
      
      private var var_1527:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         var_1526 = param1;
         var_1527 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1526,var_1527];
      }
   }
}
