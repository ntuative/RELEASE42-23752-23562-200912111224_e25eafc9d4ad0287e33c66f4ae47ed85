package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_1302:String;
      
      protected var var_2172:Boolean;
      
      protected var var_1896:int;
      
      protected var var_2170:Boolean;
      
      protected var _type:int;
      
      protected var var_1898:int;
      
      protected var var_2167:Boolean;
      
      protected var var_1772:int;
      
      protected var var_2169:Boolean;
      
      protected var _id:int;
      
      protected var var_2171:int;
      
      protected var var_1774:String;
      
      protected var var_1894:Boolean;
      
      protected var _category:int;
      
      protected var var_1897:int;
      
      protected var var_2168:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:int, param11:int, param12:int, param13:int, param14:String, param15:int)
      {
         super();
         _id = param1;
         _type = param2;
         var_2171 = param3;
         _category = param4;
         var_1894 = param5;
         var_2169 = param6;
         var_2172 = param7;
         var_2170 = param8;
         var_1302 = param9;
         var_2168 = param10;
         var_1896 = param11;
         var_1897 = param12;
         var_1898 = param13;
         var_1774 = param14;
         var_1772 = param15;
      }
      
      public function get locked() : Boolean
      {
         return var_2167;
      }
      
      public function get songId() : int
      {
         return var_1772;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2167 = param1;
      }
      
      public function get ref() : int
      {
         return var_2171;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2170;
      }
      
      public function get slotId() : String
      {
         return var_1774;
      }
      
      public function get expires() : int
      {
         return var_2168;
      }
      
      public function get creationYear() : int
      {
         return var_1898;
      }
      
      public function get creationDay() : int
      {
         return var_1896;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2169;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get groupable() : Boolean
      {
         return var_1894;
      }
      
      public function get creationMonth() : int
      {
         return var_1897;
      }
      
      public function get extras() : String
      {
         return var_1302;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2172;
      }
   }
}
