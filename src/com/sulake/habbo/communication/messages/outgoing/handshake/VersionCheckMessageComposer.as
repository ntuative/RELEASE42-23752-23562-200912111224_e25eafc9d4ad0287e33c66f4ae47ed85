package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2144:String;
      
      private var var_1227:String;
      
      private var var_2143:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2143 = param1;
         var_1227 = param2;
         var_2144 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2143,var_1227,var_2144];
      }
      
      public function dispose() : void
      {
      }
   }
}
