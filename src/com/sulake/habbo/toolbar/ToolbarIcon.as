package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_448:ToolbarIconGroup;
      
      private var var_927:Boolean = false;
      
      private var var_1724:String;
      
      private var var_800:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_926:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var _state:String = "-1";
      
      private var var_103:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_618:String;
      
      private var var_1725:int;
      
      private var var_617:Timer;
      
      private var var_1366:Array;
      
      private var var_929:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2199:Array;
      
      private var var_250:ToolbarBarMenuAnimator;
      
      private var var_375:ToolbarIconAnimator;
      
      private var var_516:Array;
      
      private var var_746:Array;
      
      private var var_745:String = "-1";
      
      private var var_2267:Boolean = true;
      
      private var var_928:Array;
      
      private var var_1124:Timer;
      
      private var var_1726:int;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_516 = new Array();
         var_746 = new Array();
         var_2199 = new Array();
         var_929 = new ToolbarIconBouncer(0.8,1);
         super();
         var_448 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_618 = param4;
         _events = param5;
         var_250 = param6;
         var_1124 = new Timer(40,40);
         var_1124.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_103 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_440,HabboWindowStyle.const_40,HabboWindowParam.const_37,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_103.background = true;
         var_103.alphaTreshold = 0;
         var_103.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_103.addChild(_window);
         _window.addEventListener(WindowEvent.const_43,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1366[var_928.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1726;
      }
      
      public function get iconId() : String
      {
         return var_618;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_800 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         _state = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_103 == null || _window == null)
         {
            return;
         }
         var_103.width = _window.width;
         var_103.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_88 = (0 - 0) / 2;
            _y = var_800 + (0 - 0) / 2;
         }
         else
         {
            var_88 = var_800 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_103.x = var_88;
         var_103.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_103 != null)
         {
            var_103.dispose();
            var_103 = null;
         }
         var_516 = null;
         var_746 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_250 = null;
         var_375 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_516.indexOf(param1) < 0)
         {
            var_516.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_746.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_927)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_250)
               {
                  var_250.repositionWindow(var_618,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_61);
                  _loc4_.iconId = var_618;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_926;
                  }
               }
               break;
            case WindowMouseEvent.const_28:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_745;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_516.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_746[var_516.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_927 = param1;
         if(var_103 != null)
         {
            var_103.visible = var_927;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_103 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_103.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_103.toolTipCaption = "${toolbar.icon.tooltip." + var_1724.toLowerCase() + "}";
         }
         var_103.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_250 != null)
         {
            var_250.animateWindowIn(this,param1,param2,var_618,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_375 != null && _window != null)
         {
            var_375.update(_window);
            if(var_375.hasNextState())
            {
               state = var_375.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1366 = new Array();
         var_928 = new Array();
         var_1724 = param1.@id;
         var_1726 = int(param1.@window_offset_from_icon);
         var_1725 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_926 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_745 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_928.push(_loc5_.id);
               var_1366.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_926 == "-1")
                  {
                     var_926 = _loc5_.id;
                  }
                  if(var_745 == "-1")
                  {
                     var_745 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         _state = var_745;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_250 != null)
         {
            var_250.hideWindow(param1,param2,var_618,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_250 != null)
         {
            var_250.positionWindow(this,param1,param2,var_618,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_250 != null)
         {
            var_250.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_927;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_929 != null && _window != null)
         {
            var_929.update();
            _window.y = var_929.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_617 != null)
         {
            var_617.stop();
            var_617 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_927)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_375 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_88,_y,_bitmapData);
            if(false)
            {
               var_617 = new Timer(_loc1_.timer);
               var_617.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_617.start();
            }
            if(_loc1_.bounce)
            {
               var_929.reset(-7);
               var_1124.reset();
               var_1124.start();
            }
         }
         else
         {
            var_375 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1725 + var_448.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(_state);
      }
      
      public function get window() : IWindow
      {
         return var_103;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_746[var_516.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_448;
      }
   }
}
