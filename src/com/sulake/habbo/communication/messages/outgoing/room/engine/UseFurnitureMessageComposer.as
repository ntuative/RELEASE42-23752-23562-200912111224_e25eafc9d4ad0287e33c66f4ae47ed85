package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class UseFurnitureMessageComposer implements IMessageComposer
   {
       
      
      private var var_29:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int = 0;
      
      private var var_158:int;
      
      public function UseFurnitureMessageComposer(param1:int, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         var_158 = param1;
         var_29 = param2;
         _roomId = param3;
         _roomCategory = param4;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_158,var_29];
      }
   }
}