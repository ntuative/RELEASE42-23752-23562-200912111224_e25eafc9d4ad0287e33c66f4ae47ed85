package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2099:int;
      
      private var var_2098:int;
      
      private var var_2097:Boolean;
      
      private var var_2096:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2095:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2098 = param1;
         var_2099 = param2;
         var_2096 = param3;
         var_2095 = param4;
         var_2097 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2098,var_2099,var_2096,var_2095,int(var_2097)];
      }
      
      public function dispose() : void
      {
      }
   }
}
