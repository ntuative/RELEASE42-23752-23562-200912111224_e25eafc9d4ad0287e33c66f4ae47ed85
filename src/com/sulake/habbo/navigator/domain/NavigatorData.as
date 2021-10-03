package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1391:int = 10;
       
      
      private var var_1478:NavigatorSettingsMessageParser;
      
      private var var_1252:int;
      
      private var var_2078:Boolean;
      
      private var var_2081:int;
      
      private var var_840:Dictionary;
      
      private var var_2237:int;
      
      private var var_2080:int;
      
      private var var_1970:int;
      
      private var var_333:Array;
      
      private var var_2077:int;
      
      private var var_1055:Array;
      
      private var var_567:PublicRoomShortData;
      
      private var var_408:RoomEventData;
      
      private var var_143:MsgWithRequestId;
      
      private var var_2079:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2082:Boolean;
      
      private var var_203:GuestRoomData;
      
      private var var_685:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_333 = new Array();
         var_840 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2081;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2082;
      }
      
      public function startLoading() : void
      {
         this.var_685 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2082 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_408 != null)
         {
            var_408.dispose();
         }
         var_408 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_143 != null && var_143 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_143 != null && var_143 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_143 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_203;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_567 = null;
         var_203 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_567 = param1.publicSpace;
            var_408 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_408 != null)
         {
            var_408.dispose();
            var_408 = null;
         }
         if(var_567 != null)
         {
            var_567.dispose();
            var_567 = null;
         }
         if(var_203 != null)
         {
            var_203.dispose();
            var_203 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_143 = param1;
         var_685 = false;
         if(var_1055 == null)
         {
            var_1055 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1478;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_143 = param1;
         var_685 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_333.length > param1)
         {
            return var_333[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2237 = param1.limit;
         this.var_1252 = param1.favouriteRoomIds.length;
         this.var_840 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_840[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_143 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_333;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_567;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1970 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2078;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_143 = param1;
         var_685 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_333.length)
         {
            if((var_333[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_203 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_685;
      }
      
      public function set categories(param1:Array) : void
      {
         var_333 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_2080;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2077;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1478 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_143 == null)
         {
            return;
         }
         var_143.dispose();
         var_143 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_408;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_840[param1] = !!param2 ? "yes" : null;
         var_1252 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_143 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1055;
      }
      
      public function get avatarId() : int
      {
         return var_1970;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_143 != null && var_143 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2078 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2080 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2079 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_203 != null)
         {
            var_203.dispose();
         }
         var_203 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_333)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_203 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1478.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1252 >= var_2237;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2077 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2079;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_203 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2081 = param1;
      }
   }
}
