package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var var_552:String;
      
      private var var_1503:UserTagManager;
      
      private var var_694:Array;
      
      private var var_853:int = 0;
      
      private var _furnitureIds:Map;
      
      private var var_1504:GroupDetailsView;
      
      private var _name:String;
      
      private var var_854:int = 0;
      
      private var _furnitureParser:FurnitureDataParser;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_33:IRoomSessionManager;
      
      private var var_1271:BadgeImageManager;
      
      private var var_690:Map;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1195:String;
      
      private var var_1272:Map;
      
      private var var_2134:Boolean;
      
      private var _id:int;
      
      private var var_852:IgnoredUsersManager;
      
      private var var_706:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1019:HabboGroupInfoManager;
      
      private var _gender:String;
      
      private var var_2135:Boolean;
      
      private var var_1018:ProductDataParser;
      
      private var var_178:IHabboConfigurationManager;
      
      private var var_1888:int = 0;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_694 = [];
         var_1503 = new UserTagManager(events);
         var_1019 = new HabboGroupInfoManager(this,events);
         var_852 = new IgnoredUsersManager(this);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private function onProductsReady(param1:Event = null) : void
      {
         var_1018.removeEventListener(ProductDataParser.const_149,onProductsReady);
         var_1018 = null;
         var_1272 = new Map();
         var_690 = new Map();
         _furnitureIds = new Map();
         var _loc2_:String = var_178.getKey("furnidata.load.url");
         var _loc3_:String = var_178.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         _furnitureParser = new FurnitureDataParser(_loc2_,var_1272,var_690,_furnitureIds,_localization);
         _furnitureParser.addEventListener(FurnitureDataParser.const_149,onFurnitureReady);
      }
      
      public function getUserTags(param1:int) : Array
      {
         return var_1503.getTags(param1);
      }
      
      private function onCreditBalance(param1:CreditBalanceEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CreditBalanceParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(events != null)
         {
            events.dispatchEvent(new SessionCreditBalanceEvent(_loc2_.balance));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == _id)
         {
            _name = _loc3_.newName;
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var_706 = new Dictionary();
         var _loc2_:String = var_178.getKey("productdata.load.url");
         var _loc3_:String = var_178.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_1018 = new ProductDataParser(_loc2_,var_706);
         var_1018.addEventListener(ProductDataParser.const_149,onProductsReady);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         return var_706[param1];
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return var_1019.getBadgeId(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         var_852.unignoreUser(param1);
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get systemOpen() : Boolean
      {
         return var_2134;
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return var_1271.getBadgeImage(param1,BadgeImageManager.const_1000);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_178;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         _id = _loc3_.id;
         _name = _loc3_.name;
         var_1888 = _loc3_.respectTotal;
         var_853 = _loc3_.respectLeft;
         var_854 = _loc3_.petRespectLeft;
         var_552 = _loc3_.figure;
         _gender = _loc3_.sex;
         var_1195 = _loc3_.realName;
         var_852.initIgnoreList();
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(var_33 == null || _windowManager == null)
         {
            return;
         }
         var session:IRoomSession = var_33.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || isAnyRoomController)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_156)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return var_1019.getGroupDetails(param1);
      }
      
      public function getFloorItemDataByName(param1:String) : IFurnitureData
      {
         if(_furnitureIds == null)
         {
            return null;
         }
         return getFloorItemData(parseInt(_furnitureIds.getValue(param1)));
      }
      
      public function get userId() : int
      {
         return _id;
      }
      
      public function get realName() : String
      {
         return var_1195;
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function get petRespectLeft() : int
      {
         return var_854;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return var_852.isIgnored(param1);
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
         initBadgeImageManager();
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_2134 = _loc2_.isOpen;
         var_2135 = _loc2_.onShutDown;
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return var_1271.getBadgeImage(param1);
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_853 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         var_853 = var_853 - 1;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         var_178 = param2 as IHabboConfigurationManager;
         initBadgeImageManager();
         (var_178 as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(var_1504 == null)
         {
            var_1504 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = var_1019.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            var_1504.showGroupDetails(param1);
         }
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         _furnitureParser.removeEventListener(FurnitureDataParser.const_149,onFurnitureReady);
         _furnitureParser = null;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_854 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         var_854 = var_854 - 1;
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            var_552 = _loc2_.figure;
            _gender = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(_id,var_552));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(var_178 != null)
         {
            urlString = var_178.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(var_694 == null)
         {
            return false;
         }
         return var_694.indexOf(param1) >= 0;
      }
      
      public function getWallItemDataByName(param1:String) : IFurnitureData
      {
         if(_furnitureIds == null)
         {
            return null;
         }
         return getWallItemData(parseInt(_furnitureIds.getValue(param1)));
      }
      
      public function ignoreUser(param1:String) : void
      {
         var_852.ignoreUser(param1);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         var_694 = _loc2_.rights;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         _communication = param2 as IHabboCommunicationManager;
         if(_communication == null)
         {
            return;
         }
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         _communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(onUserChange));
         _communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         _communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(onAvailabilityStatus));
         _communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(onCreditBalance));
         var_1503.communication = _communication;
         var_1019.communication = _communication;
         var_852.registerMessageEvents();
      }
      
      public function get systemShutDown() : Boolean
      {
         return var_2135;
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(var_1272 == null)
         {
            return null;
         }
         return var_1272.getValue(param1.toString());
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(var_694 == null)
         {
            return false;
         }
         return var_694.indexOf("fuse_any_room_controller") >= 0;
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(var_690 == null)
         {
            return null;
         }
         return var_690.getValue(param1.toString());
      }
      
      private function initBadgeImageManager() : void
      {
         var _loc1_:* = null;
         if(var_1271 != null)
         {
            return;
         }
         if(var_178 == null || _localization == null)
         {
            return;
         }
         if(context is CoreComponent)
         {
            _loc1_ = (context as CoreComponent).assets;
         }
         var_1271 = new BadgeImageManager(_loc1_,events,var_178,_localization);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_33 = param2 as IRoomSessionManager;
      }
      
      public function get respectLeft() : int
      {
         return var_853;
      }
      
      public function get userName() : String
      {
         return _name;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_33;
      }
      
      public function get figure() : String
      {
         return var_552;
      }
   }
}
