package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1055:int = 100;
      
      private static const const_1053:int = 200;
      
      private static const const_1054:int = 180;
      
      public static const const_972:int = 1;
      
      public static const const_423:int = 2;
      
      private static const const_1052:int = 250;
      
      private static const const_747:int = 5;
       
      
      private var var_534:BitmapData;
      
      private var var_292:Timer;
      
      private var var_23:IWindowContainer;
      
      private var var_644:BitmapData;
      
      private var var_291:Timer;
      
      private var var_76:IWindowContainer;
      
      private var var_1415:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_291 = new Timer(const_1052,1);
         var_292 = new Timer(const_1055,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_76 = param1;
         var_76.visible = false;
         _assets = param2;
         var_291.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_292.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_644 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_534 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_76.visible = false;
         var_292.reset();
         var_291.reset();
         if(var_23 != null)
         {
            var_23.removeChild(var_76);
         }
      }
      
      public function hideDelayed() : void
      {
         var_292.reset();
         var_291.reset();
         var_292.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_291 != null)
         {
            var_291.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_291.stop();
            var_291 = null;
         }
         if(var_292 != null)
         {
            var_292.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_292.stop();
            var_292 = null;
         }
         _assets = null;
         var_76 = null;
         var_23 = null;
         var_534 = null;
         var_644 = null;
      }
      
      public function showDelayed() : void
      {
         var_292.reset();
         var_291.reset();
         var_291.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_76 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_23 != null)
         {
            var_23.removeChild(var_76);
         }
         var_23 = param1;
         var_1415 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_76.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_76.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1054,param3.width),Math.min(const_1053,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_76.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_76 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_76.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_972:
               _loc2_.bitmap = var_644.clone();
               _loc2_.width = var_644.width;
               _loc2_.height = var_644.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_423:
               _loc2_.bitmap = var_534.clone();
               _loc2_.width = var_534.width;
               _loc2_.height = var_534.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_292.reset();
         var_291.reset();
         if(var_23 == null)
         {
            return;
         }
         var_76.visible = true;
         var_23.addChild(var_76);
         refreshArrow(var_1415);
         switch(var_1415)
         {
            case const_972:
               var_76.x = 0 - const_747;
               break;
            case const_423:
               var_76.x = var_23.width + const_747;
         }
         var_76.y = (0 - 0) / 2;
      }
   }
}
