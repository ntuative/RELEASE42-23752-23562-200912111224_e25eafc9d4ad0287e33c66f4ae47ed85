package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2202:uint;
      
      private var var_755:IWindowToolTipAgentService;
      
      private var var_754:IWindowMouseScalingService;
      
      private var var_393:IWindowContext;
      
      private var var_756:IWindowFocusManagerService;
      
      private var var_752:IWindowMouseListenerService;
      
      private var var_753:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2202 = 0;
         var_122 = param2;
         var_393 = param1;
         var_753 = new WindowMouseDragger(param2);
         var_754 = new WindowMouseScaler(param2);
         var_752 = new WindowMouseListener(param2);
         var_756 = new FocusManager(param2);
         var_755 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_754;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_756;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_755;
      }
      
      public function dispose() : void
      {
         if(var_753 != null)
         {
            var_753.dispose();
            var_753 = null;
         }
         if(var_754 != null)
         {
            var_754.dispose();
            var_754 = null;
         }
         if(var_752 != null)
         {
            var_752.dispose();
            var_752 = null;
         }
         if(var_756 != null)
         {
            var_756.dispose();
            var_756 = null;
         }
         if(var_755 != null)
         {
            var_755.dispose();
            var_755 = null;
         }
         var_393 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_752;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_753;
      }
   }
}
