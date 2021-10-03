package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_150:uint = 3;
      
      private static const const_1065:String = "library";
      
      public static const const_1355:int = 6;
      
      private static const const_1069:String = "library";
      
      public static const const_1154:int = 99;
      
      private static const const_1064:String = "library";
      
      private static const const_1070:String = "zip-libraries";
      
      public static const const_1210:int = 10;
      
      public static const const_901:int = 1;
      
      public static const const_1144:int = 2;
      
      public static const const_1295:int = 20;
      
      private static const const_1071:String = "library";
      
      private static const const_1066:String = "asset-libraries";
      
      public static const const_1224:int = 5;
      
      public static const const_713:int = 30;
      
      public static const const_600:int = 4;
      
      public static const const_1176:int = 3;
      
      private static const const_1067:String = "service-libraries";
      
      private static const const_1068:String = "component-libraries";
       
      
      private var var_547:Number = 0;
      
      private var var_108:ICoreConfigStatusListener;
      
      private var var_395:uint;
      
      private var var_261:Array;
      
      private var var_263:uint;
      
      private var var_122:DisplayObjectContainer;
      
      private var var_814:Profiler;
      
      private var var_262:Array;
      
      private var var_224:Array;
      
      private var var_548:Array;
      
      private var var_665:Array;
      
      private var var_264:Array;
      
      private var var_666:ProfilerViewer;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_877 = (param2 & 0) != 0;
         var_548 = new Array();
         var_665 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_150)
         {
            var_548.push(new Array());
            var_665.push(0);
            _loc3_++;
         }
         var_395 = getTimer();
         attachComponent(this,[new IIDCore()]);
         var_122 = param1;
         switch(param2 & 0)
         {
            case Core.const_1131:
               debug("Core; using simple frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_871:
               debug("Core; using complex frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1192:
               debug("Core; using profiler frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_814 = new Profiler(this);
               attachComponent(var_814,[new IIDProfiler()]);
               var_666 = new ProfilerViewer();
               var_122.addChild(var_666);
         }
      }
      
      override public function removeUpdateReceiver(param1:ICoreUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_150)
         {
            _loc3_ = var_548[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_864;
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param2)
         {
            if(param4 != null)
            {
               ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
            }
            ErrorReportStorage.setParameter("error_cat",String(param3));
            ErrorReportStorage.setParameter("error_desc",param1);
         }
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function updateConfigStatusListener() : void
      {
         var _loc1_:* = NaN;
         if(var_108)
         {
            _loc1_ = NaN;
            if(var_547 > 0)
            {
               _loc1_ += var_547 + var_224.length - 1;
            }
            else
            {
               _loc1_ += var_224.length;
            }
            var_108.percent = (Number(var_263) - _loc1_) / Number(var_263);
         }
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_395;
         var_395 = msCurrentTime;
         var_814.start();
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            var_665[criticality] = 0;
            receivers = var_548[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_814.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_814.stop();
         var_666.refresh(var_814);
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_395;
         var maxTimePerFrame:uint = 1000 / DisplayObject(var_122).stage.frameRate;
         var_395 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_665[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_665[criticality] = 0;
               receivers = var_548[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = ICoreUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_395;
         var_395 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            var_665[criticality] = 0;
            receivers = var_548[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function loadExternalConfigDocument(param1:URLRequest, param2:ICoreConfigStatusListener = null) : void
      {
         if(var_108)
         {
            if(var_108 != param2)
            {
               var_108.dispose();
            }
         }
         if(param2)
         {
            var_108 = param2;
         }
         var _loc3_:AssetLoaderStruct = _assets.loadAssetFromFile("config.xml",param1);
         debug("Loading config document \"" + _loc3_.assetLoader.url + "\"");
         _loc3_.addEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc3_.addEventListener(AssetLoaderEvent.const_48,configLoadedHandler);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_122.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_122 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_150)
            {
               _loc2_ = var_548[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_224 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_224.pop();
               }
            }
            if(var_264 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_264.pop();
               }
            }
            if(var_261 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_261.pop();
               }
            }
            if(var_262 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_262.pop();
               }
            }
            if(var_666 != null)
            {
               var_666.dispose();
               var_666 = null;
            }
            if(var_108)
            {
               var_108.dispose();
               var_108 = null;
            }
            super.dispose();
         }
      }
      
      public function readConfigDocument(param1:XML, param2:ICoreConfigStatusListener = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_108)
         {
            if(var_108 != param2)
            {
               var_108.dispose();
            }
         }
         if(param2)
         {
            var_108 = param2;
         }
         debug("Parsing config document");
         if(var_224 == null)
         {
            var_224 = new Array();
         }
         _loc3_ = param1.child(const_1070)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1065);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_224.push(_loc6_);
               ++var_263;
            }
         }
         if(var_264 == null)
         {
            var_264 = new Array();
         }
         _loc3_ = param1.child(const_1066)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1069);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_264.push(_loc6_);
               ++var_263;
            }
         }
         if(var_261 == null)
         {
            var_261 = new Array();
         }
         _loc3_ = param1.child(const_1067)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1071);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_261.push(_loc6_);
               ++var_263;
            }
         }
         if(var_262 == null)
         {
            var_262 = new Array();
         }
         _loc3_ = param1.child(const_1068)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1064);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_262.push(_loc6_);
               ++var_263;
            }
         }
         if(var_108)
         {
            var_108.percent = 0;
         }
         updateLoadingProcess();
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_224[0] == _loc3_)
                  {
                     var_547 = 0;
                     var_224.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_264[0] == _loc3_)
                  {
                     var_264.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_261[0] == _loc3_)
                  {
                     var_261.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_262[0] == _loc3_)
                  {
                     var_262.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_224.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               debug("Loading zip library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_264.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               var_547 = 1;
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading asset library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_261.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading service library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_262.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading component library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(var_108)
         {
            var_108.complete();
         }
         debug("All libraries loaded, Core is now running");
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\": " + _loc2_.getLastErrorMessage(),true,const_1144);
         updateLoadingProcess(param1);
      }
      
      private function updateArchiveLoadingItemProgress(param1:ProgressEvent) : void
      {
         var_547 = 1 - param1.bytesLoaded / param1.bytesTotal;
         if(var_547 > 0)
         {
            updateConfigStatusListener();
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2180;
      }
      
      override public function registerUpdateReceiver(param1:ICoreUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_150 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_548[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_48,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_30)
         {
            debug("Config document \"" + _loc2_.assetLoader.url + "\" loaded");
            _loc3_ = _assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            readConfigDocument(_loc4_,var_108);
         }
         else
         {
            error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,const_901);
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      public function get root() : DisplayObjectContainer
      {
         return var_122;
      }
   }
}
