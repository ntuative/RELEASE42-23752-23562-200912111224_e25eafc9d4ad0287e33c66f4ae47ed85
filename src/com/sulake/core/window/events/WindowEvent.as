package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_315:String = "WE_CHILD_RESIZED";
      
      public static const const_1332:String = "WE_CLOSE";
      
      public static const const_1159:String = "WE_DESTROY";
      
      public static const const_207:String = "WE_CHANGE";
      
      public static const const_1193:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1422:String = "WE_PARENT_RESIZE";
      
      public static const const_83:String = "WE_UPDATE";
      
      public static const const_1109:String = "WE_MAXIMIZE";
      
      public static const const_451:String = "WE_DESTROYED";
      
      public static const const_990:String = "WE_UNSELECT";
      
      public static const const_1179:String = "WE_MAXIMIZED";
      
      public static const const_1527:String = "WE_UNLOCKED";
      
      public static const const_355:String = "WE_CHILD_REMOVED";
      
      public static const const_156:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1151:String = "WE_ACTIVATE";
      
      public static const const_231:String = "WE_ENABLED";
      
      public static const const_431:String = "WE_CHILD_RELOCATED";
      
      public static const const_1194:String = "WE_CREATE";
      
      public static const const_625:String = "WE_SELECT";
      
      public static const const_165:String = "";
      
      public static const const_1442:String = "WE_LOCKED";
      
      public static const const_1415:String = "WE_PARENT_RELOCATE";
      
      public static const const_1400:String = "WE_CHILD_REMOVE";
      
      public static const const_1448:String = "WE_CHILD_RELOCATE";
      
      public static const const_1466:String = "WE_LOCK";
      
      public static const const_275:String = "WE_FOCUSED";
      
      public static const const_511:String = "WE_UNSELECTED";
      
      public static const const_944:String = "WE_DEACTIVATED";
      
      public static const const_1218:String = "WE_MINIMIZED";
      
      public static const const_1514:String = "WE_ARRANGED";
      
      public static const const_1486:String = "WE_UNLOCK";
      
      public static const const_1508:String = "WE_ATTACH";
      
      public static const const_1149:String = "WE_OPEN";
      
      public static const const_1310:String = "WE_RESTORE";
      
      public static const const_1450:String = "WE_PARENT_RELOCATED";
      
      public static const const_1145:String = "WE_RELOCATE";
      
      public static const const_1416:String = "WE_CHILD_RESIZE";
      
      public static const const_1520:String = "WE_ARRANGE";
      
      public static const const_1321:String = "WE_OPENED";
      
      public static const const_1347:String = "WE_CLOSED";
      
      public static const const_1561:String = "WE_DETACHED";
      
      public static const const_1433:String = "WE_UPDATED";
      
      public static const const_1352:String = "WE_UNFOCUSED";
      
      public static const const_366:String = "WE_RELOCATED";
      
      public static const const_1250:String = "WE_DEACTIVATE";
      
      public static const const_192:String = "WE_DISABLED";
      
      public static const const_606:String = "WE_CANCEL";
      
      public static const const_623:String = "WE_ENABLE";
      
      public static const const_1130:String = "WE_ACTIVATED";
      
      public static const const_1271:String = "WE_FOCUS";
      
      public static const const_1401:String = "WE_DETACH";
      
      public static const const_1298:String = "WE_RESTORED";
      
      public static const const_1258:String = "WE_UNFOCUS";
      
      public static const const_52:String = "WE_SELECTED";
      
      public static const const_1262:String = "WE_PARENT_RESIZED";
      
      public static const const_1296:String = "WE_CREATED";
      
      public static const const_1479:String = "WE_ATTACHED";
      
      public static const const_1197:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1523:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1307:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1523 = param3;
         var_1307 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1307;
      }
      
      public function get related() : IWindow
      {
         return var_1523;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1307 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
