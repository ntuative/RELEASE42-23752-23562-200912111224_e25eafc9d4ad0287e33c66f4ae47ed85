package com.sulake.room
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.renderer.IRoomRendererBase;
   import flash.utils.Dictionary;
   
   public class RoomInstance implements IRoomInstance
   {
       
      
      private var _container:IRoomInstanceContainer;
      
      private var var_912:Array;
      
      private var var_129:IRoomRendererBase;
      
      private var var_440:Array;
      
      private var var_911:Array;
      
      private var _id:String;
      
      private var var_210:Map;
      
      private var var_438:Dictionary;
      
      private var var_439:Dictionary;
      
      public function RoomInstance(param1:String, param2:IRoomInstanceContainer)
      {
         super();
         var_210 = new Map();
         var_440 = [];
         _container = param2;
         _id = param1;
         var_439 = new Dictionary();
         var_438 = new Dictionary();
         var_911 = [];
         var_912 = [];
      }
      
      public function getString(param1:String) : String
      {
         return var_438[param1];
      }
      
      protected function disposeObjectManager(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:String = String(param1);
         disposeObjects(param1);
         if(var_210.getValue(_loc2_) != null)
         {
            _loc3_ = var_210.remove(_loc2_) as IRoomObjectManager;
            if(_loc3_ != null)
            {
               _loc3_.dispose();
            }
            return true;
         }
         return false;
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(var_912.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_912.push(param1);
         }
         if(var_438[param1] != param2)
         {
            var_438[param1] = param2;
         }
      }
      
      public function createRoomObject(param1:int, param2:String, param3:int) : IRoomObject
      {
         if(_container != null)
         {
            return _container.createRoomObject(_id,param1,param2,param3);
         }
         return null;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(var_210 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_210.length)
            {
               _loc3_ = var_210.getWithIndex(_loc2_) as IRoomObjectManager;
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            var_210.dispose();
            var_210 = null;
         }
         if(var_129 != null)
         {
            var_129.dispose();
            var_129 = null;
         }
         _container = null;
         var_440 = null;
         if(var_439 != null)
         {
            for(_loc1_ in var_439)
            {
               delete var_439[_loc1_];
            }
            var_439 = null;
         }
         if(var_438 != null)
         {
            for(_loc1_ in var_438)
            {
               delete var_438[_loc1_];
            }
            var_438 = null;
         }
         var_912 = [];
         var_911 = [];
      }
      
      public function removeObjectUpdateCategory(param1:int) : void
      {
         var _loc2_:int = var_440.indexOf(param1);
         if(_loc2_ >= 0)
         {
            var_440.splice(_loc2_,1);
         }
      }
      
      public function createObjectInternal(param1:int, param2:int, param3:int) : IRoomObject
      {
         var _loc5_:* = null;
         var _loc4_:IRoomObjectManager = createObjectManager(param3);
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.createObject(param1,param2);
            if(var_129 != null)
            {
               var_129.feedRoomObject(_loc5_,String(param3));
            }
            return _loc5_;
         }
         return null;
      }
      
      public function getObject(param1:int, param2:int) : IRoomObject
      {
         var _loc3_:IRoomObjectManager = getObjectManager(param2);
         if(_loc3_ != null)
         {
            return _loc3_.getObject(param1);
         }
         return null;
      }
      
      public function disposeObject(param1:int, param2:int) : Boolean
      {
         var _loc3_:IRoomObjectManager = getObjectManager(param2);
         if(_loc3_ != null)
         {
            if(var_129)
            {
               var_129.removeRoomObject(param1,String(param2));
            }
            return _loc3_.disposeObject(param1);
         }
         return false;
      }
      
      public function getRenderer() : IRoomRendererBase
      {
         return var_129;
      }
      
      public function getNumber(param1:String) : Number
      {
         return var_439[param1];
      }
      
      public function addObjectUpdateCategory(param1:int) : void
      {
         var _loc2_:int = var_440.indexOf(param1);
         if(_loc2_ >= 0)
         {
            return;
         }
         var_440.push(param1);
      }
      
      public function update() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:int = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = int(var_440[_loc1_]);
            _loc3_ = getObjectCount(_loc2_) - 1;
            while(_loc3_ >= 0)
            {
               _loc4_ = getObjectWithIndex(_loc3_,_loc2_) as IRoomObjectController;
               if(_loc4_ != null)
               {
                  _loc5_ = _loc4_.getEventHandler();
                  if(_loc5_ != null)
                  {
                     _loc5_.update();
                  }
               }
               _loc3_--;
            }
            _loc1_--;
         }
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(var_911.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_911.push(param1);
         }
         if(var_439[param1] != param2)
         {
            var_439[param1] = param2;
         }
      }
      
      public function setRenderer(param1:IRoomRendererBase) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(param1 == var_129)
         {
            return;
         }
         if(var_129 != null)
         {
            var_129.dispose();
         }
         var_129 = param1;
         if(var_129 == null)
         {
            return;
         }
         var_129.reset();
         var _loc2_:Array = getObjectManagerIds();
         var _loc3_:int = _loc2_.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = int(_loc2_[_loc3_]);
            _loc5_ = getObjectCount(_loc4_);
            _loc6_ = _loc5_ - 1;
            while(_loc6_ >= 0)
            {
               _loc7_ = getObjectWithIndex(_loc6_,_loc4_) as IRoomObjectController;
               if(_loc7_ != null)
               {
                  var_129.feedRoomObject(_loc7_,String(_loc4_));
               }
               _loc6_--;
            }
            _loc3_--;
         }
      }
      
      protected function createObjectManager(param1:int) : IRoomObjectManager
      {
         var _loc2_:String = String(param1);
         if(var_210.getValue(_loc2_) != null)
         {
            return var_210.getValue(_loc2_) as IRoomObjectManager;
         }
         if(_container == null)
         {
            return null;
         }
         var _loc3_:IRoomObjectManager = _container.createRoomObjectManager();
         if(_loc3_ != null)
         {
            var_210.add(_loc2_,_loc3_);
         }
         return _loc3_;
      }
      
      public function getObjectCount(param1:int) : int
      {
         var _loc2_:IRoomObjectManager = getObjectManager(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getObjectCount();
         }
         return -1;
      }
      
      public function getObjectManagerIds() : Array
      {
         return var_210.getKeys();
      }
      
      protected function getObjectManager(param1:int) : IRoomObjectManager
      {
         return var_210.getValue(String(param1)) as IRoomObjectManager;
      }
      
      public function disposeObjects(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc2_:int = -1;
         var _loc3_:IRoomObjectManager = getObjectManager(param1);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.getObjectCount();
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = _loc3_.getObjectWithIndex(_loc4_) as IRoomObjectController;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.getId();
                  _loc5_.dispose();
                  if(var_129)
                  {
                     var_129.removeRoomObject(_loc6_,String(param1));
                  }
               }
               _loc4_++;
            }
            _loc3_.reset();
         }
         return _loc2_;
      }
      
      public function getObjectWithIndex(param1:int, param2:int) : IRoomObject
      {
         var _loc3_:IRoomObjectManager = getObjectManager(param2);
         if(_loc3_ != null)
         {
            return _loc3_.getObjectWithIndex(param1);
         }
         return null;
      }
   }
}
