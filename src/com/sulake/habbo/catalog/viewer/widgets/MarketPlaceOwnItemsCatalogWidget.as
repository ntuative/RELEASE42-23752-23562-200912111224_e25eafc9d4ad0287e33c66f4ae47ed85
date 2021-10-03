package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferState;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MarketPlaceOwnItemsCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener, IMarketPlaceVisualization
   {
       
      
      private var _itemTemplates:Map;
      
      public function MarketPlaceOwnItemsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         _itemTemplates = new Map();
      }
      
      public function displayMainView() : void
      {
         var _loc1_:XML = getAssetXML("marketPlaceOwnItemsWidget");
         if(_loc1_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         window.procedure = onWidgetEvent;
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
      
      override public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.init();
         if(marketPlace == null)
         {
            return;
         }
         var _loc1_:IHabboWindowManager = marketPlace.windowManager;
         if(_loc1_ == null)
         {
            return;
         }
         _loc3_ = getAssetXML("marketplace_ongoing_item");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_.buildFromXML(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _itemTemplates.add(MarketPlaceOfferState.const_801,_loc2_);
            }
         }
         _loc3_ = getAssetXML("marketplace_sold_item");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_.buildFromXML(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _itemTemplates.add(MarketPlaceOfferState.const_660,_loc2_);
            }
         }
         _loc3_ = getAssetXML("marketplace_expired_item");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_.buildFromXML(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _itemTemplates.add(MarketPlaceOfferState.const_795,_loc2_);
            }
         }
         marketPlace.registerVisualization(this);
         displayMainView();
         marketPlace.requestOwnItems();
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
      
      private function get marketPlace() : IMarketPlace
      {
         return page.viewer.catalog.getMarketPlace();
      }
      
      public function listUpdatedNotify() : void
      {
         if(marketPlace == null)
         {
            return;
         }
         updateList(marketPlace.latestOwnOffers());
      }
      
      private function updateList(param1:Map) : void
      {
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:* = null;
         if(param1 == null)
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
         var _loc6_:Array = param1.getKeys();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc8_ = _loc6_[_loc7_];
            _loc9_ = param1.getValue(_loc8_) as MarketPlaceOfferData;
            _loc5_ = _itemTemplates.getValue(_loc9_.status);
            if(_loc5_)
            {
               _loc10_ = _loc5_.clone() as IWindowContainer;
               if(_loc9_.window == null)
               {
                  _loc9_.window = _loc10_;
               }
               _loc11_ = _loc10_.findChildByName("item_name") as ITextWindow;
               if(_loc11_ != null)
               {
                  _loc11_.text = "${roomItem.name." + _loc9_.furniId + "}";
               }
               _loc12_ = _loc10_.findChildByName("item_desc") as ITextWindow;
               if(_loc12_ != null)
               {
                  _loc12_.text = "${roomItem.desc." + _loc9_.furniId + "}";
               }
               _loc13_ = _loc10_.findChildByName("item_price") as ITextWindow;
               if(_loc13_ != null)
               {
                  _loc14_ = _loc2_.getKey("catalog.marketplace.offer.price_own_item");
                  _loc14_ = _loc14_.replace("%price%",_loc9_.price);
                  _loc13_.text = _loc14_;
               }
               if(_loc9_.status == MarketPlaceOfferState.const_801)
               {
                  _loc15_ = _loc10_.findChildByName("item_time") as ITextWindow;
                  if(_loc15_ != null)
                  {
                     _loc16_ = Math.max(1,_loc9_.timeLeftMinutes);
                     _loc17_ = Math.floor(_loc16_ / 60);
                     _loc18_ = _loc16_ - _loc17_ * 60;
                     _loc19_ = _loc18_ + "" + _loc2_.getKey("catalog.marketplace.offer.minutes");
                     if(_loc17_ > 0)
                     {
                        _loc19_ = _loc17_ + "" + _loc2_.getKey("catalog.marketplace.offer.hours") + " " + _loc19_;
                     }
                     _loc20_ = _loc2_.getKey("catalog.marketplace.offer.time_left");
                     _loc20_ = _loc20_.replace("%time%",_loc19_);
                     _loc15_.text = _loc20_;
                  }
               }
               if(_loc9_.status == MarketPlaceOfferState.const_660)
               {
                  _loc21_ = _loc10_.findChildByName("item_sold") as ITextWindow;
                  if(_loc21_ != null)
                  {
                     _loc21_.text = _loc2_.getKey("catalog.marketplace.offer.sold");
                  }
               }
               if(_loc9_.status == MarketPlaceOfferState.const_795)
               {
                  _loc22_ = _loc10_.findChildByName("item_expired") as ITextWindow;
                  if(_loc22_ != null)
                  {
                     _loc22_.text = _loc2_.getKey("catalog.marketplace.offer.expired");
                  }
               }
               if(_loc9_.image == null)
               {
                  _loc23_ = getFurniImageResult(_loc9_.furniId,_loc9_.furniType);
                  if(_loc23_ != null && _loc23_.data != null)
                  {
                     _loc24_ = _loc23_.data as BitmapData;
                     _loc9_.image = _loc24_;
                     _loc25_ = _loc10_.findChildByName("item_image") as IBitmapWrapperWindow;
                     if(_loc25_ != null)
                     {
                        _loc26_ = new Point((_loc25_.width - _loc24_.width) / 2,(_loc25_.height - _loc24_.height) / 2);
                        if(_loc25_.bitmap == null)
                        {
                           _loc25_.bitmap = new BitmapData(_loc25_.width,_loc25_.height,true,16777215);
                        }
                        _loc25_.bitmap.copyPixels(_loc24_,_loc24_.rect,_loc26_,null,null,true);
                     }
                     _loc9_.imageCallback = _loc23_.id;
                  }
               }
               _loc3_.addGridItem(_loc10_);
               _loc10_.procedure = onGridEvent;
            }
            _loc7_++;
         }
         _loc3_.autoArrangeItems = true;
      }
      
      private function onWidgetEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "redeem_sold":
                  marketPlace.redeemSoldOffers();
            }
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
            if(param2.name == "pick_button")
            {
               _loc3_ = window.findChildByName("item_grid") as IItemGridWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = _loc3_.getGridItemIndex(param1.window.parent);
               _loc5_ = marketPlace.latestOwnOffers();
               _loc6_ = _loc5_.getWithIndex(_loc4_) as MarketPlaceOfferData;
               if(_loc6_)
               {
                  marketPlace.redeemExpiredOffer(_loc6_.offerId);
               }
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
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
