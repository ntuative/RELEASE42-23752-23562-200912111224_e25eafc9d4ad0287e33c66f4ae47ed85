package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_220:String = "RWUIUE_PEER";
      
      public static const const_185:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1206:String = "BOT";
      
      public static const const_984:int = 2;
      
      public static const const_1217:int = 0;
      
      public static const const_915:int = 3;
       
      
      private var var_1196:String = "";
      
      private var var_1617:Boolean = false;
      
      private var var_1621:int = 0;
      
      private var var_1611:int = 0;
      
      private var var_1615:Boolean = false;
      
      private var var_1195:String = "";
      
      private var var_1616:Boolean = false;
      
      private var var_853:int = 0;
      
      private var var_1613:Boolean = true;
      
      private var var_890:int = 0;
      
      private var var_1618:Boolean = false;
      
      private var var_1260:Boolean = false;
      
      private var var_1620:Boolean = false;
      
      private var var_1619:int = 0;
      
      private var var_1623:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_258:Array;
      
      private var var_1262:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1610:int = 0;
      
      private var var_1614:Boolean = false;
      
      private var var_1612:int = 0;
      
      private var var_1622:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_258 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1611;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1611 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1617;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1613;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1613 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1616 = param1;
      }
      
      public function get motto() : String
      {
         return var_1196;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1618 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1260;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1196 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1614;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1622;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1260 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1623;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1619 = param1;
      }
      
      public function get badges() : Array
      {
         return var_258;
      }
      
      public function get amIController() : Boolean
      {
         return var_1615;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1615 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1614 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1612 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1622 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1195 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1616;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1618;
      }
      
      public function get carryItem() : int
      {
         return var_1619;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1262;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1262 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_853 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1612;
      }
      
      public function get realName() : String
      {
         return var_1195;
      }
      
      public function set webID(param1:int) : void
      {
         var_1610 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_258 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1620 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1623 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_853;
      }
      
      public function get webID() : int
      {
         return var_1610;
      }
      
      public function set groupId(param1:int) : void
      {
         var_890 = param1;
      }
      
      public function get xp() : int
      {
         return var_1621;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1617 = param1;
      }
      
      public function get groupId() : int
      {
         return var_890;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1620;
      }
      
      public function set xp(param1:int) : void
      {
         var_1621 = param1;
      }
   }
}
