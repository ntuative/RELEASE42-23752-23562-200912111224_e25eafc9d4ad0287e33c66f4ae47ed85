package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1497:int = 9;
      
      public static const const_1502:int = 4;
      
      public static const const_1562:int = 1;
      
      public static const const_1314:int = 10;
      
      public static const const_1411:int = 2;
      
      public static const const_1112:int = 7;
      
      public static const const_1344:int = 11;
      
      public static const const_1453:int = 3;
      
      public static const const_1239:int = 8;
      
      public static const const_1196:int = 5;
      
      public static const const_1512:int = 6;
      
      public static const const_1280:int = 12;
       
      
      private var var_2013:String;
      
      private var _roomId:int;
      
      private var var_1090:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2013;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1090 = param1.readInteger();
         var_2013 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1090;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
