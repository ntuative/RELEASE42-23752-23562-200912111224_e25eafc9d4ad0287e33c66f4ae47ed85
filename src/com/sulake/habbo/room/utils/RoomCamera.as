package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_332:Number = 0.5;
      
      private static const const_733:int = 3;
      
      private static const const_1012:Number = 1;
       
      
      private var var_1538:Boolean = false;
      
      private var var_1547:Boolean = false;
      
      private var var_881:int = 0;
      
      private var var_241:Vector3d = null;
      
      private var var_1539:int = 0;
      
      private var var_1542:int = 0;
      
      private var var_1541:Boolean = false;
      
      private var var_1546:int = -2;
      
      private var var_1545:Boolean = false;
      
      private var var_1543:int = 0;
      
      private var var_1544:int = -1;
      
      private var var_361:Vector3d = null;
      
      private var var_1540:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1539;
      }
      
      public function get targetId() : int
      {
         return var_1544;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1543 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1539 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1538 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1544 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1547 = param1;
      }
      
      public function dispose() : void
      {
         var_361 = null;
         var_241 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_361 == null)
         {
            var_361 = new Vector3d();
         }
         var_361.assign(param1);
         var_881 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1546;
      }
      
      public function get screenHt() : int
      {
         return var_1540;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1542 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_241;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1540 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1543;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1538;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1547;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_361 != null && var_241 != null)
         {
            ++var_881;
            _loc2_ = Vector3d.dif(var_361,var_241);
            if(_loc2_.length <= const_332)
            {
               var_241 = var_361;
               var_361 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_332 * (const_733 + 1))
               {
                  _loc2_.mul(const_332);
               }
               else if(var_881 <= const_733)
               {
                  _loc2_.mul(const_332);
               }
               else
               {
                  _loc2_.mul(const_1012);
               }
               var_241 = Vector3d.sum(var_241,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1541 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1542;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1545 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1546 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_241 != null)
         {
            return;
         }
         var_241 = new Vector3d();
         var_241.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1541;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1545;
      }
   }
}
