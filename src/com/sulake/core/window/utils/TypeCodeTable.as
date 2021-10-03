package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_677;
         param1["bitmap"] = const_538;
         param1["border"] = const_678;
         param1["border_notify"] = const_1283;
         param1["button"] = const_441;
         param1["button_thick"] = const_656;
         param1["button_icon"] = const_1265;
         param1["button_group_left"] = const_541;
         param1["button_group_center"] = const_706;
         param1["button_group_right"] = const_619;
         param1["canvas"] = const_567;
         param1["checkbox"] = const_524;
         param1["closebutton"] = const_900;
         param1["container"] = const_326;
         param1["container_button"] = const_574;
         param1["display_object_wrapper"] = const_552;
         param1["dropmenu"] = const_461;
         param1["dropmenu_item"] = const_458;
         param1["frame"] = const_303;
         param1["frame_notify"] = const_1316;
         param1["header"] = const_689;
         param1["icon"] = const_973;
         param1["itemgrid"] = const_950;
         param1["itemgrid_horizontal"] = const_432;
         param1["itemgrid_vertical"] = const_657;
         param1["itemlist"] = const_823;
         param1["itemlist_horizontal"] = const_316;
         param1["itemlist_vertical"] = const_328;
         param1["maximizebox"] = const_1308;
         param1["menu"] = const_1216;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_917;
         param1["minimizebox"] = const_1357;
         param1["notify"] = const_1124;
         param1["null"] = const_472;
         param1["password"] = const_596;
         param1["radiobutton"] = const_588;
         param1["region"] = const_440;
         param1["restorebox"] = const_1167;
         param1["scaler"] = const_787;
         param1["scaler_horizontal"] = const_1135;
         param1["scaler_vertical"] = const_1337;
         param1["scrollbar_horizontal"] = const_422;
         param1["scrollbar_vertical"] = const_692;
         param1["scrollbar_slider_button_up"] = const_843;
         param1["scrollbar_slider_button_down"] = const_975;
         param1["scrollbar_slider_button_left"] = const_834;
         param1["scrollbar_slider_button_right"] = const_935;
         param1["scrollbar_slider_bar_horizontal"] = const_800;
         param1["scrollbar_slider_bar_vertical"] = const_804;
         param1["scrollbar_slider_track_horizontal"] = const_959;
         param1["scrollbar_slider_track_vertical"] = const_931;
         param1["scrollable_itemlist"] = const_1235;
         param1["scrollable_itemlist_vertical"] = const_395;
         param1["scrollable_itemlist_horizontal"] = const_906;
         param1["selector"] = const_545;
         param1["selector_list"] = const_631;
         param1["submenu"] = const_917;
         param1["tab_button"] = const_618;
         param1["tab_container_button"] = const_895;
         param1["tab_context"] = const_361;
         param1["tab_content"] = const_819;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_571;
         param1["input"] = const_641;
         param1["toolbar"] = const_1174;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
