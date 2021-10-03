package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1330:GarbageMonitor = null;
      
      private var var_1088:int = 0;
      
      private var var_1137:Boolean = false;
      
      private var var_1592:String = "";
      
      private var var_1329:String = "";
      
      private var var_314:Number = 0;
      
      private var var_1084:int = 10;
      
      private var var_2192:Array;
      
      private var var_584:int = 0;
      
      private var var_1087:int = 60;
      
      private var var_902:int = 0;
      
      private var var_901:int = 0;
      
      private var var_1791:String = "";
      
      private var var_1589:Number = 0;
      
      private var var_1085:int = 1000;
      
      private var var_1590:Boolean = true;
      
      private var var_1591:Number = 0.15;
      
      private var var_178:IHabboConfigurationManager = null;
      
      private var var_1593:String = "";
      
      private var var_1086:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2192 = [];
         super();
         var_1329 = Capabilities.version;
         var_1592 = Capabilities.os;
         var_1137 = Capabilities.isDebugger;
         var_1593 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1330 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1088 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1330.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1330.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_314;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1087 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1329;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_901;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1085)
         {
            ++var_902;
            _loc3_ = true;
         }
         else
         {
            ++var_584;
            if(var_584 <= 1)
            {
               var_314 = param1;
            }
            else
            {
               _loc4_ = Number(var_584);
               var_314 = var_314 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1088 > var_1087 * 1000 && var_1086 < var_1084)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_314);
            _loc5_ = true;
            if(var_1590 && var_1086 > 0)
            {
               _loc6_ = differenceInPercents(var_1589,var_314);
               if(_loc6_ < var_1591)
               {
                  _loc5_ = false;
               }
            }
            var_1088 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1589 = var_314;
               if(sendReport())
               {
                  ++var_1086;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1084 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1085 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1593,var_1329,var_1592,var_1791,var_1137,_loc4_,_loc3_,var_901,var_314,var_902);
            _connection.send(_loc1_);
            var_901 = 0;
            var_314 = 0;
            var_584 = 0;
            var_902 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1087 = int(var_178.getKey("performancetest.interval","60"));
         var_1085 = int(var_178.getKey("performancetest.slowupdatelimit","1000"));
         var_1084 = int(var_178.getKey("performancetest.reportlimit","10"));
         var_1591 = Number(var_178.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1590 = Boolean(int(var_178.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
