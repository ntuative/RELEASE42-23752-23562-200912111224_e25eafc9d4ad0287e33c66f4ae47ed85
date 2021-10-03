package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1582:Boolean;
      
      private var var_1581:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1582 = Boolean(parseInt(param1.@club));
         var_1581 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1582;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1581;
      }
   }
}
