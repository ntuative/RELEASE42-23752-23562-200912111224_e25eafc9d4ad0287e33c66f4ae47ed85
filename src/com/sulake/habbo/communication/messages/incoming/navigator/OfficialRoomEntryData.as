package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_962:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_710:int = 2;
      
      public static const const_807:int = 1;
       
      
      private var var_2011:String;
      
      private var _disposed:Boolean;
      
      private var var_1751:int;
      
      private var var_2012:Boolean;
      
      private var var_732:String;
      
      private var var_818:PublicRoomData;
      
      private var _index:int;
      
      private var var_2009:String;
      
      private var _type:int;
      
      private var var_1629:String;
      
      private var var_819:GuestRoomData;
      
      private var var_2008:String;
      
      private var var_2010:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_2011 = param2.readString();
         var_2008 = param2.readString();
         var_2012 = param2.readInteger() == 1;
         var_2009 = param2.readString();
         var_732 = param2.readString();
         var_1751 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_807)
         {
            var_1629 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_818 = new PublicRoomData(param2);
         }
         else if(_type == const_710)
         {
            var_819 = new GuestRoomData(param2);
         }
         else if(_type == const_962)
         {
            var_2010 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1629;
      }
      
      public function get userCount() : int
      {
         return var_1751;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2012;
      }
      
      public function get picText() : String
      {
         return var_2009;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_807)
         {
            return 0;
         }
         if(this.type == const_710)
         {
            return this.var_819.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_818.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2008;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_819 != null)
         {
            this.var_819.dispose();
            this.var_819 = null;
         }
         if(this.var_818 != null)
         {
            this.var_818.dispose();
            this.var_818 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_2011;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_819;
      }
      
      public function get picRef() : String
      {
         return var_732;
      }
      
      public function get flatCategoryId() : int
      {
         return var_2010;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_818;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
