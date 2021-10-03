package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1383:String;
      
      private var var_867:String;
      
      private var var_1385:String;
      
      private var var_1384:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1384 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1383 = _loc5_[0];
         var_1385 = _loc5_[1];
         _name = param2;
         var_867 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1383;
      }
      
      public function get languageCode() : String
      {
         return var_1384;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_867;
      }
      
      public function get encoding() : String
      {
         return var_1385;
      }
      
      public function get id() : String
      {
         return var_1384 + "_" + var_1383 + "." + var_1385;
      }
   }
}
