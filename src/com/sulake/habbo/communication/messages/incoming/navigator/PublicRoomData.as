package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1993:int;
      
      private var var_1992:String;
      
      private var var_1576:int;
      
      private var _disposed:Boolean;
      
      private var var_1991:int;
      
      private var var_1994:String;
      
      private var var_1245:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1994 = param1.readString();
         var_1993 = param1.readInteger();
         var_1576 = param1.readInteger();
         var_1992 = param1.readString();
         var_1991 = param1.readInteger();
         var_1245 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1991;
      }
      
      public function get worldId() : int
      {
         return var_1576;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1994;
      }
      
      public function get unitPort() : int
      {
         return var_1993;
      }
      
      public function get castLibs() : String
      {
         return var_1992;
      }
      
      public function get nodeId() : int
      {
         return var_1245;
      }
   }
}
