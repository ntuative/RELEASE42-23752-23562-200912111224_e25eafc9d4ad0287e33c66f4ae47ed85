package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1773:String;
      
      private var var_936:String;
      
      private var var_2139:Boolean;
      
      private var var_1768:int;
      
      private var var_2140:Boolean;
      
      private var var_1774:String = "";
      
      private var var_1767:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1159:int;
      
      private var var_1770:Boolean;
      
      private var var_1772:int = -1;
      
      private var var_1766:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1768 = param1;
         var_936 = param2;
         _objId = param3;
         var_1159 = param4;
         _category = param5;
         var_1773 = param6;
         var_2139 = param7;
         var_1767 = param8;
         var_1770 = param9;
         var_2140 = param10;
         var_1766 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1774;
      }
      
      public function get classId() : int
      {
         return var_1159;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2140;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2139;
      }
      
      public function get stripId() : int
      {
         return var_1768;
      }
      
      public function get stuffData() : String
      {
         return var_1773;
      }
      
      public function get songId() : int
      {
         return var_1772;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1774 = param1;
         var_1772 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1766;
      }
      
      public function get itemType() : String
      {
         return var_936;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1770;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1767;
      }
   }
}
