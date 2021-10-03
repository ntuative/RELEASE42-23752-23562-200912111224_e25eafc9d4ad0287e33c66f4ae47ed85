package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_1439:int = "F".charCodeAt(0);
      
      public static const const_1565:int = "M".charCodeAt(0);
       
      
      private var var_552:String;
      
      private var _disposed:Boolean;
      
      private var _view:IWindowContainer;
      
      private var var_1196:String;
      
      private var var_1195:String;
      
      private var var_1073:Boolean;
      
      private var var_1197:String;
      
      private var _id:int;
      
      private var var_802:BitmapData;
      
      private var var_1074:int;
      
      private var _gender:int;
      
      private var _name:String;
      
      private var var_632:Boolean;
      
      private var _selected:Boolean;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         _id = param1.id;
         _name = param1.name;
         _gender = param1.gender;
         var_632 = param1.online;
         var_1073 = param1.followingAllowed && param1.online;
         var_552 = param1.figure;
         var_1196 = param1.motto;
         var_1197 = param1.lastAccess;
         var_1074 = param1.categoryId;
         var_1195 = param1.realName;
         Logger.log("Creating friend: " + id + ", " + name + ", " + gender + ", " + online + ", " + followingAllowed + ", " + figure + ", " + categoryId);
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1074 = param1;
      }
      
      public function set gender(param1:int) : void
      {
         _gender = param1;
      }
      
      public function get motto() : String
      {
         return var_1196;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1195 = param1;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(var_802 != null)
         {
            var_802.dispose();
            var_802 = null;
         }
         _disposed = true;
         _view = null;
      }
      
      public function get lastAccess() : String
      {
         return var_1197;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set motto(param1:String) : void
      {
         var_1196 = param1;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      public function set online(param1:Boolean) : void
      {
         var_632 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         var_1073 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         var_1197 = param1;
      }
      
      public function set id(param1:int) : void
      {
         _id = param1;
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function set selected(param1:Boolean) : void
      {
         _selected = param1;
      }
      
      public function get realName() : String
      {
         return var_1195;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         _view = param1;
      }
      
      public function set figure(param1:String) : void
      {
         var_552 = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1074;
      }
      
      public function set face(param1:BitmapData) : void
      {
         var_802 = param1;
      }
      
      public function get online() : Boolean
      {
         return var_632;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1073;
      }
      
      public function get face() : BitmapData
      {
         return var_802;
      }
      
      public function get figure() : String
      {
         return var_552;
      }
   }
}
