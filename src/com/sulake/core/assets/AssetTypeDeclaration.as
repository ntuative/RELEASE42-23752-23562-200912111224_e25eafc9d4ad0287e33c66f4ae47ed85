package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1880:Class;
      
      private var var_1882:Class;
      
      private var var_1881:String;
      
      private var var_1168:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1881 = param1;
         var_1882 = param2;
         var_1880 = param3;
         if(rest == null)
         {
            var_1168 = new Array();
         }
         else
         {
            var_1168 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1880;
      }
      
      public function get assetClass() : Class
      {
         return var_1882;
      }
      
      public function get mimeType() : String
      {
         return var_1881;
      }
      
      public function get fileTypes() : Array
      {
         return var_1168;
      }
   }
}
