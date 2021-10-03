package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_817:String = "price_type_none";
      
      public static const const_380:String = "pricing_model_multi";
      
      public static const const_323:String = "price_type_credits";
      
      public static const const_419:String = "price_type_credits_and_pixels";
      
      public static const const_389:String = "pricing_model_bundle";
      
      public static const const_436:String = "pricing_model_single";
      
      public static const const_653:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1245:String = "pricing_model_unknown";
      
      public static const const_388:String = "price_type_pixels";
       
      
      private var var_742:int;
      
      private var _offerId:int;
      
      private var var_741:int;
      
      private var var_368:String;
      
      private var var_513:String;
      
      private var var_1707:int;
      
      private var var_653:ICatalogPage;
      
      private var var_1121:String;
      
      private var var_369:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1121 = param1.localizationId;
         var_742 = param1.priceInCredits;
         var_741 = param1.priceInPixels;
         var_653 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_368;
      }
      
      public function get page() : ICatalogPage
      {
         return var_653;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1707 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_369;
      }
      
      public function get localizationId() : String
      {
         return var_1121;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_741;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1121 = "";
         var_742 = 0;
         var_741 = 0;
         var_653 = null;
         if(var_369 != null)
         {
            var_369.dispose();
            var_369 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_513;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1707;
      }
      
      public function get priceInCredits() : int
      {
         return var_742;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_368 = const_436;
            }
            else
            {
               var_368 = const_380;
            }
         }
         else if(param1.length > 1)
         {
            var_368 = const_389;
         }
         else
         {
            var_368 = const_1245;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_368)
         {
            case const_436:
               var_369 = new SingleProductContainer(this,param1);
               break;
            case const_380:
               var_369 = new MultiProductContainer(this,param1);
               break;
            case const_389:
               var_369 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_368);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_742 > 0 && var_741 > 0)
         {
            var_513 = const_419;
         }
         else if(var_742 > 0)
         {
            var_513 = const_323;
         }
         else if(var_741 > 0)
         {
            var_513 = const_388;
         }
         else
         {
            var_513 = const_817;
         }
      }
   }
}
