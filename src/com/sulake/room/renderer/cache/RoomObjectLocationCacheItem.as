package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_2142:int = -1;
      
      private var var_1176:int = -1;
      
      private var var_696:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_696 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_2142;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_2142 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_696.assign(param1);
         var_696.x = Math.round(var_696.x);
         var_696.y = Math.round(var_696.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1176 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_696;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1176;
      }
   }
}
