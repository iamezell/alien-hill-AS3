package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.events.*;
	
	public class Hero extends MovieClip {

		public var speed:Number = 0;
		public var velocityX:Number = 0;
		public var velocityY:Number = 0;
		public var jumping:Boolean;
		public var inAir:Boolean;
		public var heroDirection:Number = 0;
		public var heroMoveLeft:Boolean;
		public var heroMoveRight:Boolean;
		public var jumpSpeed:Boolean;
		public var walkSpeed:Boolean;
		public var thewidth:Number;
		public var theheight:Number;
		public var gravity:Number;
		public var weapon:String;

		public var jumpStart:Number;
		private var Observers:Array = new Array();
		public var hitPoints:Number;
		public var dead:Boolean = false;
		public var deathAnimationTimer:Timer = new Timer(200,1);
		public var plasmaAmmo:Number = 10;

		public var acidAmmo:Number = 10;
		public var freezeAmmo:Number = 10;

		public var missleAmmo:Number = 10;
		public var bulletAmmo:Number = 1000;
		public var cash:Number = 500;


		//constructor
		public function Hero() {
			speed = 20;
			jumping = false;
			gravity = 2;
			jumpStart = -18;
			weapon = "gun";

			hitPoints = 100;
			//addEventListener(Event.ENTER_FRAME, aniMain);

		}//end Hero constructor

		public function moveLeft() {
			velocityX= -1;

			this.x += velocityX*speed;
		}
		public function moveRight() {
			velocityX = 1;
			this.x += velocityX*speed;
		}
		public function stopMovement() {
			//velocityX= 0;
		}
		public function hit():void {
			hitPoints--;
			//do death scene
			//trace("Jack hit called");
			this.stop();
			this.gotoAndPlay("impact_start");
			if (hitPoints == 0) {
				this.stop();
				this.gotoAndPlay("death_start");
				deleteHero();
			}

		}
		public function destroy():void {
			dead= true;
			parent.removeChild(this);

		}
		public function aniMain(event:Event) {

			if (this.currentLabel == "impact_end" && hitPoints <= 0) {
				//trace("hitpoints zero");
				this.stop();
				this.gotoAndPlay("death_start");

			} else if (this.currentLabel == "death_end") {
				this.stop();
				this.removeEventListener(Event.ENTER_FRAME, aniMain);
				destroy();
			} else if (this.currentLabel =="impact_end") {
				this.stop();
				this.gotoAndStop(1);
			}
		}
		public function deleteHero() {
			this.removeEventListener(Event.ENTER_FRAME, aniMain);
			//trace("delete Hero called");
			//MovieClip(parent).removeHero(this);
			parent.removeChild(this);
		}
		/*public function alienHit(){
		this.stop();
		this.gotoAndPlay(1);
		}*/




	}//end Hero
}//end package