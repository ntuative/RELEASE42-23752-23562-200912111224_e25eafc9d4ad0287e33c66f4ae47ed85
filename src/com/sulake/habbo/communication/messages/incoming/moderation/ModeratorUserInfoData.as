package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1735:int;
      
      private var var_1736:int;
      
      private var var_1737:int;
      
      private var _userName:String;
      
      private var var_1738:int;
      
      private var var_1739:int;
      
      private var var_1740:int;
      
      private var _userId:int;
      
      private var var_632:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1739 = param1.readInteger();
         var_1738 = param1.readInteger();
         var_632 = param1.readBoolean();
         var_1737 = param1.readInteger();
         var_1736 = param1.readInteger();
         var_1735 = param1.readInteger();
         var_1740 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1740;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_632;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1738;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1736;
      }
      
      public function get cautionCount() : int
      {
         return var_1735;
      }
      
      public function get cfhCount() : int
      {
         return var_1737;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1739;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
