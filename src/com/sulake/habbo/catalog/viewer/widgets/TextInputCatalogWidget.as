package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
   
   public class TextInputCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_988:ITextFieldWindow;
      
      public function TextInputCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function init() : void
      {
         super.init();
         var_988 = _window.findChildByName("input_text") as ITextFieldWindow;
         if(var_988 != null)
         {
            var_988.addEventListener(WindowKeyboardEvent.const_908,onKey);
         }
      }
      
      private function onKey(param1:WindowKeyboardEvent) : void
      {
         if(var_988 == null)
         {
            return;
         }
         events.dispatchEvent(new TextInputEvent(var_988.text));
      }
   }
}
