package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1600:int;
      
      private var var_1599:int;
      
      private var var_1597:int;
      
      private var var_1764:int;
      
      private var _nutrition:int;
      
      private var var_1089:int;
      
      private var var_1761:int;
      
      private var var_1762:int;
      
      private var _energy:int;
      
      private var var_1601:int;
      
      private var var_1763:int;
      
      private var _ownerName:String;
      
      private var var_1596:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1600;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1599 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1600 = param1;
      }
      
      public function get petId() : int
      {
         return var_1089;
      }
      
      public function get experienceMax() : int
      {
         return var_1762;
      }
      
      public function get nutritionMax() : int
      {
         return var_1764;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1761 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1596;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1089 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1763;
      }
      
      public function get respect() : int
      {
         return var_1599;
      }
      
      public function get levelMax() : int
      {
         return var_1761;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1762 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1597 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1764 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1596 = param1;
      }
      
      public function get experience() : int
      {
         return var_1597;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1763 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1601 = param1;
      }
      
      public function get age() : int
      {
         return var_1601;
      }
   }
}
