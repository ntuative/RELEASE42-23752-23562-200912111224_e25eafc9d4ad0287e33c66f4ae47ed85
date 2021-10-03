package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MarketPlaceCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener, IMarketPlaceVisualization
   {
       
      
      private const const_1379:int = 20;
      
      private const const_748:Array = [2,3,4,6,8,10,15,20,30,50,100];
      
      private const const_1590:int = 3;
      
      public function MarketPlaceCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function updateList(param1:Map) : void
      {
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(!marketPlace)
         {
            return;
         }
         var _loc2_:ICoreLocalizationManager = marketPlace.localization;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IItemGridWindow = window.findChildByName("item_grid") as IItemGridWindow;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.removeGridItems();
         _loc3_.autoArrangeItems = false;
         var _loc4_:XML = getAssetXML("marketplace_offers_item");
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:IHabboWindowManager = marketPlace.windowManager;
         var _loc6_:IWindowContainer = _loc5_.buildFromXML(_loc4_) as IWindowContainer;
         var _loc8_:Array = param1.getKeys();
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc10_ = _loc8_[_loc9_];
            _loc11_ = param1.getValue(_loc10_) as MarketPlaceOfferData;
            if(_loc11_.window == null)
            {
               _loc12_ = _loc6_.clone() as IWindowContainer;
               _loc11_.window = _loc12_;
            }
            else
            {
               _loc12_ = _loc11_.window;
            }
            _loc13_ = _loc12_.findChildByName("item_name") as ITextWindow;
            if(_loc13_ != null)
            {
               _loc13_.text = "${roomItem.name." + _loc11_.furniId + "}";
            }
            _loc14_ = _loc12_.findChildByName("item_desc") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.text = "${roomItem.desc." + _loc11_.furniId + "}";
            }
            _loc15_ = _loc12_.findChildByName("item_price") as ITextWindow;
            if(_loc15_ != null)
            {
               _loc16_ = _loc2_.getKey("catalog.marketplace.offer.price_public_item");
               _loc16_ = _loc16_.replace("%price%",_loc11_.price);
               _loc15_.text = _loc16_;
            }
            if(_loc11_.image == null)
            {
               _loc17_ = getFurniImageResult(_loc11_.furniId,_loc11_.furniType);
               if(_loc17_ != null && _loc17_.data != null)
               {
                  _loc18_ = _loc17_.data as BitmapData;
                  _loc11_.image = _loc18_;
                  _loc19_ = _loc12_.findChildByName("item_image") as IBitmapWrapperWindow;
                  if(_loc19_ != null)
                  {
                     _loc20_ = new Point((_loc19_.width - _loc18_.width) / 2,(_loc19_.height - _loc18_.height) / 2);
                     if(_loc19_.bitmap == null)
                     {
                        _loc19_.bitmap = new BitmapData(_loc19_.width,_loc19_.height,true,16777215);
                     }
                     _loc19_.bitmap.copyPixels(_loc18_,_loc18_.rect,_loc20_,null,null,true);
                  }
                  _loc11_.imageCallback = _loc17_.id;
               }
            }
            _loc3_.addGridItem(_loc12_);
            _loc12_.procedure = onGridEvent;
            _loc9_++;
         }
         _loc3_.autoArrangeItems = true;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:Map = marketPlace.latestOffers();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = _loc3_.getKeys();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_];
            _loc7_ = _loc3_.getValue(_loc6_) as MarketPlaceOfferData;
            if(_loc7_.imageCallback == param1)
            {
               _loc7_.image = param2;
               _loc8_ = _loc7_.window;
               _loc9_ = _loc8_.findChildByName("item_image") as IBitmapWrapperWindow;
               if(_loc9_ != null)
               {
                  _loc9_.bitmap = new BitmapData(_loc9_.width,_loc9_.height,true,16777215);
                  _loc10_ = new Point((_loc9_.width - param2.width) / 2,(_loc9_.height - param2.height) / 2);
                  _loc9_.bitmap.copyPixels(param2,param2.rect,_loc10_,null,null,true);
               }
               return;
            }
            _loc5_++;
         }
      }
      
      private function onGridEvent(param1:WindowEvent, param2:IWindow = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(!marketPlace)
            {
               return;
            }
            if(param2.name == "buy_button")
            {
               _loc3_ = window.findChildByName("item_grid") as IItemGridWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = _loc3_.getGridItemIndex(param1.window.parent);
               _loc5_ = marketPlace.latestOffers();
               _loc6_ = _loc5_.getWithIndex(_loc4_) as MarketPlaceOfferData;
               if(_loc6_)
               {
                  marketPlace.buyOffer(_loc6_.offerId);
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function displayMainView() : void
      {
         var _loc1_:XML = getAssetXML("marketPlaceWidget");
         if(_loc1_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         window.procedure = onWidgetEvent;
         var _loc2_:IDropMenuWindow = _window.findChildByName("search_drop") as IDropMenuWindow;
         if(_loc2_ != null)
         {
            _loc2_.populate(const_748);
            _loc2_.selection = 0;
         }
      }
      
      public function listUpdatedNotify() : void
      {
         if(marketPlace == null)
         {
            return;
         }
         updateList(marketPlace.latestOffers());
      }
      
      override public function init() : void
      {
         super.init();
         if(marketPlace == null)
         {
            return;
         }
         marketPlace.registerVisualization(this);
         displayMainView();
      }
      
      private function get marketPlace() : IMarketPlace
      {
         return page.viewer.catalog.getMarketPlace();
      }
      
      private function onWidgetEvent(param1:WindowEvent, param2:IWindow = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         var _loc3_:ICoreLocalizationManager = marketPlace.localization;
         var _loc4_:ITextWindow = _window.findChildByName("search_input") as ITextWindow;
         if(param1.type == WindowEvent.const_52)
         {
            if(param2.name == "search_drop")
            {
               _loc5_ = (_window.findChildByName("search_drop") as IDropMenuWindow).selection;
               _loc6_ = 0;
               if(marketPlace)
               {
                  marketPlace.requestOffersByPrice(_loc6_);
               }
            }
         }
         else if(param1.type == WindowKeyboardEvent.const_125)
         {
            if(param2.name == "search_input")
            {
               if(_loc4_ && _loc4_.text.length >= const_1379)
               {
                  _loc4_.text = _loc4_.text.substr(0,const_1379);
               }
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(!marketPlace)
            {
               return;
            }
            switch(param2.name)
            {
               case "search_input":
                  if(_loc3_ && _loc4_ && _loc4_.text == _loc3_.getKey("catalog.marketplace.search_name"))
                  {
                     _loc4_.text = "";
                  }
                  break;
               case "search_button":
                  if(_loc3_ && _loc4_ && _loc4_.text == _loc3_.getKey("catalog.marketplace.search_name"))
                  {
                     return;
                  }
                  if(marketPlace && _loc4_.text.length >= const_1590)
                  {
                     marketPlace.requestOffersByName(_loc4_.text);
                  }
                  break;
            }
         }
      }
      
      private function getFurniImageResult(param1:int, param2:int, param3:String = null) : ImageResult
      {
         if(page.viewer.roomEngine == null)
         {
            return null;
         }
         if(param2 == 1)
         {
            return page.viewer.roomEngine.getFurnitureIcon(param1,this);
         }
         if(param2 == 2)
         {
            return page.viewer.roomEngine.getWallItemIcon(param1,this,param3);
         }
         return null;
      }
      
      private function getAssetXML(param1:String) : XML
      {
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as XML;
      }
   }
}
