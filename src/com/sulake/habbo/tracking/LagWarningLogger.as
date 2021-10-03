package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_928:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1257:Boolean = true;
      
      private var var_1086:int = 0;
      
      private var var_798:int = 0;
      
      private var var_1088:int = 0;
      
      private var var_797:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1084:int = 15;
      
      private var var_178:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1087:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1088 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1257)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_798,var_797);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1086;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_798 == 0 && var_797 == 0;
      }
      
      private function resetLog() : void
      {
         var_798 = 0;
         var_797 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1257)
         {
            return;
         }
         if(getTimer() - var_1088 > var_1087 * 1000 && var_1086 < var_1084)
         {
            var_1088 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1087 = int(var_178.getKey("lagwarninglog.interval","60"));
         var_1084 = int(var_178.getKey("lagwarninglog.reportlimit","15"));
         var_1257 = Boolean(int(var_178.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_797 += 1;
            case const_928:
               var_798 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
