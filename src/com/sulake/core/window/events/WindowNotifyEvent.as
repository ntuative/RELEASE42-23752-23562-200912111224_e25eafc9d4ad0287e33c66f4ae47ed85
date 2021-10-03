package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1188:String = "WN_CREATED";
      
      public static const const_968:String = "WN_DISABLE";
      
      public static const const_822:String = "WN_DEACTIVATED";
      
      public static const const_991:String = "WN_OPENED";
      
      public static const const_853:String = "WN_CLOSED";
      
      public static const const_837:String = "WN_DESTROY";
      
      public static const const_1418:String = "WN_ARRANGED";
      
      public static const const_404:String = "WN_PARENT_RESIZED";
      
      public static const const_888:String = "WN_ENABLE";
      
      public static const const_978:String = "WN_RELOCATE";
      
      public static const const_898:String = "WN_FOCUS";
      
      public static const const_960:String = "WN_PARENT_RELOCATED";
      
      public static const const_344:String = "WN_PARAM_UPDATED";
      
      public static const const_676:String = "WN_PARENT_ACTIVATED";
      
      public static const const_248:String = "WN_RESIZED";
      
      public static const const_859:String = "WN_CLOSE";
      
      public static const const_816:String = "WN_PARENT_REMOVED";
      
      public static const const_236:String = "WN_CHILD_RELOCATED";
      
      public static const const_530:String = "WN_ENABLED";
      
      public static const const_258:String = "WN_CHILD_RESIZED";
      
      public static const const_779:String = "WN_MINIMIZED";
      
      public static const const_523:String = "WN_DISABLED";
      
      public static const const_195:String = "WN_CHILD_ACTIVATED";
      
      public static const const_368:String = "WN_STATE_UPDATED";
      
      public static const const_554:String = "WN_UNSELECTED";
      
      public static const const_457:String = "WN_STYLE_UPDATED";
      
      public static const const_1555:String = "WN_UPDATE";
      
      public static const const_445:String = "WN_PARENT_ADDED";
      
      public static const const_647:String = "WN_RESIZE";
      
      public static const const_694:String = "WN_CHILD_REMOVED";
      
      public static const const_1435:String = "";
      
      public static const const_775:String = "WN_RESTORED";
      
      public static const const_297:String = "WN_SELECTED";
      
      public static const const_785:String = "WN_MINIMIZE";
      
      public static const const_862:String = "WN_FOCUSED";
      
      public static const const_1226:String = "WN_LOCK";
      
      public static const const_281:String = "WN_CHILD_ADDED";
      
      public static const const_880:String = "WN_UNFOCUSED";
      
      public static const const_358:String = "WN_RELOCATED";
      
      public static const const_827:String = "WN_DEACTIVATE";
      
      public static const const_1229:String = "WN_CRETAE";
      
      public static const const_857:String = "WN_RESTORE";
      
      public static const const_324:String = "WN_ACTVATED";
      
      public static const const_1243:String = "WN_LOCKED";
      
      public static const const_403:String = "WN_SELECT";
      
      public static const const_927:String = "WN_MAXIMIZE";
      
      public static const const_842:String = "WN_OPEN";
      
      public static const const_669:String = "WN_UNSELECT";
      
      public static const const_1518:String = "WN_ARRANGE";
      
      public static const const_1214:String = "WN_UNLOCKED";
      
      public static const const_1436:String = "WN_UPDATED";
      
      public static const const_930:String = "WN_ACTIVATE";
      
      public static const const_1248:String = "WN_UNLOCK";
      
      public static const const_841:String = "WN_MAXIMIZED";
      
      public static const const_987:String = "WN_DESTROYED";
      
      public static const const_1004:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1523,cancelable);
      }
   }
}
