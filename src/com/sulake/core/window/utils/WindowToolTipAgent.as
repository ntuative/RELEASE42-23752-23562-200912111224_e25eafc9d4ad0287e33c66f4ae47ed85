package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_307:Timer;
      
      protected var var_865:String;
      
      protected var var_866:uint;
      
      protected var var_1039:Point;
      
      protected var var_238:IToolTipWindow;
      
      protected var var_1040:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1039 = new Point();
         var_1040 = new Point(20,20);
         var_866 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_307 != null)
         {
            var_307.stop();
            var_307.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_307 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1039);
            if(var_238 != null && true)
            {
               var_238.x = param1 + var_1040.x;
               var_238.y = param2 + var_1040.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_307 != null)
         {
            var_307.reset();
         }
         if(_window && true)
         {
            if(var_238 == null || false)
            {
               var_238 = _window.context.create("undefined::ToolTip",var_865,WindowType.WINDOW_TYPE_TOOLTIP,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_238.x = _loc2_.x + var_1039.x + var_1040.x;
            var_238.y = _loc2_.y + var_1039.y + var_1040.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_865 = IInteractiveWindow(param1).toolTipCaption;
               var_866 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_865 = param1.caption;
               var_866 = 500;
            }
            _mouse.x = var_122.mouseX;
            _mouse.y = var_122.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1039);
            if(var_865 != null && var_865 != "")
            {
               if(var_307 == null)
               {
                  var_307 = new Timer(var_866,1);
                  var_307.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_307.reset();
               var_307.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_238 != null && true)
         {
            var_238.destroy();
            var_238 = null;
         }
      }
   }
}
