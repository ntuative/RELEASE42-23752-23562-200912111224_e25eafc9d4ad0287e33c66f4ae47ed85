package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_608:IWindowContainer;
      
      private var var_919:ITextWindow;
      
      private var var_191:RoomSettingsCtrl;
      
      private var var_1111:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_445:Timer;
      
      private var var_1115:ITextWindow;
      
      private var var_318:IWindowContainer;
      
      private var var_1676:IWindowContainer;
      
      private var var_1674:ITextWindow;
      
      private var var_737:IWindowContainer;
      
      private var var_1351:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_692:ITextWindow;
      
      private var var_1353:IWindowContainer;
      
      private var var_1116:IWindowContainer;
      
      private var var_736:ITextWindow;
      
      private var var_918:ITextFieldWindow;
      
      private var var_280:IWindowContainer;
      
      private var var_734:ITextWindow;
      
      private var var_1355:IButtonWindow;
      
      private var var_917:ITextWindow;
      
      private var var_2197:int;
      
      private var var_1112:IContainerButtonWindow;
      
      private var var_735:IWindowContainer;
      
      private var var_1110:ITextWindow;
      
      private var var_1113:IContainerButtonWindow;
      
      private var var_1354:ITextWindow;
      
      private var var_1352:IButtonWindow;
      
      private var var_1012:TagRenderer;
      
      private var var_1675:ITextWindow;
      
      private var var_317:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_609:ITextWindow;
      
      private var var_245:RoomThumbnailCtrl;
      
      private var var_1114:IContainerButtonWindow;
      
      private var var_1677:IWindowContainer;
      
      private var var_246:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_317 = new RoomEventViewCtrl(_navigator);
         var_191 = new RoomSettingsCtrl(_navigator,this,true);
         var_245 = new RoomThumbnailCtrl(_navigator);
         var_1012 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_191);
         var_445 = new Timer(6000,1);
         var_445.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_191.active = true;
         this.var_317.active = false;
         this.var_245.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1351.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1352.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1353.visible = Util.hasVisibleChildren(var_1353);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_692.text = param1.roomName;
         var_692.height = NaN;
         _ownerName.text = param1.ownerName;
         var_736.text = param1.description;
         var_1012.refreshTags(var_318,param1.tags);
         var_736.visible = false;
         if(param1.description != "")
         {
            var_736.height = NaN;
            var_736.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_318,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_318,"thumb_down",_loc3_,onThumbDown,0);
         var_1674.visible = _loc3_;
         var_734.visible = !_loc3_;
         var_1354.visible = !_loc3_;
         var_1354.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_318,"home",param2,null,0);
         _navigator.refreshButton(var_318,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_318,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_692.y,0);
         var_318.visible = true;
         var_318.height = Util.getLowestPoint(var_318);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_424,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1355.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1111.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1114.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1112.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1113.visible = _navigator.data.canEditRoomSettings && param1;
         var_1116.visible = Util.hasVisibleChildren(var_1116);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_445.reset();
         this.var_317.active = false;
         this.var_191.active = false;
         this.var_245.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_445.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_445.reset();
         this.var_317.active = false;
         this.var_191.active = false;
         this.var_245.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_424,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_280);
         var_280.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_191.refresh(var_280);
         this.var_245.refresh(var_280);
         Util.moveChildrenToColumn(var_280,["room_details","room_buttons"],0,2);
         var_280.height = Util.getLowestPoint(var_280);
         var_280.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_918.setSelection(0,var_918.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_246);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_317.refresh(var_246);
         if(Util.hasVisibleChildren(var_246) && !this.var_245.active)
         {
            Util.moveChildrenToColumn(var_246,["event_details","event_buttons"],0,2);
            var_246.height = Util.getLowestPoint(var_246);
            var_246.visible = true;
         }
         else
         {
            var_246.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_445.reset();
         this.var_317.active = true;
         this.var_191.active = false;
         this.var_245.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_445.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_919.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_919.height = NaN;
         var_1115.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1115.height = NaN;
         Util.moveChildrenToColumn(var_608,["public_space_name","public_space_desc"],var_919.y,0);
         var_608.visible = true;
         var_608.height = Math.max(86,Util.getLowestPoint(var_608));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_735.visible = true;
            var_918.text = this.getEmbedData();
         }
         else
         {
            var_735.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_445.reset();
         this.var_191.load(param1);
         this.var_191.active = true;
         this.var_317.active = false;
         this.var_245.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_445.reset();
         this.var_191.active = false;
         this.var_317.active = false;
         this.var_245.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_67,false);
         _window.setParamFlag(HabboWindowParam.const_1183,true);
         var_280 = IWindowContainer(find("room_info"));
         var_318 = IWindowContainer(find("room_details"));
         var_608 = IWindowContainer(find("public_space_details"));
         var_1677 = IWindowContainer(find("owner_name_cont"));
         var_1676 = IWindowContainer(find("rating_cont"));
         var_1116 = IWindowContainer(find("room_buttons"));
         var_692 = ITextWindow(find("room_name"));
         var_919 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_736 = ITextWindow(find("room_desc"));
         var_1115 = ITextWindow(find("public_space_desc"));
         var_917 = ITextWindow(find("owner_caption"));
         var_734 = ITextWindow(find("rating_caption"));
         var_1674 = ITextWindow(find("rate_caption"));
         var_1354 = ITextWindow(find("rating_txt"));
         var_246 = IWindowContainer(find("event_info"));
         var_737 = IWindowContainer(find("event_details"));
         var_1353 = IWindowContainer(find("event_buttons"));
         var_1675 = ITextWindow(find("event_name"));
         var_609 = ITextWindow(find("event_desc"));
         var_1111 = IContainerButtonWindow(find("add_favourite_button"));
         var_1114 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1112 = IContainerButtonWindow(find("make_home_button"));
         var_1113 = IContainerButtonWindow(find("unmake_home_button"));
         var_1355 = IButtonWindow(find("room_settings_button"));
         var_1351 = IButtonWindow(find("create_event_button"));
         var_1352 = IButtonWindow(find("edit_event_button"));
         var_735 = IWindowContainer(find("embed_info"));
         var_1110 = ITextWindow(find("embed_info_txt"));
         var_918 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1111,onAddFavouriteClick);
         Util.setProcDirectly(var_1114,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1355,onRoomSettingsClick);
         Util.setProcDirectly(var_1112,onMakeHomeClick);
         Util.setProcDirectly(var_1113,onUnmakeHomeClick);
         Util.setProcDirectly(var_1351,onEventSettingsClick);
         Util.setProcDirectly(var_1352,onEventSettingsClick);
         Util.setProcDirectly(var_918,onEmbedSrcClick);
         _navigator.refreshButton(var_1111,"favourite",true,null,0);
         _navigator.refreshButton(var_1114,"favourite",true,null,0);
         _navigator.refreshButton(var_1112,"home",true,null,0);
         _navigator.refreshButton(var_1113,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_280,onHover);
         Util.setProcDirectly(var_246,onHover);
         var_917.width = var_917.textWidth;
         Util.moveChildrenToRow(var_1677,["owner_caption","owner_name"],var_917.x,var_917.y,3);
         var_734.width = var_734.textWidth;
         Util.moveChildrenToRow(var_1676,["rating_caption","rating_txt"],var_734.x,var_734.y,3);
         var_1110.height = NaN;
         Util.moveChildrenToColumn(var_735,["embed_info_txt","embed_src_txt"],var_1110.y,2);
         var_735.height = Util.getLowestPoint(var_735) + 5;
         var_2197 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1675.text = param1.eventName;
         var_609.text = param1.eventDescription;
         var_1012.refreshTags(var_737,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_609.visible = false;
         if(param1.eventDescription != "")
         {
            var_609.height = NaN;
            var_609.y = Util.getLowestPoint(var_737) + 2;
            var_609.visible = true;
         }
         var_737.visible = true;
         var_737.height = Util.getLowestPoint(var_737);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_854,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
