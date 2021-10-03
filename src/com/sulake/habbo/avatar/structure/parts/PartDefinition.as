package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1447:int = -1;
      
      private var var_1223:Boolean;
      
      private var var_1224:String;
      
      private var var_2005:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_2005 = String(param1["set-type"]);
         var_1224 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1223 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1447 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1224;
      }
      
      public function get staticId() : int
      {
         return var_1447;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1447 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1223;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1223 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1224 = param1;
      }
      
      public function get setType() : String
      {
         return var_2005;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
