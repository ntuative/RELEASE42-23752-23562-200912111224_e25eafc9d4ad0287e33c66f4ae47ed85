package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_706:Array;
      
      private var var_420:int;
      
      protected var var_166:Offer;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         var_166 = param1;
         var_706 = param2;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in var_706)
         {
            _loc1_.dispose();
         }
         var_706 = null;
         var_420 = 0;
      }
      
      public function get products() : Array
      {
         return var_706;
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function get firstProduct() : IProduct
      {
         return var_706[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_420 = param1;
      }
      
      public function get iconCallbackId() : int
      {
         return var_420;
      }
      
      public function get offer() : Offer
      {
         return var_166;
      }
   }
}
