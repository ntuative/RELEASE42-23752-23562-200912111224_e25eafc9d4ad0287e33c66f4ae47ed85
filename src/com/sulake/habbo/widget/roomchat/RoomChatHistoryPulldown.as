package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_409:int = 2;
      
      public static const const_310:int = 1;
      
      public static const const_187:int = 0;
      
      public static const const_740:int = 3;
      
      private static const const_760:int = 150;
      
      private static const const_761:int = 250;
      
      public static const const_71:int = 39;
       
      
      private var var_1466:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1465:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_2055:int = 0;
      
      private var var_43:IWindowContainer;
      
      private var var_103:IRegionWindow;
      
      private var var_2052:int = 30;
      
      private var _state:int = -1;
      
      private var var_2054:BitmapData;
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2056:BitmapData;
      
      private var var_79:IBitmapWrapperWindow;
      
      private var var_2053:BitmapData;
      
      private var var_2057:BitmapData;
      
      private var var_1464:BitmapData;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param4;
         var_43 = param3;
         var_2057 = (_assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_1465 = (_assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_2053 = (_assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_1464 = (_assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_1466 = (_assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_2054 = (_assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_2056 = (_assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_79 = _windowManager.createWindow("chat_history_bg","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_39,HabboWindowParam.const_67,new Rectangle(0,0,param3.width,param3.height - const_71),null,0,0) as IBitmapWrapperWindow;
         var_43.addChild(var_79);
         _window = _windowManager.createWindow("chat_pulldown","",HabboWindowType.const_53,HabboWindowStyle.const_39,HabboWindowParam.const_37,new Rectangle(0,0 - const_71,param3.width,const_71),null,0) as IWindowContainer;
         var_43.addChild(_window);
         var_103 = _windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_440,HabboWindowStyle.const_40,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_71),null,0) as IRegionWindow;
         if(var_103 != null)
         {
            var_103.background = true;
            var_103.alphaTreshold = 0;
            var_103.addEventListener(WindowMouseEvent.const_55,onPulldownMouseDown);
            var_43.addChild(var_103);
            var_103.toolTipCaption = "${chat.history.drag.tooltip}";
            var_103.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc5_.content as XML);
         _window.addEventListener(WindowMouseEvent.const_55,onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.alphaTreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_95,onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_55,onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_28,onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.alphaTreshold = 0;
         this.state = const_187;
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_2054.clone();
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1466.clone();
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state)
         {
            case const_409:
               var_79.blend += param1 / const_761;
               _window.blend += param1 / const_761;
               if(false)
               {
                  state = const_310;
               }
               break;
            case const_740:
               var_79.blend = 0 - param1 / const_760;
               _window.blend = 0 - param1 / const_760;
               if(true)
               {
                  state = const_187;
               }
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1466.clone();
         }
      }
      
      public function dispose() : void
      {
         if(var_103 != null)
         {
            var_103.dispose();
            var_103 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_79 != null)
         {
            var_79.dispose();
            var_79 = null;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownMouseDown(param1);
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == _state)
         {
            return;
         }
         switch(param1)
         {
            case const_310:
               if(_state == const_187)
               {
                  this.state = const_409;
               }
               else
               {
                  if(_window == null || var_79 == null)
                  {
                     return;
                  }
                  _window.visible = true;
                  var_79.visible = true;
                  var_103.visible = true;
                  _state = param1;
               }
               break;
            case const_187:
               if(_window == null || var_79 == null)
               {
                  return;
               }
               _window.visible = false;
               var_79.visible = false;
               var_103.visible = false;
               _state = param1;
               break;
            case const_409:
               if(_window == null || var_79 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_79.blend = 0;
               _window.visible = true;
               var_79.visible = true;
               _state = param1;
               break;
            case const_740:
               if(_window == null || var_79 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_79.blend = 1;
               _state = param1;
               break;
         }
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = 0 - const_71;
            _window.width = var_43.width;
         }
         if(var_103 != null)
         {
            var_103.x = 0;
            var_103.y = 0 - const_71;
            var_103.width = 0 - var_2052;
         }
         if(var_79 != null)
         {
            var_79.rectangle = var_43.rectangle;
            var_79.height = 0 - const_71;
         }
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1464.clone();
         }
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_window == null)
         {
            return;
         }
         if(var_2055 == _window.width)
         {
            return;
         }
         var_2055 = _window.width;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = var_2053.clone();
            _loc2_.bitmap = var_1464.clone();
            var_2052 = 0 - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               tileBitmapHorz(var_2057.clone(),_loc7_);
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               tileBitmapHorz(var_1465.clone(),_loc8_);
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               tileBitmapHorz(var_1465.clone(),_loc9_);
               _loc4_.bitmap = _loc9_;
            }
         }
         if(var_79 == null)
         {
            return;
         }
         var_79.bitmap = var_2056.clone();
      }
   }
}
