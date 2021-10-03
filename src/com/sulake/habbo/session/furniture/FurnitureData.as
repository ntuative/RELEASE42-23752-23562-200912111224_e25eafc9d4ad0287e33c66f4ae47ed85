package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1419:String = "e";
      
      public static const const_1413:String = "i";
      
      public static const const_1550:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1685:int;
      
      private var var_1235:Array;
      
      private var var_1684:int;
      
      private var var_1682:int;
      
      private var var_1681:int;
      
      private var _name:String;
      
      private var var_1683:int;
      
      private var var_1071:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1685 = param4;
         var_1683 = param5;
         var_1684 = param6;
         var_1682 = param7;
         var_1681 = param8;
         var_1235 = param9;
         _title = param10;
         var_1071 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1682;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1681;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1683;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1685;
      }
      
      public function get tileSizeX() : int
      {
         return var_1684;
      }
      
      public function get colours() : Array
      {
         return var_1235;
      }
      
      public function get description() : String
      {
         return var_1071;
      }
   }
}
