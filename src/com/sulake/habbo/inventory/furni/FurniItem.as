package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1768:int;
      
      private var var_1767:Boolean;
      
      private var var_1772:int;
      
      private var var_1773:String;
      
      private var var_1769:Boolean = false;
      
      private var var_1766:int;
      
      private var var_420:int;
      
      private var var_936:String;
      
      private var var_1774:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1159:int;
      
      private var var_1770:Boolean;
      
      private var var_1771:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1768 = param1;
         var_936 = param2;
         _objId = param3;
         var_1159 = param4;
         var_1773 = param5;
         var_1767 = param6;
         var_1770 = param7;
         var_1766 = param8;
         var_1774 = param9;
         var_1772 = param10;
         var_420 = -1;
      }
      
      public function get songId() : int
      {
         return var_1772;
      }
      
      public function get iconCallbackId() : int
      {
         return var_420;
      }
      
      public function get expiryTime() : int
      {
         return var_1766;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1771 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1769 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_420 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1770;
      }
      
      public function get slotId() : String
      {
         return var_1774;
      }
      
      public function get classId() : int
      {
         return var_1159;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1767;
      }
      
      public function get stuffData() : String
      {
         return var_1773;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1768;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1769;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1771;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_936;
      }
   }
}
