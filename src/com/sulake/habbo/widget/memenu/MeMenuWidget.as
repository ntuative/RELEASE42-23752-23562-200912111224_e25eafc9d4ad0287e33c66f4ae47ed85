package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_644:String = "me_menu_settings_view";
      
      private static const const_774:int = 10;
      
      public static const const_585:String = "me_menu_effects_view";
      
      public static const const_108:String = "me_menu_top_view";
      
      public static const const_1187:String = "me_menu_rooms_view";
      
      public static const const_936:String = "me_menu_dance_moves_view";
      
      public static const const_252:String = "me_menu_my_clothes_view";
       
      
      private var var_2145:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1511:int = 0;
      
      private var var_2148:int = 0;
      
      private var var_2146:Boolean = false;
      
      private var var_273:Boolean = false;
      
      private var var_2149:int = 0;
      
      private var var_1671:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_576:Boolean = false;
      
      private var var_99:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1279:int = 0;
      
      private var var_2147:Boolean = false;
      
      private var var_1026:Point;
      
      private var var_41:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1026 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_2147 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_108);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_612,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_573,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_646,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_614,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_313,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_560,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_378,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_856,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_211,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_184,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_683,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_185,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_293,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_410,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_166,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_576;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_273)
         {
            return;
         }
         if(var_41.window.name == const_644)
         {
            (var_41 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1279 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1511 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1511.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_273 && var_41.window.name == const_252))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_665);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_612,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_573,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_646,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_614,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_313,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_211,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_184,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_683,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_560,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_378,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_856,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_185,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_293,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_410,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_166,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_41 != null)
         {
            var_41.dispose();
            var_41 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_2145;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1671 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_99 != null)
         {
            var_99.dispose();
            var_99 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_2146;
      }
      
      public function get creditBalance() : int
      {
         return var_1511;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_410:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_273 + " view: " + var_41.window.name);
               if(var_273 != true || var_41.window.name != const_108)
               {
                  return;
               }
               (var_41 as MeMenuMainView).setIconAssets("clothes_icon",const_108,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_101:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1671 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_2148;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_576 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_576 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1279 > 0;
         var_1279 = param1.daysLeft;
         var_2148 = param1.periodsLeft;
         var_2149 = param1.pastPeriods;
         var_2145 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_41 != null)
            {
               changeView(var_41.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_2146 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_41 != null && var_41.window.name != const_252)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_41 != null && var_41.window.name == const_252)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_902)
            {
               var_99 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1335);
            }
            else
            {
               var_99 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_468);
            }
            _loc2_ = _mainContainer.getChildByName(var_41.window.name);
            if(_loc2_ != null)
            {
               var_99.window.x = _loc2_.width + const_774;
               _mainContainer.addChild(var_99.window);
               _mainContainer.width = var_99.window.x + var_99.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_576 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_576 = true;
            }
         }
         if(var_41 != null && var_41.window.name == const_585)
         {
            (var_41 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_2149;
      }
      
      public function get habboClubDays() : int
      {
         return var_1279;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1215,HabboWindowStyle.const_864,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_273 = !var_273;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_273 = false;
               break;
            default:
               return;
         }
         if(var_273)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_639);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_41 != null)
         {
            _mainContainer.removeChild(var_41.window);
            var_41.dispose();
            var_41 = null;
         }
         var_273 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_41 != null && var_41.window.name == const_252)
         {
            if(var_99 != null)
            {
               var_99.dispose();
               var_99 = null;
            }
            changeView(const_108);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_2147;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_99 != null)
         {
            var_99.dispose();
            var_99 = null;
         }
         switch(param1)
         {
            case const_108:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_585:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_936:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_252:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1187:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_644:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_41 != null)
            {
               _mainContainer.removeChild(var_41.window);
               var_41.dispose();
               var_41 = null;
            }
            var_41 = _loc2_;
            var_41.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_41 != null)
         {
            var_1026.x = var_41.window.width + 10;
            var_1026.y = var_41.window.height;
            var_41.window.x = 5;
            var_41.window.y = 0;
            _mainContainer.width = var_1026.x;
            _mainContainer.height = var_1026.y;
            if(var_99 != null)
            {
               _mainContainer.width = var_99.window.x + var_99.window.width + const_774;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         changeView(const_108);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_561);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_273 = true;
      }
   }
}
