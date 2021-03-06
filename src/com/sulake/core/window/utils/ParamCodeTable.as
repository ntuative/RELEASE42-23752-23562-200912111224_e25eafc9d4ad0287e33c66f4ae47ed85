package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_97;
         param1["bound_to_parent_rect"] = const_75;
         param1["child_window"] = const_820;
         param1["embedded_controller"] = const_314;
         param1["resize_to_accommodate_children"] = const_58;
         param1["input_event_processor"] = const_44;
         param1["internal_event_handling"] = const_569;
         param1["mouse_dragging_target"] = const_201;
         param1["mouse_dragging_trigger"] = const_278;
         param1["mouse_scaling_target"] = const_239;
         param1["mouse_scaling_trigger"] = const_438;
         param1["horizontal_mouse_scaling_trigger"] = const_216;
         param1["vertical_mouse_scaling_trigger"] = const_215;
         param1["observe_parent_input_events"] = const_833;
         param1["optimize_region_to_layout_size"] = const_425;
         param1["parent_window"] = const_813;
         param1["relative_horizontal_scale_center"] = const_161;
         param1["relative_horizontal_scale_fixed"] = const_128;
         param1["relative_horizontal_scale_move"] = const_282;
         param1["relative_horizontal_scale_strech"] = const_257;
         param1["relative_scale_center"] = const_958;
         param1["relative_scale_fixed"] = const_562;
         param1["relative_scale_move"] = const_805;
         param1["relative_scale_strech"] = const_794;
         param1["relative_vertical_scale_center"] = const_155;
         param1["relative_vertical_scale_fixed"] = const_103;
         param1["relative_vertical_scale_move"] = const_283;
         param1["relative_vertical_scale_strech"] = const_267;
         param1["on_resize_align_left"] = const_708;
         param1["on_resize_align_right"] = const_394;
         param1["on_resize_align_center"] = const_427;
         param1["on_resize_align_top"] = const_518;
         param1["on_resize_align_bottom"] = const_466;
         param1["on_resize_align_middle"] = const_460;
         param1["on_accommodate_align_left"] = const_974;
         param1["on_accommodate_align_right"] = const_443;
         param1["on_accommodate_align_center"] = const_679;
         param1["on_accommodate_align_top"] = const_941;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_499;
         param1["route_input_events_to_parent"] = const_383;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_989;
         param1["scalable_with_mouse"] = const_921;
         param1["reflect_horizontal_resize_to_parent"] = const_401;
         param1["reflect_vertical_resize_to_parent"] = const_413;
         param1["reflect_resize_to_parent"] = const_246;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
