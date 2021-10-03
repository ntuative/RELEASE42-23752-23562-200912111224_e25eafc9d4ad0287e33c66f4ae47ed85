package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_89:Number = 0;
      
      private var _data:String = "";
      
      private var var_2265:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2092:Boolean = false;
      
      private var var_2264:String = "";
      
      private var _id:int = 0;
      
      private var var_194:Boolean = false;
      
      private var var_225:String = "";
      
      private var var_2090:int = 0;
      
      private var var_2091:int = 0;
      
      private var var_1915:int = 0;
      
      private var var_1919:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2092 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_194)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2092;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_194)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_225;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_194)
         {
            var_1915 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_194)
         {
            var_2090 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_194)
         {
            var_2091 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_194)
         {
            var_225 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_194)
         {
            var_1919 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_194)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1915;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_194)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2090;
      }
      
      public function get wallY() : Number
      {
         return var_2091;
      }
      
      public function get localY() : Number
      {
         return var_1919;
      }
      
      public function setReadOnly() : void
      {
         var_194 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_194)
         {
            var_89 = param1;
         }
      }
   }
}
