package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_507:int = 6;
      
      public static const const_208:int = 5;
      
      public static const const_492:int = 2;
      
      public static const const_289:int = 9;
      
      public static const const_238:int = 4;
      
      public static const const_268:int = 2;
      
      public static const const_633:int = 4;
      
      public static const const_206:int = 8;
      
      public static const const_635:int = 7;
      
      public static const const_244:int = 3;
      
      public static const const_296:int = 1;
      
      public static const const_196:int = 5;
      
      public static const const_367:int = 12;
      
      public static const const_301:int = 1;
      
      public static const const_421:int = 11;
      
      public static const const_570:int = 3;
      
      public static const const_1474:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_381:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_381 = new Array();
         var_381.push(new Tab(_navigator,const_296,const_367,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_415));
         var_381.push(new Tab(_navigator,const_268,const_301,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_415));
         var_381.push(new Tab(_navigator,const_238,const_421,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_624));
         var_381.push(new Tab(_navigator,const_244,const_208,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_415));
         var_381.push(new Tab(_navigator,const_196,const_206,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_519));
         setSelectedTab(const_296);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_381)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_381)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_381)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_238;
      }
      
      public function get tabs() : Array
      {
         return var_381;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
