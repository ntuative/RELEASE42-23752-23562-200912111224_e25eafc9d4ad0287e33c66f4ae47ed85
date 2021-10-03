package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1896:int;
      
      private var var_1891:int;
      
      private var var_936:String;
      
      private var var_1892:int;
      
      private var var_1890:String;
      
      private var var_1889:int;
      
      private var var_1898:int;
      
      private var _category:int;
      
      private var var_1895:int;
      
      private var var_1897:int;
      
      private var var_1893:int;
      
      private var var_1894:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1892 = param1;
         var_936 = param2;
         var_1891 = param3;
         var_1893 = param4;
         _category = param5;
         var_1890 = param6;
         var_1889 = param7;
         var_1896 = param8;
         var_1897 = param9;
         var_1898 = param10;
         var_1894 = param11;
         var_1895 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1893;
      }
      
      public function get groupable() : Boolean
      {
         return var_1894;
      }
      
      public function get creationMonth() : int
      {
         return var_1897;
      }
      
      public function get roomItemID() : int
      {
         return var_1891;
      }
      
      public function get itemType() : String
      {
         return var_936;
      }
      
      public function get itemID() : int
      {
         return var_1892;
      }
      
      public function get itemSpecificData() : String
      {
         return var_1890;
      }
      
      public function get songID() : int
      {
         return var_1895;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1889;
      }
      
      public function get creationYear() : int
      {
         return var_1898;
      }
      
      public function get creationDay() : int
      {
         return var_1896;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
