package {
	import flash.display.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.events.*;
	import flash.media.*;
	
	public class Alien extends MovieClip implements IObserver {

		public var speed:Number = 0;
		public var vx:Number = 0;
		public var vy:Number = 0;
		public var thewidth:Number;
		public var theheight:Number;
		public var gravity:Number;
		public var theMouseX:Number;
		public var theMouseY:Number;
		//public var rotation:Number = 0;;
		public var myAngle:Number;
		public var dx:Number;
		public var dy:Number;
		var gameTimer:Timer = new Timer(30);
		private var targetX:Number = 0;
		private var targetY:Number = 0;
		private var targetAngle:Number = 0;
		private var target2X:Number = 0;
		private var target2Y:Number = 0;
		private var target2Angle:Number = 0;
		public var hitPoints:Number = 0;
		public var timesHit:Number = 0;
		public var impactStartTimer:Timer = new Timer(0,1);
		public var impactFinishTimer:Timer = new Timer(200,1);
		public var impactFreezeFinishTimer:Timer = new Timer(3000,1);
		public var impactFreezeStartTimer:Timer = new Timer(0,1);
		public var deathAnimationTimer:Timer = new Timer(200,1);
		public var WalkAnimation:IWalkAnimation;

		public var jumpStart:Number;
		//public var alienDeathSound:Sound = new AlienDeathSound2();
		//constructor
		public function Alien() {
			//gameTimer.addEventListener("timer",moveItNow);
			addEventListener(Event.ENTER_FRAME, moveAndAttack);
			impactStartTimer.addEventListener(TimerEvent.TIMER,impactStart);
			impactFinishTimer.addEventListener(TimerEvent.TIMER,impactFinish);
			impactFreezeFinishTimer.addEventListener(TimerEvent.TIMER,impactFreezeFinish);
			impactFreezeStartTimer.addEventListener(TimerEvent.TIMER,impactFreezeStart);
			deathAnimationTimer.addEventListener(TimerEvent.TIMER,impactStart);
			//gameTimer.start();
			speed = 10;

		}//end Hero constructor

		public function setUp():void {
			MovieClip(parent).registerObserver(this);
		}
		public function moveAndAttack(event:Event) {
			//so lets rotate the monster towards the base

			dx = targetX - this.x;
			dy = targetY - this.y;
			rotation = Math.atan2(dy, dx)* 180 / Math.PI;
			//var ax:Number =Math.cos(this.rotation)*speed;
			//var ay:Number =Math.sin(this.rotation)*speed;
			this.x += dx / 500*speed;
			this.y += dy / 500*speed;

			//this.y +=ay;
			//////trace(ax);
		}
		public function updateObservers(x1,y1,angle1,x2,y2,angle2:Number):void {
			targetX = x1;
			targetY = y1;
			targetAngle = angle2;
			target2X = x2;
			target2Y = y2;
			target2Angle = angle2;

		}
		public function alienHit(weapon:String) {

			if (weapon == "gun") {
				hitPoints--;
				////trace("hit points = "+hitPoints);
				this.stop();
				this.gotoAndPlay("impact_bullet_start");
				if (impactStartTimer.start()) {
				} else {
					impactStartTimer.start();
				}

			}
			
			if (weapon == "freezeGun") {
				this.gotoAndPlay("impact_freeze_start");
				impactFreezeStartTimer.start();
				//impactFreezeFinishTimer.start();
			}
			if (weapon == "plasmaGun") {
				hitPoints-=4;
				this.gotoAndPlay("impact_laser_start");
				impactStartTimer.start();
				//impactFinishTimer.start();
			}
			if (weapon == "missleGun") {
				hitPoints-=6;
				this.gotoAndPlay("impact_explosive_start");
				impactStartTimer.start();
				//impactFinishTimer.start();
			}
			if (weapon == "acidGun") {
				hitPoints-=2;
				this.gotoAndPlay("impact_acid_start");
				impactStartTimer.start();
				//impactFinishTimer.start();
			}
			if (weapon == "jack") {
				if (currentLabel ==  "walk_start") {
					this.gotoAndPlay("attack_start");
					////trace("at attack start");
				}

			}
			if (hitPoints <= 0) {
				////trace("alienhit called");
				removeEventListener(Event.ENTER_FRAME,moveAndAttack);
				impactStartTimer.removeEventListener(TimerEvent.TIMER,impactStart);
				impactFinishTimer.removeEventListener(TimerEvent.TIMER,impactFinish);
				MovieClip(parent).removeAlienShot(this);
				this.stop();
				//alienDeathSound.play();
				if (weapon == "gun") {
					this.gotoAndPlay("death_start");
					deleteAlien();
				}
				if (weapon == "plasmaGun") {
					this.stop();
					this.gotoAndPlay("death_start");
					deleteAlien();
				}
				if (weapon == "missleGun") {
					this.stop();
					this.gotoAndPlay("death_start");
					deleteAlien();
				}
				if (weapon == "acidGun") {
					this.stop();
					this.gotoAndPlay("death_start");
					deleteAlien();
				}
				//gotoAndPlay("explode");
			}
		}
		public function deleteAlien() {
			////trace("delete alien called");
			//removeEventListener(Event.ENTER_FRAME,moveAndAttack);
			impactStartTimer.removeEventListener(TimerEvent.TIMER,impactStart);
			impactFinishTimer.removeEventListener(TimerEvent.TIMER,impactFinish);
			////trace("The parent movieclip is "+MovieClip(parent));
			MovieClip(parent).removeAlien(this);
			//parent.removeChild(this);
		}
		public function impactStart(event:TimerEvent):void {
			//trace("EventListener removed of "+this.name);
			removeEventListener(Event.ENTER_FRAME, moveAndAttack);
			impactFinishTimer.start();

		}
		public function impactFreezeStart(event:TimerEvent):void {
			//trace("EventListener removed of "+this.name);
			removeEventListener(Event.ENTER_FRAME, moveAndAttack);
			impactFreezeFinishTimer.start();

		}
		public function impactFinish(event:TimerEvent):void {
			//trace("EventListener added of "+this.name);
			addEventListener(Event.ENTER_FRAME, moveAndAttack);
		}
		public function impactFreezeFinish(event:TimerEvent):void {
			////trace("EventListener added");
			addEventListener(Event.ENTER_FRAME, moveAndAttack);
			//this.stop();
			//this.gotoAndPlay("walk_start");
		}
		public function destroy():void {
			trace("destroy called");
			parent.removeChild(this);
		}
	}//end Alien
}//end package