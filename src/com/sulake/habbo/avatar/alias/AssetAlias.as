package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_956:Boolean;
      
      private var _name:String;
      
      private var var_1647:String;
      
      private var var_955:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1647 = String(param1.@link);
         var_955 = Boolean(parseInt(param1.@fliph));
         var_956 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_955;
      }
      
      public function get flipV() : Boolean
      {
         return var_956;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1647;
      }
   }
}
