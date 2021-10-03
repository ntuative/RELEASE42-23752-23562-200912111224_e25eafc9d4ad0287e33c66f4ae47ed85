package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1751:int;
      
      private var var_2133:String;
      
      private var var_2131:int;
      
      private var var_2130:int;
      
      private var var_657:Boolean;
      
      private var var_1743:Boolean;
      
      private var var_376:int;
      
      private var var_1071:String;
      
      private var var_1702:int;
      
      private var var_1074:int;
      
      private var _ownerName:String;
      
      private var var_692:String;
      
      private var var_2132:int;
      
      private var var_2129:RoomThumbnailData;
      
      private var var_1704:Boolean;
      
      private var var_578:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_578 = new Array();
         super();
         var_376 = param1.readInteger();
         var_657 = param1.readBoolean();
         var_692 = param1.readString();
         _ownerName = param1.readString();
         var_1702 = param1.readInteger();
         var_1751 = param1.readInteger();
         var_2132 = param1.readInteger();
         var_1071 = param1.readString();
         var_2131 = param1.readInteger();
         var_1704 = param1.readBoolean();
         var_2130 = param1.readInteger();
         var_1074 = param1.readInteger();
         var_2133 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_578.push(_loc4_);
            _loc3_++;
         }
         var_2129 = new RoomThumbnailData(param1);
         var_1743 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2132;
      }
      
      public function get roomName() : String
      {
         return var_692;
      }
      
      public function get userCount() : int
      {
         return var_1751;
      }
      
      public function get score() : int
      {
         return var_2130;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2133;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1704;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function get event() : Boolean
      {
         return var_657;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_578 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1074;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2131;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2129;
      }
      
      public function get doorMode() : int
      {
         return var_1702;
      }
      
      public function get flatId() : int
      {
         return var_376;
      }
      
      public function get description() : String
      {
         return var_1071;
      }
   }
}
