package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2207:Boolean;
      
      private var var_2206:int;
      
      private var var_2205:Boolean;
      
      private var var_1398:String;
      
      private var var_1195:String;
      
      private var var_1970:int;
      
      private var var_1835:String;
      
      private var var_2204:String;
      
      private var var_1834:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1970 = param1.readInteger();
         this.var_1398 = param1.readString();
         this.var_1835 = param1.readString();
         this.var_2207 = param1.readBoolean();
         this.var_2205 = param1.readBoolean();
         param1.readString();
         this.var_2206 = param1.readInteger();
         this.var_1834 = param1.readString();
         this.var_2204 = param1.readString();
         this.var_1195 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1195;
      }
      
      public function get avatarName() : String
      {
         return this.var_1398;
      }
      
      public function get avatarId() : int
      {
         return this.var_1970;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2207;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2204;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1834;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2205;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1835;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2206;
      }
   }
}
