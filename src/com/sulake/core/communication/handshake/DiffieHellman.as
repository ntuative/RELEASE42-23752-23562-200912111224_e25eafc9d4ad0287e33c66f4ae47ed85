package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1496:BigInteger;
      
      private var var_960:BigInteger;
      
      private var var_2123:BigInteger;
      
      private var var_1497:BigInteger;
      
      private var var_2124:BigInteger;
      
      private var var_1658:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1496 = param1;
         var_2123 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2124.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1497 = new BigInteger();
         var_1497.fromRadix(param1,param2);
         var_2124 = var_1497.modPow(var_960,var_1496);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1658.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_960 = new BigInteger();
         var_960.fromRadix(param1,param2);
         var_1658 = var_2123.modPow(var_960,var_1496);
         return true;
      }
   }
}
