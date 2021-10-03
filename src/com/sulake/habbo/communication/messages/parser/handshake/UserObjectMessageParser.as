package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_552:String;
      
      private var var_2233:String;
      
      private var var_2229:int;
      
      private var var_2230:int;
      
      private var var_1253:String;
      
      private var var_1195:String;
      
      private var _name:String;
      
      private var var_854:int;
      
      private var var_853:int;
      
      private var var_2232:int;
      
      private var var_1888:int;
      
      private var var_2231:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2230;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1195;
      }
      
      public function get customData() : String
      {
         return this.var_2233;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_854;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2229;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2231;
      }
      
      public function get figure() : String
      {
         return this.var_552;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1888;
      }
      
      public function get sex() : String
      {
         return this.var_1253;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_552 = param1.readString();
         this.var_1253 = param1.readString();
         this.var_2233 = param1.readString();
         this.var_1195 = param1.readString();
         this.var_2232 = param1.readInteger();
         this.var_2231 = param1.readString();
         this.var_2229 = param1.readInteger();
         this.var_2230 = param1.readInteger();
         this.var_1888 = param1.readInteger();
         this.var_853 = param1.readInteger();
         this.var_854 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2232;
      }
      
      public function get respectLeft() : int
      {
         return this.var_853;
      }
   }
}
