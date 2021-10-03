package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1958:int;
      
      private var var_1953:String;
      
      private var var_1362:IActionDefinition;
      
      private var var_1954:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1955:String;
      
      private var var_1957:String;
      
      private var var_1583:Boolean;
      
      private var var_1956:ColorTransform;
      
      private var var_1849:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1953 = param1;
         var_1955 = param2;
         var_1958 = param3;
         _color = param4;
         _frames = param5;
         var_1362 = param6;
         var_1583 = param7;
         var_1849 = param8;
         var_1957 = param9;
         var_1954 = param10;
         var_1956 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1583;
      }
      
      public function get partType() : String
      {
         return var_1955;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1849;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1954;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1958;
      }
      
      public function get flippedPartType() : String
      {
         return var_1957;
      }
      
      public function get bodyPartId() : String
      {
         return var_1953;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1362;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1956;
      }
   }
}
