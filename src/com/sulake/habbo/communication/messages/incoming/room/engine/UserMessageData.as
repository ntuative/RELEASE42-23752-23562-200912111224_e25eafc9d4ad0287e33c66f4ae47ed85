package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1128:String = "F";
      
      public static const const_806:String = "M";
       
      
      private var var_88:Number = 0;
      
      private var var_552:String = "";
      
      private var var_1937:int = 0;
      
      private var var_1941:String = "";
      
      private var var_1938:int = 0;
      
      private var var_1621:int = 0;
      
      private var var_1940:String = "";
      
      private var var_1253:String = "";
      
      private var _id:int = 0;
      
      private var var_194:Boolean = false;
      
      private var var_225:int = 0;
      
      private var var_1939:String = "";
      
      private var _name:String = "";
      
      private var var_1610:int = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_194)
         {
            var_225 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_194)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1937;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_194)
         {
            var_1938 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1939;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_194)
         {
            var_1940 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_194)
         {
            var_1939 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_194)
         {
            var_1621 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_194)
         {
            var_552 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_194)
         {
            var_1937 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_194)
         {
            var_1253 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1938;
      }
      
      public function get groupID() : String
      {
         return var_1940;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_194)
         {
            var_1610 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_194)
         {
            var_1941 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_194 = true;
      }
      
      public function get sex() : String
      {
         return var_1253;
      }
      
      public function get figure() : String
      {
         return var_552;
      }
      
      public function get webID() : int
      {
         return var_1610;
      }
      
      public function get custom() : String
      {
         return var_1941;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_194)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_194)
         {
            var_89 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_194)
         {
            var_88 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1621;
      }
   }
}
