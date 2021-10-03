package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1375:int;
      
      private var var_1584:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1584 = param1.readString();
         var_1375 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1375;
      }
      
      public function get productItemType() : String
      {
         return var_1584;
      }
   }
}
