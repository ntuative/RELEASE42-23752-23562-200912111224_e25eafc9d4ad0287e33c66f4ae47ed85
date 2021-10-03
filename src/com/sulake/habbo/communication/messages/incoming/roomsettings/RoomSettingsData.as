package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_473:int = 0;
      
      public static const const_112:int = 2;
      
      public static const const_169:int = 1;
      
      public static const const_514:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2125:int;
      
      private var var_2126:int;
      
      private var var_1744:Array;
      
      private var var_1742:Boolean;
      
      private var var_1743:Boolean;
      
      private var var_1071:String;
      
      private var var_1705:Boolean;
      
      private var var_1745:int;
      
      private var var_1702:int;
      
      private var var_1074:int;
      
      private var var_1706:Boolean;
      
      private var _roomId:int;
      
      private var var_1704:Boolean;
      
      private var var_578:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1745;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1745 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1704;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2125 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1744 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_578 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1742;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2126;
      }
      
      public function get categoryId() : int
      {
         return var_1074;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1743 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1704 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1706 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1705 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_2125;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1744;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1706;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1705;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1702 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1742 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2126 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1702;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1074 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1071 = param1;
      }
      
      public function get description() : String
      {
         return var_1071;
      }
   }
}
