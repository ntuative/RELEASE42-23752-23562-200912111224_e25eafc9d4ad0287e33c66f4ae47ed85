package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_1003:String = "AssetLoaderEventUnload";
      
      public static const const_48:String = "AssetLoaderEventError";
      
      public static const const_830:String = "AssetLoaderEventOpen";
      
      public static const const_839:String = "AssetLoaderEventProgress";
      
      public static const const_824:String = "AssetLoaderEventStatus";
      
      public static const const_30:String = "AssetLoaderEventComplete";
       
      
      private var var_354:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_354 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_354;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_354);
      }
   }
}
