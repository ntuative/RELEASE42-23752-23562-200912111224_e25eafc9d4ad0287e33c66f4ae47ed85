package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_887:SoundChannel = null;
      
      private var var_716:Boolean;
      
      private var var_886:Sound = null;
      
      private var var_627:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_886 = param1;
         var_886.addEventListener(Event.COMPLETE,onComplete);
         var_627 = 1;
         var_716 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_716;
      }
      
      public function stop() : Boolean
      {
         var_887.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_716 = false;
         var_887 = var_886.play(0);
         this.volume = var_627;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_627;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_887.position;
      }
      
      public function get length() : Number
      {
         return var_886.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_627 = param1;
         if(var_887 != null)
         {
            var_887.soundTransform = new SoundTransform(var_627);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_716 = true;
      }
   }
}
