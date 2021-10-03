package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_249:String = "e";
      
      public static const const_79:String = "i";
      
      public static const const_88:String = "s";
       
      
      private var var_943:String;
      
      private var var_1142:String;
      
      private var var_1141:int;
      
      private var var_1987:int;
      
      private var var_942:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1142 = param1.readString();
         var_1987 = param1.readInteger();
         var_943 = param1.readString();
         var_942 = param1.readInteger();
         var_1141 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_942;
      }
      
      public function get productType() : String
      {
         return var_1142;
      }
      
      public function get expiration() : int
      {
         return var_1141;
      }
      
      public function get furniClassId() : int
      {
         return var_1987;
      }
      
      public function get extraParam() : String
      {
         return var_943;
      }
   }
}
