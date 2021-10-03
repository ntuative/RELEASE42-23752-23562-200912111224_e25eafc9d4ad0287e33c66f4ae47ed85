package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_667:IAssetLoader;
      
      private var var_1072:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1072 = param1;
         var_667 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_667;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_667 != null)
            {
               if(true)
               {
                  var_667.dispose();
                  var_667 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1072;
      }
   }
}
