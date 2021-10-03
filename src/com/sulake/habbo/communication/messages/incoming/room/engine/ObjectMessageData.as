package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_974:int = 0;
      
      private var var_973:int = 0;
      
      private var _data:String = "";
      
      private var var_2265:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_2264:String = "";
      
      private var _id:int = 0;
      
      private var var_194:Boolean = false;
      
      private var var_225:int = 0;
      
      private var var_1580:String = null;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_194)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_194)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_194)
         {
            var_225 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_194)
         {
            _state = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return var_1580;
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_194)
         {
            var_1580 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_194)
         {
            _data = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_194 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_194)
         {
            var_974 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_194)
         {
            var_973 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_194)
         {
            var_89 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_973;
      }
      
      public function get sizeX() : int
      {
         return var_974;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_194)
         {
            var_88 = param1;
         }
      }
   }
}
