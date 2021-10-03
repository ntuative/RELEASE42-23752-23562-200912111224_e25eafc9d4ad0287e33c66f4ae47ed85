package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1101:int = 80;
       
      
      private var var_487:Map;
      
      private var var_692:String = "";
      
      private var var_1267:Array;
      
      public function UserRegistry()
      {
         var_487 = new Map();
         var_1267 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_487.getValue(var_1267.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_692;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_487.getValue(param1) != null)
         {
            var_487.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_692);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_692 == "")
         {
            var_1267.push(param1);
         }
         var_487.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_487;
      }
      
      public function unregisterRoom() : void
      {
         var_692 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_487.length > const_1101)
         {
            _loc1_ = var_487.getKey(0);
            var_487.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_692 = param1;
         if(var_692 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
