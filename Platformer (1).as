package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import flash.display.DisplayObject;
	import Tile;
	import Ground;
	import Base;
	import Hero;
	import Arm;
	import Bullet;
	import Alien;
	import EzPoint;
	//import Mount;
	//import tempEnterGame;
	import Background_Ground;
	import iamezell;
	import NinjaGirllnk;
	import Howto2;
	import howto1;

	import UI;
	import fl.controls.Button;
	import StageComplete;
	import TraderJill;
	import upperRightWall;
	import topWall;
	import bottomWall;
	import replaceArmorIcon;
	//import repairBaseIcon;
	import plasmaGunIcon;
	import misslesIcon;
	import freezeRayIcon;
	import acidRoundIcon;
	import bulletIcon;
	import plasmaGunIcon;
	import lifeBar;
	import flash.net.SharedObject;
	import fl.controls.Label;
	import LukePerry;
	import JenGarner;
	import GrouchoMarks;
	import Toto;
	import Crosshairs;
	import flash.media.*;
	import transition;
	import Splash;
	import Gameover;
	import MissionComplete;
	import TitleScreen;
	import Continue;
	import Start;
	import Instructions;
	import Howtoplay;
	import fl.motion.Color;
	import flash.filters.GlowFilter;
	import MochiBot;
	import MochiAd;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	



	//import fl.controls.Button;
	//import fl.controls.TextArea;

	public class Platformer extends MovieClip implements ISubject {
		private var _tile:Tile;
		private var _ground:Ground;
		private var _base:Base;
		private var Jack:Hero;
		private var Jack2:Hero;
		private var tileArray:Array=new Array  ;
		private var speed:Number=5;
		private var moveRight:Boolean=false;
		private var moveLeft:Boolean=false;
		private var moveUp:Boolean=false;
		private var moveDown:Boolean=false;
		private var myArm:Arm;
		private var myBullet:Bullet;
		private var firing:Boolean=false;
		private var solidArray:Array=new Array  ;
		private var angle:Number;
		private var more:Boolean=false;
		private var theName:String="bolat";
		private var num:Number=0;
		var gameTimer:Timer=new Timer(30);
		private var vx:Number=0;
		private var vy:Number=0;
		private var force:Number=10;
		private var dx:Number=0;
		private var dy:Number=0;
		private var ax:Number=0;
		private var ay:Number=0;
		private var alienArray:Array=new Array  ;
		private var alienBossArray:Array=new Array  ;
		private var lineCordinatesArray:Array=new Array  ;
		private var alienz:Alien;
		private var alienz2:Alien;
		private var alienz3:Alien;
		private var alienz4:Alien;
		private var alienz5:Alien;
		private var alienz6:Alien;
		private var alienz7:Alien;
		private var alienz8:Alien;
		private var alienz9:Alien;
		private var alienz10:Alien;
		private var alienz11:Alien;
		private var alienz12:Alien;
		private var point:EzPoint;
		private var isPaused:Timer=new Timer(3000,1);
		private var isPaused2:Timer=new Timer(1000,1);
		private var isPaused3:Timer=new Timer(3000,1);
		private var alienAttackOne:Timer=new Timer(1000,1);
		private var alienAttackTwo:Timer=new Timer(1000,1);
		private var alienAttackThree:Timer=new Timer(1000,1);
		private var alienAttackFour:Timer=new Timer(1000,1);
		private var alienAttackFive:Timer=new Timer(1000,1);
		private var alienAttackSix:Timer=new Timer(1000,1);
		private var alienAttackSeven:Timer=new Timer(1000,1);
		private var alienAttackEight:Timer=new Timer(1000,1);
		private var alienAttackNine:Timer=new Timer(1000,1);
		private var alienAttackTen:Timer=new Timer(1000,1);
		private var alienAttackEleven:Timer=new Timer(1000,1);
		private var bossAttackOne:Timer=new Timer(1000,1);
		private var bossAttackTwo:Timer=new Timer(1000,1);
		private var bossAttackThree:Timer=new Timer(1000,1);
		private var bossAttackFour:Timer=new Timer(1000,1);
		private var bossAttackFive:Timer=new Timer(1000,1);
		private var bossAttackSix:Timer=new Timer(1000,1);
		private var jillPeaceTimer:Timer=new Timer(2000,1);
		private var deathTimer:Timer=new Timer(2000,1);

		//private var mount:Mount;
		private var bulletArray:Array=new Array  ;
		public var bossBulletArray:Array=new Array  ;
		private var splicedArray:Array;
		private var Observers:Array=new Array  ;
		private var introGraphic:introTempGraphic;
		private var gameState:String="Splash";
		private var tempEnterGraphic:tempEnterGame;
		private var ground:Ground;
		private var freezeButton:Button;
		private var plasmaButton:Button;
		private var acidButton:Button;
		private var gunButton:Button;
		private var missleButton:Button;
		private var loadButton:Button;
		private var nGameState:String="Ngame";
		private var ui:UI;
		private var attackBegun:Boolean=false;
		public var stageComplete:StageComplete;
		public var traderJill:TraderJill;
		public var plasmaBulletArray:Array=new Array  ;
		public var acidBulletArray:Array=new Array  ;
		public var freezeBulletArray:Array=new Array  ;
		public var missleBulletArray:Array=new Array  ;

		public var plasmaIcon:plasmaGunIcon;
		public var missleIcon:misslesIcon;
		public var freezeIcon:freezeRayIcon;
		public var acidIcon:acidRoundIcon;
		public var bulletIcons:bulletIcon;
		public var replaceIcon:replaceArmorIcon;
		public var myFormat:TextFormat=new TextFormat  ;
		public var myFormat2:TextFormat=new TextFormat  ;
		public var traderLabel:Label=new Label  ;
		public var ammoMissleLabel:Label=new Label  ;
		public var ammoPlasmaLabel:Label=new Label  ;
		public var ammoAcidLabel:Label=new Label  ;
		public var ammoBulletLabel:Label=new Label  ;
		public var ammoFreezeLabel:Label=new Label  ;
		public var ammoReplaceLabel:Label=new Label  ;
		public var cashLabel:Label=new Label  ;
		public var lifeLabel:Label=new Label  ;
		public var armorBar:lifeBar=new lifeBar  ;
		public var armorDescLabel:Label=new Label  ;
		public var so:SharedObject=SharedObject.getLocal("clientData");
		private var nextButton:Button=new Button  ;
		private var waveNumber:Number=2;
		private var lastAttack:Boolean=false;
		private var level:Number=1;
		private var greenBoss:LukePerry=new LukePerry  ;
		private var redBoss:JenGarner=new JenGarner  ;
		private var bigBlackBoss:GrouchoMarks=new GrouchoMarks  ;
		private var smallBoss:Toto=new Toto  ;
		private var smallBoss2:Toto=new Toto  ;
		private var bossFire:Timer=new Timer(2000,100);
		private var bossFire2:Timer=new Timer(2000,100);
		private var bossFire3:Timer=new Timer(2000,100);
		private var bossFire4:Timer=new Timer(2000,100);
		private var bossFire5:Timer=new Timer(2000,100);
		private var splashTimer:Timer=new Timer(4000,1);
		private var gameOverTimer:Timer=new Timer(4000,1);
		public var bossBullet:AlienBullet;
		public var bossBullet2:AlienBullet;
		public var bossBullet3:AlienBullet;
		private var mySound:Sound=new TestSound  ;
		private var ButtonSound:Sound=new buttonSound  ;
		private var spaceShipSound:Sound=new SpaceShipSound  ;
		private var laserSound:Sound=new LaserSound  ;
		private var missleSound:Sound=new MissleSound  ;
		private var startSound:Sound=new StartSound  ;
		private var sChannel:SoundChannel=startSound.play();
		private var gameOverSound:Sound=new GameOverSound  ;
		private var goChannel:SoundChannel=gameOverSound.play();
		private var getReady:Sound=new getReadySound  ;
		private var crosshairs:Crosshairs=new Crosshairs  ;
		private var cursor:Crosshairs;
		private var waveTrans:transition=new transition  ;
		public var startWaveAnim:Boolean=false;
		public var waveTransTimer:Timer=new Timer(3000,1);
		public var waveLabel:Label=new Label  ;
		public var cashUILabel:Label=new Label  ;
		public var cashDescLabel:Label=new Label  ;
		public var splash:Splash=new Splash  ;
		public var gameOver:Gameover=new Gameover  ;
		public var playingDeath:Boolean=false;
		public var identityPrinciple:Number=1;
		public var alienDeath:Timer=new Timer(2000,1);
		public var missionComplete=new MissionComplete  ;
		public var goToBegining:Timer=new Timer(13000,1);
		public var titleScreen=new TitleScreen  ;
		public var continueButton=new Continue  ;
		public var startButtonz=new Start  ;
		public var InstructctionButton=new Instructions  ;
		public var instructionsScreen=new Howtoplay  ;
		public var instButton:Button=new Button  ;
		public var instButton2:Button=new Button  ;
		public var instButton3:Button=new Button  ;
		public var hasBeenSaved:Boolean=false;
		private var q:Number=1;
		private var changeWeapon:Boolean=false;
		public var glowFilter:GlowFilter=new GlowFilter  ;
		public var glowFilter2:GlowFilter=new GlowFilter  ;
		public var isPlaying:Boolean=false;
		public var how2Pg1 = new howto1();
		public var how2Pg2 = new Howto2();
		public var ezellLink = new iamezell();
		public var chrisLink = new NinjaGirllnk();
	


		//so.flush();

		public function Platformer():void {
			//if (checkDomain()) {
			MochiBot.track(this,"73b15363");
			var _mochiads_game_id:String="0f61697c044aecff";

			sChannel.stop();
			goChannel.stop();
			addEventListener(Event.ENTER_FRAME,gameMain);
			myFormat.font="Arial";
			//myFormat.bold = true;
			myFormat.size=16;
			myFormat.color=0xFFFFFF;
			myFormat2.color=0xFFFFFF;
			//instButton.setStyle("textFormat",myFormat);
			traderLabel.setStyle("textFormat",myFormat);
			cashLabel.setStyle("textFormat",myFormat);
			ammoAcidLabel.setStyle("textFormat",myFormat);
			ammoMissleLabel.setStyle("textFormat",myFormat);
			ammoFreezeLabel.setStyle("textFormat",myFormat);
			ammoPlasmaLabel.setStyle("textFormat",myFormat);
			ammoReplaceLabel.setStyle("textFormat",myFormat);
			ammoBulletLabel.setStyle("textFormat",myFormat);
			lifeLabel.setStyle("textFormat",myFormat);
			cashUILabel.setStyle("textFormat",myFormat);
			cashDescLabel.setStyle("textFormat",myFormat);
			armorDescLabel.setStyle("textFormat",myFormat);
			replaceIcon=new replaceArmorIcon  ;
			missleIcon=new misslesIcon  ;
			freezeIcon=new freezeRayIcon  ;
			acidIcon=new acidRoundIcon  ;
			bulletIcons=new bulletIcon  ;
			plasmaIcon=new plasmaGunIcon  ;
			ground=new Ground  ;
			Jack=new Hero  ;
			myArm=new Arm  ;

			alienAttackOne.addEventListener(TimerEvent.TIMER,alienAttack1);
			alienAttackTwo.addEventListener(TimerEvent.TIMER,alienAttack2);
			alienAttackThree.addEventListener(TimerEvent.TIMER,alienAttack3);
			alienAttackFour.addEventListener(TimerEvent.TIMER,alienAttack4);
			alienAttackFive.addEventListener(TimerEvent.TIMER,alienAttack5);
			alienAttackSix.addEventListener(TimerEvent.TIMER,alienAttack6);
			alienAttackSeven.addEventListener(TimerEvent.TIMER,alienAttack7);
			alienAttackEight.addEventListener(TimerEvent.TIMER,alienAttack8);
			alienAttackNine.addEventListener(TimerEvent.TIMER,alienAttack9);
			alienAttackTen.addEventListener(TimerEvent.TIMER,alienAttack10);
			alienAttackEleven.addEventListener(TimerEvent.TIMER,alienAttack11);
			bossAttackOne.addEventListener(TimerEvent.TIMER,bossAttack1);
			bossAttackTwo.addEventListener(TimerEvent.TIMER,bossAttack2);
			bossAttackThree.addEventListener(TimerEvent.TIMER,bossAttack3);
			bossAttackFour.addEventListener(TimerEvent.TIMER,bossAttack4);
			bossAttackFive.addEventListener(TimerEvent.TIMER,bossAttack5);
			bossAttackSix.addEventListener(TimerEvent.TIMER,bossAttack6);
			waveTransTimer.addEventListener(TimerEvent.TIMER,transTime);
			jillPeaceTimer.addEventListener(TimerEvent.TIMER,jillPeace);
			deathTimer.addEventListener(TimerEvent.TIMER,deathTime);
			alienDeath.addEventListener(TimerEvent.TIMER,alienDeathTime);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
			//stage.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
			//alienAttackFour.addEventListener(TimerEvent.TIMER, alienAttack4);
			//gameTimer.addEventListener("timer",moveItNow);

			//addEventListener(KeyboardEvent.KEY_UP, upDate);


			//2023332


			bossFire.addEventListener(TimerEvent.TIMER,fireItUp);
			bossFire2.addEventListener(TimerEvent.TIMER,fireItUp2);
			bossFire3.addEventListener(TimerEvent.TIMER,fireItUp3);
			bossFire4.addEventListener(TimerEvent.TIMER,fireItUp4);
			bossFire5.addEventListener(TimerEvent.TIMER,fireItUp5);
			myFormat.font="Arial";
			myFormat.bold=true;
			myFormat.size=16;
			myFormat2.font="Arial";
			myFormat2.bold=true;
			myFormat2.size=22;
			splashTimer.addEventListener(TimerEvent.TIMER,splashIt);
			gameOverTimer.addEventListener(TimerEvent.TIMER,getOverIt);
			goToBegining.addEventListener(TimerEvent.TIMER,goToBegin);
			glowFilter.color=0xFF0000;
			glowFilter.blurX=7;
			glowFilter.blurY=7;
			glowFilter2.color=0x000000;
			glowFilter2.blurX=7;
			glowFilter2.blurY=7;
			if (! isPlaying) {
				sChannel=startSound.play();
				isPlaying=true;
			}
			//}else{
			//doNothing
			//}




		}//end constructor


		private function mouseMoveHandler(event:MouseEvent):void {
			//////trace("mouseMoveHandler");
			cursor.x=event.localX;
			cursor.y=event.localY;
			event.updateAfterEvent();
			//cursor.visible = true;
		}

		private function gameMain(event:Event):void {
			switch (gameState) {
				case "Splash" :
					////trace("in splash")
					splash.x=341;
					splash.y=242;

					addChild(splash);
					splashTimer.start();
					if (this.contains(missionComplete)) {
						removeChild(missionComplete);
					}
					gameState="Splash";
					break;
				case "Splash" :
					break;
				case "Instructions" :

					addChild(how2Pg1);
					addChild(ezellLink);
					addChild(chrisLink);
					chrisLink.x = 460;
					chrisLink.y = 48;
					ezellLink.x = 567;
					ezellLink.y = 48;

					instButton.label="Back";
					instButton.move(582,392);
					instButton.width = 60;
					instButton.addEventListener(MouseEvent.CLICK,goBack);
					instButton2.label="Next";
					instButton2.move(514,392);
					instButton2.width = 60;
					instButton2.addEventListener(MouseEvent.CLICK,how22);
					chrisLink.addEventListener(MouseEvent.CLICK,go2ChrisSite);
					ezellLink.addEventListener(MouseEvent.CLICK,go2EzellSite);
					addChild(instButton);
					addChild(instButton2);
					gameState="inst";
					break;
				case "inst" :

					break;
				case "how22SetUp" :
				trace("in how to setup");
				addChild(how2Pg2);
					addChild(ezellLink);
					addChild(chrisLink);
					chrisLink.x = 460;
					chrisLink.y = 48;
					ezellLink.x = 567;
					ezellLink.y = 48;

					instButton.label="Back";
					instButton.move(582,392);
					instButton.width = 60;
					instButton.addEventListener(MouseEvent.CLICK,goBack);
					instButton3.label="Next";
					instButton3.move(514,392);
					instButton3.width = 60;
					instButton3.addEventListener(MouseEvent.CLICK,goBack21);
					addChild(instButton);
					addChild(instButton3);
					gameState="how22";
				break;
				case "how22" :
				break;
				case "IntroSetup" :
					////////trace("in intro");
					if (this.contains(splash)) {
						removeChild(splash);
					}
					introGraphic=new introTempGraphic  ;
					introGraphic.x=194.8;
					introGraphic.y=202.1;
					//addChild(introGraphic);
					isPaused.addEventListener(TimerEvent.TIMER,pausing);
					isPaused.start();
					gameState="Intro";
					break;
				case "Intro" :
					break;
				case "SetupStartScreen" :
					if (this.contains(how2Pg1) && this.contains(instButton)) {
						removeChild(how2Pg1);
						removeChild(instButton);
					}
					if (this.contains(introGraphic)) {
						removeChild(introGraphic);

					}
					//stage.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
					//stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
					Mouse.show();
					myArm.dead=false;
					if (! isPlaying) {
						sChannel=startSound.play();
						isPlaying=true;
					}



					Jack.hitPoints=100;


					continueButton.y=230;
					startButtonz..y = 300;
					InstructctionButton.y=370;
					continueButton.addEventListener(MouseEvent.CLICK,load2Jill);
					startButtonz.addEventListener(MouseEvent.CLICK,goToNGame);
					InstructctionButton.addEventListener(MouseEvent.CLICK,goToInst);
					addChild(titleScreen);
					addChild(continueButton);
					addChild(startButtonz);
					addChild(InstructctionButton);


					gameState="StartScreen";
					break;
				case "StartScreen" :
					break;
				case "NgameSetup" :


					break;
				case "Ngame" :
				if(Jack.cash < 0){
					Jack.cash = 0;
					
				}
				cashLabel.htmlText="Credits: " + Jack.cash;
					////////trace("in Ngame");
					switch (nGameState) {

						case "WaveSetUp" :
							////////trace("in wave one");

							replaceIcon=new replaceArmorIcon  ;
							missleIcon=new misslesIcon  ;
							freezeIcon=new freezeRayIcon  ;
							acidIcon=new acidRoundIcon  ;
							bulletIcons=new bulletIcon  ;
							plasmaIcon=new plasmaGunIcon  ;
							ground=new Ground  ;
							ground.x=0;
							ground.y=-11;
							//ground.cachedAsBitmap = true;
							ui=new UI  ;
							ui.cachedAsBitmap=true;

							missleIcon.addEventListener(MouseEvent.CLICK,missle);
							freezeIcon.addEventListener(MouseEvent.CLICK,freeze);
							acidIcon.addEventListener(MouseEvent.CLICK,acid);
							plasmaIcon.addEventListener(MouseEvent.CLICK,plasma);
							bulletIcons.addEventListener(MouseEvent.CLICK,gun);
							missleIcon.width=33;
							missleIcon.height=33;
							missleIcon.x=577;
							missleIcon.y=175;
							ammoMissleLabel.move(577,220);
							ammoPlasmaLabel.move(617.9,220);
							ammoAcidLabel.move(658.5,220);
							ammoBulletLabel.move(497.9,220);
							ammoFreezeLabel.move(536.9,220);
							armorDescLabel.move(498,75);
							lifeLabel.move(498,93);
							cashDescLabel.move(599,93);
							cashUILabel.move(599,75);
							bulletIcons.width=33;
							bulletIcons.height=33;
							bulletIcons.x=497.9;
							bulletIcons.y=175;
							acidIcon.width=33;
							acidIcon.height=33;
							acidIcon.x=658.5;
							acidIcon.y=175;
							freezeIcon.width=33;
							freezeIcon.height=33;
							freezeIcon.x=536.9;
							freezeIcon.y=175;
							plasmaIcon.width=33;
							plasmaIcon.height=33;
							plasmaIcon.x=617.9;
							plasmaIcon.y=175;

							addChild(ground);
							addChild(ui);
							addChild(missleIcon);
							addChild(freezeIcon);
							addChild(acidIcon);
							addChild(bulletIcons);
							addChild(plasmaIcon);
							addChild(ammoMissleLabel);
							addChild(ammoAcidLabel);
							addChild(ammoPlasmaLabel);
							addChild(ammoBulletLabel);
							addChild(ammoFreezeLabel);
							addChild(lifeLabel);
							addChild(armorDescLabel);
							addChild(waveTrans);
							addChild(cashUILabel);
							addChild(cashDescLabel);
							playingDeath=false;
							identityPrinciple=1;
							waveTrans.x=700;
							waveTrans.y=0;
							waveLabel.setStyle("textFormat",myFormat2);
							waveLabel.height=28;
							var theNum:Number = waveNumber -1;
							waveLabel.text="Wave"+ theNum;
							waveLabel.move(53.8,227.1);
							startWaveAnim=true;
							nGameState="trans";
							ammoMissleLabel.htmlText="" + Jack.missleAmmo;
							ammoPlasmaLabel.htmlText="" + Jack.plasmaAmmo;
							ammoAcidLabel.htmlText="" + Jack.acidAmmo;
							ammoBulletLabel.htmlText="" + Jack.bulletAmmo;
							ammoFreezeLabel.htmlText="" + Jack.freezeAmmo;
							armorDescLabel.htmlText="Armor:";
							lifeLabel.htmlText="" + myArm.hitPoints + "%";
							cashUILabel.htmlText="Credits:";
							cashDescLabel.htmlText="" + Jack.cash;
							getReady.play();





							break;
						case "trans" :
							////trace("intrans");
							if (startWaveAnim=true) {
								////trace("its true");
								waveTrans.x-= 40;
							}
							if (waveTrans.x <= 0) {
								waveTrans.x=0;
								startWaveAnim=false;
								//put wave label up
								waveTransTimer.start();
								addChild(waveLabel);

							}
							break;
						case "WaveCont" :
							////trace("inWaveCont");

							addEventListener(Event.ENTER_FRAME,updateEveryOne);
							stage.focus=this;
							stage.addEventListener(MouseEvent.MOUSE_DOWN,fire);
							stage.addEventListener(KeyboardEvent.KEY_DOWN,reportKeyDown);
							stage.addEventListener(KeyboardEvent.KEY_UP,reportKeyUp);



							isPaused2.addEventListener(TimerEvent.TIMER,beginAttack);
							placeHero();
							myArm.gotoAndStop(1);

							isPaused2.start();
							Mouse.hide();
							cursor=new Crosshairs  ;
							addChild(cursor);
							nGameState="Wave";
							//addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);

							break;
						case "Wave" :
							//trace("alien array =" +alienArray.length+"attackBegun = "+attackBegun+"last attack ="+lastAttack);
							//check if jack is dead
							//check if wave is over
							////trace(alienArray.length);
							////trace(attackBegun);
							////trace(lastAttack);
							////trace("It is " +myArm.dead+ "that Jack is dead");

							if (alienArray.length == 0 && attackBegun == true && lastAttack == true) {
								//////trace("everyone dead");
								//nGameState = "WaveEndSetUp";
								alienDeath.start();

							}
							if (moveLeft == true) {

								Jack.x-= 5;

							}
							if (moveRight) {
								Jack.x+= 5;
								//Jack.walk();
							}
							if (moveUp) {
								Jack.y-= 5;
								//Jack.walk();
							}
							if (moveDown) {
								Jack.y+= 5;
								//Jack.walk();
							}
							cursor.x=mouseX;
							cursor.y=mouseY;

							myArm.x=Jack.x;
							myArm.y=Jack.y;
							var dx:Number=mouseX - myArm.x;
							var dy:Number=mouseY - myArm.y;
							myArm.rotation=Math.atan2(dy,dx) * 180 / Math.PI * identityPrinciple;
							checkForAlienToBulletHits();
							checkForAlienToHeroHits();
							checkCollision(Jack,_base);
							checkForAlienBulletToHeroHits();
							ammoMissleLabel.htmlText="" + Jack.missleAmmo;
							ammoPlasmaLabel.htmlText="" + Jack.plasmaAmmo;
							ammoAcidLabel.htmlText="" + Jack.acidAmmo;
							ammoBulletLabel.htmlText="" + Jack.bulletAmmo;
							ammoFreezeLabel.htmlText="" + Jack.freezeAmmo;
							armorDescLabel.htmlText="Armor:";
							lifeLabel.htmlText="" + myArm.hitPoints + "%";
							cashDescLabel.htmlText="" + Jack.cash;
							if (myArm.hitPoints == 0) {
								if (playingDeath == false) {
									myArm.gotoAndPlay("death_start");
									//trace("death start");
									playingDeath=true;
									identityPrinciple=0;
									//kill the event listeners
									stage.removeEventListener(MouseEvent.MOUSE_DOWN,fire);
									stage.removeEventListener(KeyboardEvent.KEY_DOWN,reportKeyDown);
									stage.removeEventListener(KeyboardEvent.KEY_UP,reportKeyUp);
									removeEventListener(Event.ENTER_FRAME,updateEveryOne);
									moveUp=false;
									moveDown=false;
									moveRight=false;
									moveLeft=false;
								}
								//nGameState = "Game0verSetup";
							}
							if (myArm.currentLabel == "death_end") {
								//trace("death end");
								deathTimer.start();
							}

							break;
						case "WaveEndSetUp" :
							//clean up
							////trace( "in waveendsetUp");
							Jack.deleteHero();

							if (myArm.dead == false) {
								myArm.deleteHero();
							}
							//if any aliens left remove them
							//alienArray.length
							//the hero died and there is more aliens left
							if (alienArray.length > 0 && myArm.dead == true) {
								////////trace("alien array length is "+alienArray.length);
								for (var alienNum:int=alienArray.length - 1; alienNum >= 0; alienNum--) {

									//removeChild(alienArray[0]);
									alienArray[alienNum].deleteAlien();



								}//endfor

							} else if (alienArray.length > 0) {
								for (var num1:Number=0; num1 < 2; num1++) {
									////////trace("alien array length is "+alienArray.length);
									//removeChild(alienArray[0]);
									alienArray[0].deleteAlien();

									////////trace("alien array length is NOW "+alienArray.length);

								}
							}//endfor
							//removeChild(alienArray[0]);
							//removeChild(alienArray[1]);

							if (waveNumber == 7) {
								bossFire4.removeEventListener(TimerEvent.TIMER,fireItUp4);
							}
							if (waveNumber == 13) {
								bossFire3.removeEventListener(TimerEvent.TIMER,fireItUp3);
							}
							if (waveNumber == 19) {
								bossFire2.removeEventListener(TimerEvent.TIMER,fireItUp2);
							}
							if (waveNumber == 25) {
								bossFire5.removeEventListener(TimerEvent.TIMER,fireItUp5);
							}
							if (waveNumber == 31) {
								bossFire5.removeEventListener(TimerEvent.TIMER,fireItUp5);
							}
							if (waveNumber == 32) {
								bossFire2.removeEventListener(TimerEvent.TIMER,fireItUp2);
							}
							if (waveNumber == 33) {
								bossFire3.removeEventListener(TimerEvent.TIMER,fireItUp3);
							}
							if (waveNumber == 34) {
								bossFire4.removeEventListener(TimerEvent.TIMER,fireItUp4);
							}



							removeChild(ui);
							removeChild(ground);
							removeChild(cursor);
							removeChild(cashUILabel);
							removeChild(cashDescLabel);
							missleIcon.removeEventListener(MouseEvent.CLICK,missle);
							freezeIcon.removeEventListener(MouseEvent.CLICK,freeze);
							acidIcon.removeEventListener(MouseEvent.CLICK,acid);
							plasmaIcon.removeEventListener(MouseEvent.CLICK,plasma);
							bulletIcons.removeEventListener(MouseEvent.CLICK,gun);
							stage.removeEventListener(MouseEvent.MOUSE_DOWN,fire);
							stage.removeEventListener(KeyboardEvent.KEY_DOWN,reportKeyDown);
							stage.removeEventListener(KeyboardEvent.KEY_UP,reportKeyUp);
							isPaused2.removeEventListener(TimerEvent.TIMER,beginAttack);
							removeChild(missleIcon);
							removeChild(freezeIcon);
							removeChild(acidIcon);
							removeChild(bulletIcons);
							removeChild(plasmaIcon);
							removeChild(ammoMissleLabel);
							removeChild(ammoAcidLabel);
							removeChild(ammoPlasmaLabel);
							removeChild(ammoBulletLabel);
							removeChild(ammoFreezeLabel);
							removeChild(lifeLabel);
							removeChild(armorDescLabel);
							//removeChild(cashUILabel);
							//removeChild(cashDescLabel);
							nGameState="WaveEnd";
							if (waveNumber == 34) {
								nGameState="endScene";

							}
							break;
						case "WaveEnd" :
							Mouse.show();
							stageComplete=new StageComplete  ;
							traderJill=new TraderJill  ;
							nextButton.enabled=true;
							isPaused3.addEventListener(TimerEvent.TIMER,goTOJill);
							isPaused3.start();
							//stageComplete.x = 0.4;
							//stageComplete.y = -3.5;
							addChild(stageComplete);

							nGameState="Jill";


							////////trace("//////trace in wave one");
							break;

						case "Jill" :
							break;
						case "endScene" :
							nextButton.enabled=true;
							addChild(missionComplete);
							missionComplete.play();
							spaceShipSound.play();
							goToBegining.start();
							nGameState="ENDIT";
							break;
						case "ENDIT" :
							break;
						case "Game0verSetup" :
							gameOverSound.play();
							if (alienArray.length > 0 && myArm.dead == true) {
								////////trace("alien array length is "+alienArray.length);
								for (var alienNum1:int=alienArray.length - 1; alienNum1 >= 0; alienNum1--) {

									//removeChild(alienArray[0]);
									alienArray[alienNum1].deleteAlien();
									////trace("killing alien?");
									////////trace("alien array length is NOW "+alienArray.length);

								}//endfor

							} else if (alienArray.length > 0) {
								for (var num2:Number=0; num2 < 2; num1++) {
									////////trace("alien array length is "+alienArray.length);
									//removeChild(alienArray[0]);
									alienArray[0].deleteAlien();

									////////trace("alien array length is NOW "+alienArray.length);

								}
							}
							////trace(waveNumber);
							if (waveNumber == 7) {
								bossFire4.removeEventListener(TimerEvent.TIMER,fireItUp4);
							}
							if (waveNumber == 13) {
								bossFire3.removeEventListener(TimerEvent.TIMER,fireItUp3);
							}
							if (waveNumber == 19) {
								bossFire2.removeEventListener(TimerEvent.TIMER,fireItUp2);
							}
							if (waveNumber == 25) {
								bossFire5.removeEventListener(TimerEvent.TIMER,fireItUp5);
							}
							if (waveNumber == 31) {
								bossFire5.removeEventListener(TimerEvent.TIMER,fireItUp5);
							}
							if (waveNumber == 32) {
								bossFire2.removeEventListener(TimerEvent.TIMER,fireItUp2);
							}
							if (waveNumber == 33) {
								bossFire3.removeEventListener(TimerEvent.TIMER,fireItUp3);
							}
							if (waveNumber == 34) {
								bossFire4.removeEventListener(TimerEvent.TIMER,fireItUp4);
							}
							removeChild(cashUILabel);
							removeChild(cashDescLabel);
							removeChild(missleIcon);
							removeChild(freezeIcon);
							removeChild(acidIcon);
							removeChild(bulletIcons);
							removeChild(plasmaIcon);
							removeChild(ammoMissleLabel);
							removeChild(ammoAcidLabel);
							removeChild(ammoPlasmaLabel);
							removeChild(ammoBulletLabel);
							removeChild(ammoFreezeLabel);
							removeChild(lifeLabel);
							removeChild(armorDescLabel);
							removeChild(ui);
							removeChild(ground);
							removeChild(cursor);
							//removeChild(cursor);
							//kill the alienBosses
							missleIcon.removeEventListener(MouseEvent.CLICK,missle);
							freezeIcon.removeEventListener(MouseEvent.CLICK,freeze);
							acidIcon.removeEventListener(MouseEvent.CLICK,acid);
							plasmaIcon.removeEventListener(MouseEvent.CLICK,plasma);
							bulletIcons.removeEventListener(MouseEvent.CLICK,gun);
							//stage.removeEventListener(MouseEvent.MOUSE_DOWN,fire);
							//stage.removeEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
							//stage.removeEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
							isPaused2.removeEventListener(TimerEvent.TIMER,beginAttack);
							gameOver.x=339;
							gameOver.y=240;
							addChild(gameOver);
							nGameState="GameOver";
							gameOverTimer.start();
							break;
						case "GameOver" :
							break;
					}//end switch
					break;


			}//end switch

		}//end function
		public function pausing(event:TimerEvent):void {
			//////////trace("pausing");
			//graphics.clear();
			gameState="SetupStartScreen";
		}
		public function beginAttack(event:TimerEvent) {
			//trace("beginAttackcalled");
			attackBegun=true;
			alienWave();



		}

		private function placeHero() {

			Jack.x=98;
			Jack.y=410;
			addChild(Jack);
			myArm.x=98;
			myArm.y=240;
			addChild(myArm);

			////////trace("Jack added");
			var realHeight:Number=Jack.height - 1;
			var realWidth:Number=Jack.width - 1;
			var topside:Number=Jack.height - 1 - Jack.y;
			var bottomside:Number=Jack.y + realHeight;
			var rightSide:Number=Jack.x + 17;
			var leftSide:Number=Jack.x - realWidth;
			//////////trace(Jack.width);

		}//end place fighter

		private function reportKeyDown(event:KeyboardEvent):void {
			if (event.keyCode == 37 || event.keyCode == 65) {
				moveLeft=true;

			} else if (event.keyCode == 39 || event.keyCode == 68) {


				moveRight=true;
			} else if (event.keyCode == 38 || event.keyCode == 87) {

				moveUp=true;
			} else if (event.keyCode == 40 || event.keyCode == 83) {

				moveDown=true;
			}
			if (event.keyCode == 49 || event.keyCode == 97) {
				
				Jack.weapon="gun";
			}
			if (event.keyCode == 50 || event.keyCode == 98) {
				Jack.weapon="freezeGun";
			}
			if (event.keyCode == 51 || event.keyCode == 99) {
				Jack.weapon="missleGun";
			}
			if (event.keyCode == 52 || event.keyCode == 100) {
				Jack.weapon="plasmaGun";
			}
			if (event.keyCode == 53 || event.keyCode == 101) {
				Jack.weapon="acidGun";
			}
			if (event.keyCode == 32 && changeWeapon == false) {
				trace("change Weapon is " + changeWeapon + " should be true Next");


				trace("Its the Next time and change weapon is " + changeWeapon);
				trace("key is down-");

				trace(q);
				q++;
				if (q == 1) {
					Jack.weapon="gun";
					bulletIcons.filters=[glowFilter];
				} else if (q == 2) {
					bulletIcons.filters=[glowFilter2];
					freezeIcon.filters=[glowFilter];
					Jack.weapon="freezeGun";
				} else if (q == 3) {
					freezeIcon.filters=[glowFilter2];
					missleIcon.filters=[glowFilter];
					Jack.weapon="missleGun";
				} else if (q == 4) {
					missleIcon.filters=[glowFilter2];
					plasmaIcon.filters=[glowFilter];
					Jack.weapon="plasmaGun";
				} else if (q == 5) {
					plasmaIcon.filters=[glowFilter2];
					acidIcon.filters=[glowFilter];
					Jack.weapon="acidGun";
				} else if (q > 5) {
					q=1;
					Jack.weapon="gun";
					acidIcon.filters=[glowFilter2];
					bulletIcons.filters=[glowFilter];
				}
				changeWeapon=true;
				trace("Its the Next time and change weapon is " + changeWeapon);
				trace("key is down-");
				/*replaceIcon = new replaceArmorIcon();
				missleIcon = new misslesIcon();
				freezeIcon = new freezeRayIcon();
				acidIcon = new acidRoundIcon();
				bulletIcons = new bulletIcon();
				plasmaIcon = new plasmaGunIcon();
				*/
			}
		}


		public function reportKeyUp(event:KeyboardEvent) {
			////////trace("keyup");
			if (event.keyCode == 37 || event.keyCode == 65) {
				moveLeft=false;
				Jack.stop();
			} else if (event.keyCode == 39 || event.keyCode == 68) {
				moveRight=false;
				Jack.stop();
			} else if (event.keyCode == 38 || event.keyCode == 87) {
				moveUp=false;
				Jack.stop();
			} else if (event.keyCode == 40 || event.keyCode == 83) {//115
				moveDown=false;
				Jack.stop();
			}
			if (event.keyCode == 32) {
				trace("key is up");
				changeWeapon=false;
			}
		}
		private function checkCollision(hero:Hero,base:Base):void {
			//////////trace("checking touching");
			var fps:Number=4;
			var futurePlace:Number=hero.x + 4;
			var futurePlaceZ:Number=hero.x + 12;
			var futurePlaceY:Number=hero.y - 12;
			var futurePlaceX:Number=hero.y - 4;
			var theWidth:Number=16;
			//loop through the all the tiles and see fi any are touching

			if (moveRight) {
				if (hero.x >= 470) {
					////////trace("Hero.x = "+hero.x+" and gound tile's x ="+solidArray[i].x);
					hero.x=470;
				}
			}
			if (moveLeft) {
				if (hero.x <= 10) {
					////////trace("Hero.x = "+hero.x+" and gound tile's x ="+solidArray[i].x);
					hero.x=10;
				}
			}
			if (moveUp) {
				if (hero.y <= 10) {
					////////trace("Hero.x = "+hero.x+" and gound tile's x ="+solidArray[i].x);
					hero.y=10;
				}
			}
			if (moveDown) {
				if (hero.y >= 470) {
					////////trace("Hero.x = "+hero.x+" and gound tile's x ="+solidArray[i].x);
					hero.y=470;
				}
			}



		}//end function


		public function fire(event:MouseEvent) {
			//graphics.clear();

			if (Jack.weapon == "gun" && Jack.bulletAmmo == 0) {
				
			} else if (Jack.weapon == "gun") {
				myBullet=new Bullet(myArm.x,myArm.y,myArm.rotation,300);
				myBullet.gotoAndStop(1);
				addChild(myBullet);
				bulletArray.push(myBullet);
				Jack.bulletAmmo-= 1;
				mySound.play();

			}
			if (Jack.weapon == "acidGun" && Jack.acidAmmo == 0) {

				////////trace("no more Bullets");

			} else if (Jack.weapon == "acidGun" && Jack.acidAmmo > 0) {
				myBullet=new Bullet(myArm.x,myArm.y,myArm.rotation,300);
				myBullet.gotoAndStop(3);
				addChild(myBullet);
				bulletArray.push(myBullet);

				Jack.acidAmmo-= 1;
				mySound.play();
			}
			if (Jack.weapon == "missleGun" && Jack.missleAmmo == 0) {
				////////trace("no more Bullets");

			} else if (Jack.weapon == "missleGun" && Jack.missleAmmo > 0) {
				myBullet=new Bullet(myArm.x,myArm.y,myArm.rotation,300);
				myBullet.gotoAndStop(5);
				addChild(myBullet);
				bulletArray.push(myBullet);
				Jack.missleAmmo-= 1;
				missleSound.play();
			}
			if (Jack.weapon == "plasmaGun" && Jack.plasmaAmmo == 0) {
				////////trace("no more Bullets");

			} else if (Jack.weapon == "plasmaGun" && Jack.plasmaAmmo > 0) {
				myBullet=new Bullet(myArm.x,myArm.y,myArm.rotation,300);
				myBullet.gotoAndStop(2);
				addChild(myBullet);
				bulletArray.push(myBullet);
				Jack.plasmaAmmo-= 1;
				laserSound.play();
			}
			if (Jack.weapon == "freezeGun" && Jack.freezeAmmo == 0) {
				////////trace("no more Bullets");

			} else if (Jack.weapon == "freezeGun" && Jack.freezeAmmo > 0) {
				myBullet=new Bullet(myArm.x,myArm.y,myArm.rotation,300);
				myBullet.gotoAndStop(4);
				addChild(myBullet);
				bulletArray.push(myBullet);
				Jack.freezeAmmo-= 1;
				mySound.play();
			}
			//now lets put it in an array to be processed for collision detection

			//graphics.moveTo(myArm.x, myArm.y);
			//plotLine();
			////////trace(vy);
			//////////trace(Math.sin(bulletArray[num].rotation) * force);
		}

		public function alienWave():void {
			//trace("calling alien attack One");
			alienAttackOne.start();



			//}//end for
		}
		public function plotLine():Array {
			graphics.lineStyle(1);
			var m:Number=Jack.y - mouseY / Jack.x - mouseX;
			// now lets find the y intercept as in y = mx+b
			var b:Number=Jack.y - Jack.x * m;

			//lets take all the pixels
			for (var i:Number=1; i < 10; i++) {

				if (alienz.hitTestPoint(Jack.x + ax * i,Jack.y + ay * i,true)) {
					////////trace("got a line hit");
					graphics.lineTo(Jack.x + ax * i,Jack.y + ay * i);
					removeChild(alienz);
					alienz=null;
				} else {
					graphics.lineTo(Jack.x + ax * i,Jack.y + ay * i);
				}
				isPaused.start();

				//////////trace(myArm.rotation);

			}//end outer for

			// find all tghe points on the line
			// first loop through the width and height of the stage
			//////////trace(lineCordinatesArray);
			return lineCordinatesArray;
		}//end function

		// take a bullet from the array
		public function removeBullet(bullet:Bullet) {
			for (var i in bulletArray) {
				if (bulletArray[i] == bullet) {
					bulletArray.splice(i,1);
					break;
				}
			}
		}
		public function removeAlien(al:Alien) {

			for (var i in alienArray) {
				if (alienArray[i] == al) {
					alienArray[i].destroy();
					////////trace("removing alien  named "+ alienArray[i].name);
					alienArray.splice(i,1);

					break;
				}
			}
		}
		public function removeAlienShot(al:Alien) {

			for (var i in alienArray) {
				if (alienArray[i] == al) {
					//alienArray[i].destroy();
					////////trace("removing alien  named "+ alienArray[i].name);
					alienArray.splice(i,1);
					Jack.cash+= 50;

					break;
				}
			}
		}
		// check for collisions
		public function checkForAlienToBulletHits() {
			for (var bulletNum:int=bulletArray.length - 1; bulletNum >= 0; bulletNum--) {
				for (var alienNum:int=alienArray.length - 1; alienNum >= 0; alienNum--) {
					if (bulletArray[bulletNum].hitTestObject(alienArray[alienNum])) {
						alienArray[alienNum].alienHit(Jack.weapon);
						bulletArray[bulletNum].deleteBullet();

						////////trace("gota hit");
						//shotsHit++;
						//showGameScore();
						break;
					}
				}
			}
		}
		public function checkForAlienToHeroHits() {
			for (var alienNum:int=alienArray.length - 1; alienNum >= 0; alienNum--) {
				if (myArm.hitTestObject(alienArray[alienNum])) {
					var jack:String="jack";
					//Jack.alienHit();
					//check to see if jack is not all ready dead
					if (myArm.dead == false) {
						myArm.hit();
						alienArray[alienNum].alienHit(jack);
					}
					////////trace(myArm.hitPoints);


					//shotsHit++;
					//showGameScore();
					//break;
				}
			}
		}
		public function checkForAlienBulletToHeroHits() {
			for (var alienNum:int=bossBulletArray.length - 1; alienNum >= 0; alienNum--) {
				if (myArm.hitTestObject(bossBulletArray[alienNum])) {
					////trace("Bullet hit em");
					var jack:String="jack";
					//Jack.alienHit();
					if (bossBulletArray[alienNum].hitState == false) {
						myArm.hit();

						////////trace(myArm.hitPoints);


						//shotsHit++;
						//showGameScore();
						//break;
						bossBulletArray[alienNum].hitState=true;
					}
				}
			}
		}
		public function registerObserver(o:IObserver):void {
			//let sput the observers in a nice place
			Observers.push(o);

		}
		public function removeObserver(o:IObserver):void {
			for (var i in Observers) {
				if (Observers[i] == o) {
					Observers.splice(i,1);
					break;
				}
			}
		}
		public function notifyObserver():void {
			for (var i:Number=0; i < Observers.length; i++) {
				Observers[i].updateObservers(Jack.x,Jack.y,Jack.rotation,10,10,10);

			}
		}
		public function updateEveryOne(event:Event):void {
			notifyObserver();
		}
		public function sayHI() {
			////////trace("hi my broathieresdfsfsdfshfkjfh");
		}
		public function goToNGame(event:MouseEvent) {
			////////trace("clicked");
			removeChild(titleScreen);
			removeChild(continueButton);
			removeChild(startButtonz);
			removeChild(InstructctionButton);

			//we need to zero out stuff from previous adventures
			attackBegun=false;
			lastAttack=false;
			myArm.hitPoints=100;
			myArm.dead=false;
			gameState="Ngame";
			nGameState="WaveSetUp";
			waveNumber=2;
			if (! isPlaying) {
				sChannel=startSound.play();
				isPlaying=true;
			}

		}
		public function missle(event:MouseEvent):void {
			Jack.weapon="missleGun";

		}
		public function freeze(event:MouseEvent):void {
			Jack.weapon="freezeGun";
		}
		public function acid(event:MouseEvent):void {
			Jack.weapon="acidGun";
			////////trace("acid clicked");
		}
		public function plasma(event:MouseEvent):void {
			Jack.weapon="plasmaGun";

		}
		public function gun(event:MouseEvent):void {
			Jack.weapon="gun";
		}
		public function goTOJill(event:TimerEvent):void {
			////////trace("going to Jill");
			replaceIcon=new replaceArmorIcon  ;
			missleIcon=new misslesIcon  ;
			freezeIcon=new freezeRayIcon  ;
			acidIcon=new acidRoundIcon  ;
			bulletIcons=new bulletIcon  ;
			plasmaIcon=new plasmaGunIcon  ;
			ammoAcidLabel.move(469.7,120);
			ammoMissleLabel.move(606.0,120);
			ammoFreezeLabel.move(538.0,120);
			ammoPlasmaLabel.move(469.9,223);
			ammoReplaceLabel.move(606.0,223);
			ammoBulletLabel.move(538.0,223);
			nextButton.move(525.3,431.3);
			nextButton.label="Next";
			cashLabel.htmlText="Credits: " + Jack.cash;
			cashLabel.width=150;
			nextButton.addEventListener(MouseEvent.CLICK,nextWave);
			replaceIcon.addEventListener(MouseEvent.MOUSE_OVER,replaceArmorDesc);
			missleIcon.addEventListener(MouseEvent.MOUSE_OVER,missleDesc);
			freezeIcon.addEventListener(MouseEvent.MOUSE_OVER,freezeDesc);
			acidIcon.addEventListener(MouseEvent.MOUSE_OVER,acidDesc);
			bulletIcons.addEventListener(MouseEvent.MOUSE_OVER,bulletDesc);
			plasmaIcon.addEventListener(MouseEvent.MOUSE_OVER,plasmaDesc);
			replaceIcon.addEventListener(MouseEvent.CLICK,replaceArmor);
			missleIcon.addEventListener(MouseEvent.CLICK,buyMissle);
			freezeIcon.addEventListener(MouseEvent.CLICK,buyFreeze);
			acidIcon.addEventListener(MouseEvent.CLICK,buyAcid);
			bulletIcons.addEventListener(MouseEvent.CLICK,buyBullet);
			plasmaIcon.addEventListener(MouseEvent.CLICK,buyPlasma);
			//misslesIcon.addEventListener();
			//freezeRayIcon.addEventListener()
			//acidRoundIcon..addEventListener()
			//bulletIcons.addEventListener()
			//plasmaIcon.addEventListener()
			removeChild(stageComplete);
			cashLabel.move(474,384);
			traderLabel.move(472.2,260.3);
			//cashLabel.htmlText = ""+Jack.cash;
			traderLabel.htmlText="Click an item to purchase";

			ammoAcidLabel.htmlText="" + Jack.acidAmmo;
			ammoMissleLabel.htmlText="" + Jack.missleAmmo;
			ammoFreezeLabel.htmlText="" + Jack.freezeAmmo;
			ammoPlasmaLabel.htmlText="" + Jack.plasmaAmmo;
			ammoBulletLabel.htmlText="" + Jack.bulletAmmo;
			ammoReplaceLabel.htmlText="" + myArm.hitPoints + "%";
			traderLabel.width=195;
			traderLabel.height=200;
			traderLabel.wordWrap=true;

			acidIcon.x=469.7;
			acidIcon.y=47.0;
			freezeIcon.x=538.0;
			freezeIcon.y=47.0;
			missleIcon.x=606.0;
			missleIcon.y=47.0;
			plasmaIcon.x=469.9;
			plasmaIcon.y=150.0;
			bulletIcons.x=538.0;
			bulletIcons.y=150.0;
			replaceIcon.x=606.0;
			replaceIcon.y=150.0;

			addChild(traderJill);
			addChild(missleIcon);
			addChild(freezeIcon);
			addChild(acidIcon);
			addChild(bulletIcons);
			addChild(plasmaIcon);
			addChild(replaceIcon);
			addChild(traderLabel);
			addChild(cashLabel);
			addChild(ammoAcidLabel);
			addChild(ammoFreezeLabel);
			addChild(ammoPlasmaLabel);
			addChild(ammoReplaceLabel);
			addChild(ammoMissleLabel);
			addChild(ammoBulletLabel);
			addChild(nextButton);
			nGameState="Jill";


		}
		public function replaceArmorDesc(event:MouseEvent) {
			traderLabel.htmlText="Click for materials to Repair Your Armor.";
		}
		public function missleDesc(event:MouseEvent) {
			traderLabel.htmlText="Click to purchase 20 Missile Shells for 300 Credits.";
		}
		public function freezeDesc(event:MouseEvent) {
			traderLabel.htmlText="Click to purchase 20 Freeze Pellets for 50 Credits.";
		}
		public function acidDesc(event:MouseEvent) {
			traderLabel.htmlText="Click to purchase 20 Acid Capsules for 70 Credits.";
		}
		public function bulletDesc(event:MouseEvent) {
			traderLabel.htmlText="Click to purchase 20 Armor Piercing Rounds for 10 Credits.";
		}
		public function plasmaDesc(event:MouseEvent) {
			traderLabel.htmlText="Click to purchase 20 Plasma Beam Charges for 70 Credits.";
		}
		public function replaceArmor(event:MouseEvent) {
			ButtonSound.play();
			cashLabel.htmlText="Credits: " + Jack.cash;
			if (Jack.cash >= 50) {
				//Jack.cash -= 50;
				if (myArm.hitPoints >= 100) {
					myArm.hitPoints=100;
					traderLabel.htmlText="You are at maximum integrity";
					ammoReplaceLabel.htmlText="" + myArm.hitPoints + "%";

				} else if (myArm.hitPoints + 10 < 100) {
					Jack.cash-= 125;
					myArm.hitPoints+= 10;

					ammoReplaceLabel.htmlText="" + myArm.hitPoints + "%";
				} else if (myArm.hitPoints >= 90 && myArm.hitPoints < 100) {
					myArm.hitPoints=100;
				}
			} else if (Jack.cash < 50) {
				traderLabel.htmlText="You do not have enough money to purchase this item";
			}
		}
		public function buyMissle(event:MouseEvent) {
			ButtonSound.play();

			if (Jack.cash >= 300) {
				Jack.cash-= 300;
				traderLabel.htmlText="You have purchased 20 units";
				Jack.missleAmmo+= 20;
				ammoMissleLabel.htmlText="" + Jack.missleAmmo;
				cashLabel.htmlText="Credits: " + Jack.cash;
			} else {
				traderLabel.htmlText="You do not have enough money to purchase this item";

			}
		}
		public function buyFreeze(event:MouseEvent) {
			ButtonSound.play();
			if (Jack.cash >= 50) {
				Jack.cash-= 50;
				Jack.freezeAmmo+= 20;
				ammoFreezeLabel.htmlText="" + Jack.freezeAmmo;
				traderLabel.htmlText="You have purchased 20 units";
				cashLabel.htmlText="Credits: " + Jack.cash;
			} else {
				traderLabel.htmlText="You do not have enough money to purchase this item";
			}
		}
		public function buyAcid(event:MouseEvent) {
			ButtonSound.play();
			if (Jack.cash >= 50) {
				Jack.cash-= 70;
				Jack.acidAmmo+= 20;
				////////trace(Jack.acidAmmo);
				ammoAcidLabel.htmlText="" + Jack.acidAmmo;
				traderLabel.htmlText="You have purchased 20 units";
				cashLabel.htmlText="Credits: " + Jack.cash;
			} else {
				traderLabel.htmlText="You do not have enough money to purchase this item";
			}
		}
		public function buyBullet(event:MouseEvent) {
			ButtonSound.play();
			if (Jack.cash >= 10) {
				Jack.cash-= 10;
				Jack.bulletAmmo+= 20;
				ammoBulletLabel.htmlText="" + Jack.bulletAmmo;
				traderLabel.htmlText="You have purchased 20 units";
				cashLabel.htmlText="Credits: " + Jack.cash;
			} else {
				traderLabel.htmlText="You do not have enough money to purchase this item";
			}
		}
		public function buyPlasma(event:MouseEvent) {
			ButtonSound.play();
			if (Jack.cash >= 50) {
				Jack.plasmaAmmo+= 20;
				Jack.cash-= 70;
				ammoPlasmaLabel.htmlText="" + Jack.plasmaAmmo;
				traderLabel.htmlText="You have purchased 20 units";
				cashLabel.htmlText="Credits: " + Jack.cash;
			} else {
				traderLabel.htmlText="You do not have enough money to purchase this item";
			}
		}
		public function nextWave(event:MouseEvent):void {
			ButtonSound.play();
			//traderJill.stop();
			//trace("trying to get jill to so the damn thing");
			traderJill.gotoAndPlay(36);
			nextButton.enabled=false;
			jillPeaceTimer.start();

			//remove all things not nice
			/*removeChild(traderJill);
			removeChild(missleIcon);
			removeChild(freezeIcon);
			removeChild(acidIcon);
			removeChild(bulletIcons);
			removeChild(plasmaIcon);
			removeChild(replaceIcon);
			removeChild(traderLabel);
			removeChild(cashLabel);
			removeChild(ammoAcidLabel);
			removeChild(ammoFreezeLabel);
			removeChild(ammoPlasmaLabel);
			removeChild(ammoReplaceLabel);
			removeChild(ammoMissleLabel);
			removeChild(ammoBulletLabel);
			removeChild(nextButton);
			so.data.waveNumber = waveNumber;
			so.data.cash = Jack.cash;
			so.data.missleAmmo = Jack.missleAmmo;
			so.data.freezeAmmo = Jack.freezeAmmo;
			so.data.acidAmmo = Jack.acidAmmo;
			so.data.bulletAmmo = Jack.bulletAmmo;
			so.data.plasmaAmmo = Jack.plasmaAmmo;
			so.data.armor = myArm.hitPoints;
			so.flush();
			waveNumber++;
			////trace("The wave number is"+waveNumber);
			lastAttack = false;
			attackBegun = false;
			moveUp = false;
			moveDown = false;
			moveRight = false;
			moveLeft = false;
			nGameState= "WaveSetUp";
			*/

		}
		public function alienAttack1(event:TimerEvent) {
			switch (waveNumber) {
				case 2 :
					//trace("alien one called, the game state is "+nGameState);
					if (nGameState == "Wave") {

						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 3 :

					if (nGameState == "Wave") {
						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 4 :
					if (nGameState == "Wave") {
						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 7 :
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {

						attackBegun=true;
						lastAttack=true;
						addChild(greenBoss);
						alienArray.push(greenBoss);
						alienArray[alienArray.indexOf(greenBoss)].setUp();
						bossFire4.start();
					}
					break;
				case 8 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 9 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 10 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 13 :
					//Boss
					//bossAttackOne.start();
					attackBegun=true;
					lastAttack=true;
					addChild(redBoss);
					alienArray.push(redBoss);
					alienArray[alienArray.indexOf(redBoss)].setUp();
					bossFire3.start();
					break;
				case 14 :
					if (nGameState == "Wave") {
						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 15 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz=new GreenAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz=new RedAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 19 :
					//Boss
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {
						attackBegun=true;
						lastAttack=true;
						addChild(smallBoss);
						alienArray.push(smallBoss);
						alienArray[alienArray.indexOf(smallBoss)].setUp();
						bossFire2.start();

					}
					break;
				case 20 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 21 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 25 :
					//Boss
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {
						attackBegun=true;
						lastAttack=true;
						addChild(bigBlackBoss);
						alienArray.push(bigBlackBoss);
						alienArray[alienArray.indexOf(bigBlackBoss)].setUp();
						bossFire5.start();
					}
					break;
				case 26 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 27 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz=new SlasherAlien  ;
						alienz.name="Charlie";
						addChild(alienz);
						alienArray.push(alienz);
						alienArray[alienArray.indexOf(alienz)].setUp();
						alienAttackTwo.start();

					}
					break;
				case 31 :
					//Boss
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {
						bigBlackBoss=new GrouchoMarks  ;
						attackBegun=true;
						lastAttack=true;
						addChild(bigBlackBoss);
						alienArray.push(bigBlackBoss);
						alienArray[alienArray.indexOf(bigBlackBoss)].setUp();
						bossFire5.start();
					}
					break;
				case 32 :
					//Boss
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {
						smallBoss=new Toto  ;
						attackBegun=true;
						lastAttack=true;
						addChild(smallBoss);
						alienArray.push(smallBoss);
						alienArray[alienArray.indexOf(smallBoss)].setUp();
						bossFire2.start();

					}
					break;
				case 33 :
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {
						redBoss=new JenGarner  ;
						attackBegun=true;
						lastAttack=true;
						addChild(redBoss);
						alienArray.push(redBoss);
						alienArray[alienArray.indexOf(redBoss)].setUp();
						bossFire3.start();
					}
					break;
				case 34 :
					//Boss
					//bossAttackOne.start();
					if (nGameState == "Wave") {
						greenBoss=new LukePerry  ;
						attackBegun=true;
						lastAttack=true;
						addChild(greenBoss);
						alienArray.push(greenBoss);
						alienArray[alienArray.indexOf(greenBoss)].setUp();
						bossFire4.start();
					}
					break;

			}//end switch

		}
		public function alienAttack2(event:TimerEvent) {
			switch (waveNumber) {
				case 2 :
					//trace("alien 2 called");
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 3 :
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 4 :
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 8 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 9 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 10 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 14 :
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 15 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz2=new GreenAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 20 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 21 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 26 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;

				case 27 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz2=new SlasherAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz2=new RedAlien  ;
						alienz2.name="Charlie";
						alienz2.x=rand(460,490);
						addChild(alienz2);
						alienArray.push(alienz2);
						alienArray[alienArray.indexOf(alienz2)].setUp();
						alienAttackThree.start();
					}
					break;
			}//end switch

		}
		public function alienAttack3(event:TimerEvent) {
			switch (waveNumber) {
				case 2 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=600;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						lastAttack=true;
					}
					break;
				case 3 :
					if (nGameState == "Wave") {
						alienz3=new GreenAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 4 :
					if (nGameState == "Wave") {
						alienz3=new GreenAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz3=new GreenAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz3=new GreenAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 8 :
					alienz3=new SlasherAlien  ;
					alienz3.name="Mr Pink";
					alienz3.x=450;
					alienz3.y=0;
					addChild(alienz3);
					alienArray.push(alienz3);
					alienArray[alienArray.indexOf(alienz3)].setUp();
					lastAttack=true;
					break;
				case 9 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 10 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 14 :
					alienz3=new RedAlien  ;
					alienz3.name="Mr Pink";
					alienz3.x=450;
					alienz3.y=0;
					addChild(alienz3);
					alienArray.push(alienz3);
					alienArray[alienArray.indexOf(alienz3)].setUp();
					lastAttack=true;
					break;
				case 15 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz3=new GreenAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz3=new RedAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 20 :
					alienz3=new ToughAlien  ;
					alienz3.name="Mr Pink";
					alienz3.x=450;
					alienz3.y=0;
					addChild(alienz3);
					alienArray.push(alienz3);
					alienArray[alienArray.indexOf(alienz3)].setUp();
					lastAttack=true;
					break;
				case 21 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 26 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						lastAttack=true;
					}
					break;
				case 27 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz3=new SlasherAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz3=new GreenAlien  ;
						alienz3.name="Mr Pink";
						alienz3.x=450;
						alienz3.y=0;
						addChild(alienz3);
						alienArray.push(alienz3);
						alienArray[alienArray.indexOf(alienz3)].setUp();
						alienAttackFour.start();
					}
					break;
			}//end switch


		}
		public function alienAttack4(event:TimerEvent) {
			switch (waveNumber) {
				case 3 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 4 :
					if (nGameState == "Wave") {
						alienz4=new GreenAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz4=new GreenAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz4=new GreenAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 9 :
					if (nGameState == "Wave") {

						alienz4=new SlasherAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();

					}
					break;
				case 10 :
					if (nGameState == "Wave") {
						alienz4=new RedAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz4=new RedAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz4=new RedAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 15 :
					if (nGameState == "Wave") {
						alienz4=new GreenAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz4=new GreenAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz4=new RedAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;

				case 18 :
					if (nGameState == "Wave") {
						alienz4=new RedAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 21 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 27 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz4=new ToughAlien  ;
						alienz4.name="Mr Green";
						alienz4.x=0;
						alienz4.y=200;
						addChild(alienz4);
						alienArray.push(alienz4);
						alienArray[alienArray.indexOf(alienz4)].setUp();
						alienAttackFive.start();
					}
					break;

			}


		}
		public function alienAttack5(event:TimerEvent) {
			switch (waveNumber) {
				case 3 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						lastAttack=true;
					}
					break;
				case 4 :
					if (nGameState == "Wave") {
						alienz5=new SlasherAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz5=new GreenAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz5=new GreenAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 9 :
					if (nGameState == "Wave") {
						alienz5=new SlasherAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						lastAttack=true;
					}
					break;
				case 10 :
					if (nGameState == "Wave") {
						alienz5=new SlasherAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz5=new RedAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz5=new RedAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 15 :
					if (nGameState == "Wave") {
						alienz5=new GreenAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						lastAttack=true;
					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz5=new RedAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz5=new RedAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz5=new RedAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 21 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						lastAttack=true;
					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 27 :
					alienz5=new ToughAlien  ;
					alienz5.name="Mr Yellow";
					alienz5.x=0;
					alienz5.y=rand(0,280);
					addChild(alienz5);
					alienArray.push(alienz5);
					alienArray[alienArray.indexOf(alienz5)].setUp();
					lastAttack=true;
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz5=new ToughAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz5=new FlyerAlien  ;
						alienz5.name="Mr Yellow";
						alienz5.x=0;
						alienz5.y=rand(0,280);
						addChild(alienz5);
						alienArray.push(alienz5);
						alienArray[alienArray.indexOf(alienz5)].setUp();
						alienAttackSix.start();
					}
					break;
			}


		}
		public function alienAttack6(event:TimerEvent) {
			switch (waveNumber) {
				case 4 :
					if (nGameState == "Wave") {
						alienz6=new SlasherAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz6=new SlasherAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz6=new GreenAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;

				case 10 :
					if (nGameState == "Wave") {
						alienz6=new SlasherAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz6=new SlasherAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz6=new RedAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz6=new RedAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz6=new GreenAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz6=new RedAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz6=new FlyerAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz6=new FlyerAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz6=new FlyerAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz6=new FlyerAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz6=new FlyerAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz6=new FlyerAlien  ;
						alienz6.name="Mr Blue";
						alienz6.x=rand(460,490);
						alienz6.y=0;
						addChild(alienz6);
						alienArray.push(alienz6);
						alienArray[alienArray.indexOf(alienz6)].setUp();
						alienAttackSeven.start();
					}
					break;

			}



		}
		public function alienAttack7(event:TimerEvent) {
			switch (waveNumber) {
				case 4 :
					if (nGameState == "Wave") {
						alienz7=new SlasherAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						lastAttack=true;
					}
					break;
				case 5 :
					if (nGameState == "Wave") {
						alienz7=new SlasherAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz7=new SlasherAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 10 :
					if (nGameState == "Wave") {
						alienz7=new SlasherAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						lastAttack=true;
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz7=new SlasherAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz7=new SlasherAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 16 :
					if (nGameState == "Wave") {
						alienz7=new RedAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						lastAttack=true;
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz7=new GreenAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz7=new GreenAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 22 :
					if (nGameState == "Wave") {
						alienz7=new FlyerAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						lastAttack=true;
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz7=new FlyerAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz7=new FlyerAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 28 :
					if (nGameState == "Wave") {
						alienz7=new FlyerAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						lastAttack=true;
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz7=new FlyerAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz7=new FlyerAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz7=new RedAlien  ;
						alienz7.name="Mr Blue";
						alienz7.x=rand(460,490);
						alienz7.y=0;
						addChild(alienz7);
						alienArray.push(alienz7);
						alienArray[alienArray.indexOf(alienz7)].setUp();
						alienAttackEight.start();
					}
					break;
			}


		}
		public function alienAttack8(event:TimerEvent) {
			switch (waveNumber) {
				case 5 :
					if (nGameState == "Wave") {
						alienz8=new SlasherAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz8=new SlasherAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz8=new SlasherAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz8=new SlasherAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz8=new GreenAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz8=new GreenAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz8=new FlyerAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz8=new FlyerAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 29 :
					if (nGameState == "Wave") {
						alienz8=new FlyerAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz8=new FlyerAlien  ;
						alienz8.name="Mr Violet";
						alienz8.x=rand(460,490);
						alienz8.y=0;
						addChild(alienz8);
						alienArray.push(alienz8);
						alienArray[alienArray.indexOf(alienz8)].setUp();
						alienAttackNine.start();
					}
					break;
			}



		}
		public function alienAttack9(event:TimerEvent) {
			switch (waveNumber) {
				case 5 :
					if (nGameState == "Wave") {
						alienz9=new SlasherAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						lastAttack=true;
					}
					break;
				case 6 :
					if (nGameState == "Wave") {
						alienz9=new SlasherAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=350;
						alienz9.y=0;
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						alienAttackTen.start();
					}
					break;
				case 11 :
					if (nGameState == "Wave") {
						alienz9=new SlasherAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						lastAttack=true;
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						alienz9=new SlasherAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						alienAttackTen.start();
					}
					break;
				case 17 :
					if (nGameState == "Wave") {
						alienz9=new GreenAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						lastAttack=true;
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz9=new GreenAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=350;
						alienz9.y=0;
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						alienAttackTen.start();
					}
					break;
				case 23 :
					if (nGameState == "Wave") {
						alienz9=new FlyerAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						lastAttack=true;
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz9=new FlyerAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						alienAttackTen.start();
					}
					break;

				case 29 :
					if (nGameState == "Wave") {
						alienz9=new FlyerAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						lastAttack=true;
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz9=new ToughAlien  ;
						alienz9.name="Mr Violet";
						alienz9.x=0;
						alienz9.y=rand(0,500);
						addChild(alienz9);
						alienArray.push(alienz9);
						alienArray[alienArray.indexOf(alienz9)].setUp();
						alienAttackTen.start();
					}
					break;



			}


		}
		public function alienAttack10(event:TimerEvent) {
			switch (waveNumber) {
				case 6 :
					if (nGameState == "Wave") {
						alienz10=new SlasherAlien  ;
						alienz10.name="Mr Violet";
						alienz10.x=rand(0,500);
						alienz10.y=0;
						addChild(alienz10);
						alienArray.push(alienz10);
						alienArray[alienArray.indexOf(alienz10)].setUp();
						alienAttackEleven.start();
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						//trace("alien number 10 called");
						alienz10=new SlasherAlien  ;
						alienz10.name="Mr Violet";
						alienz10.x=rand(0,500);
						alienz10.y=0;
						addChild(alienz10);
						alienArray.push(alienz10);
						alienArray[alienArray.indexOf(alienz10)].setUp();
						alienAttackEleven.start();
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz10=new GreenAlien  ;
						alienz10.name="Mr Violet";
						alienz10.x=rand(0,500);
						alienz10.y=0;
						addChild(alienz10);
						alienArray.push(alienz10);
						alienArray[alienArray.indexOf(alienz10)].setUp();
						alienAttackEleven.start();
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz10=new ToughAlien  ;
						alienz10.name="Mr Violet";
						alienz10.x=rand(0,500);
						alienz10.y=0;
						addChild(alienz10);
						alienArray.push(alienz10);
						alienArray[alienArray.indexOf(alienz10)].setUp();
						alienAttackEleven.start();
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz10=new GreenAlien  ;
						alienz10.name="Mr Violet";
						alienz10.x=rand(0,500);
						alienz10.y=0;
						addChild(alienz10);
						alienArray.push(alienz10);
						alienArray[alienArray.indexOf(alienz10)].setUp();
						alienAttackEleven.start();
					}
					break;


			}



		}
		public function alienAttack11(event:TimerEvent) {
			switch (waveNumber) {
				case 6 :
					if (nGameState == "Wave") {
						alienz11=new SlasherAlien  ;
						alienz11.name="Mr Violet";
						alienz11.x=rand(0,500);
						alienz11.y=0;
						addChild(alienz11);
						alienArray.push(alienz11);
						alienArray[alienArray.indexOf(alienz11)].setUp();
						lastAttack=true;
					}
					break;
				case 12 :
					if (nGameState == "Wave") {
						//trace("alien number 11 called");
						alienz11=new SlasherAlien  ;
						alienz11.name="Mr Violet";
						alienz11.x=rand(0,500);
						alienz11.y=0;
						addChild(alienz11);
						alienArray.push(alienz11);
						alienArray[alienArray.indexOf(alienz11)].setUp();
						lastAttack=true;
					}
					break;
				case 18 :
					if (nGameState == "Wave") {
						alienz11=new GreenAlien  ;
						alienz11.name="Mr Violet";
						alienz11.x=rand(0,500);
						alienz11.y=0;
						addChild(alienz11);
						alienArray.push(alienz11);
						alienArray[alienArray.indexOf(alienz11)].setUp();
						lastAttack=true;
					}
					break;
				case 24 :
					if (nGameState == "Wave") {
						alienz11=new ToughAlien  ;
						alienz11.name="Mr Violet";
						alienz11.x=rand(0,500);
						alienz11.y=0;
						addChild(alienz11);
						alienArray.push(alienz11);
						alienArray[alienArray.indexOf(alienz11)].setUp();
						lastAttack=true;
					}
					break;
				case 30 :
					if (nGameState == "Wave") {
						alienz11=new GreenAlien  ;
						alienz11.name="Mr Violet";
						alienz11.x=rand(0,500);
						alienz11.y=0;
						addChild(alienz11);
						alienArray.push(alienz11);
						alienArray[alienArray.indexOf(alienz11)].setUp();
						lastAttack=true;
					}
					break;
			}
		}
		public function bossAttack1(event:TimerEvent) {
			switch (waveNumber) {
				case 7 :
					//boss stuff here
					lastAttack=true;
					break;


			}
		}
		public function bossAttack2(event:TimerEvent) {
			switch (waveNumber) {
				case 13 :
					//boss stuff here
					lastAttack=true;
					break;


			}
		}
		public function bossAttack3(event:TimerEvent) {
			switch (waveNumber) {
				case 19 :
					//boss stuff here
					lastAttack=true;
					break;


			}
		}
		public function bossAttack4(event:TimerEvent) {
			switch (waveNumber) {
				case 25 :
					//boss stuff here
					lastAttack=true;
					break;


			}
		}
		public function bossAttack5(event:TimerEvent) {
			switch (waveNumber) {
				case 31 :
					//boss stuff here
					lastAttack=true;
					break;


			}
		}
		public function bossAttack6(event:TimerEvent) {
			switch (waveNumber) {
				case 7 :
					//boss stuff here
					lastAttack=true;
					break;


			}
		}
		public function fireItUp(event:Event):void {
			bossBullet=new AlienBullet(smallBoss.x,smallBoss.y,smallBoss.rotation,300);
			bossBullet2=new AlienBullet(smallBoss.x,smallBoss.y,smallBoss.rotation + 30,300);
			bossBullet3=new AlienBullet(smallBoss.x,smallBoss.y,smallBoss.rotation - 30,300);
			addChild(bossBullet);
			addChild(bossBullet2);
			addChild(bossBullet3);
			bossBulletArray.push(bossBullet);
			bossBulletArray.push(bossBullet2);
			bossBulletArray.push(bossBullet3);
			//MovieClip(parent).bossBulletArray.push(myBullet);

		}
		public function fireItUp2(event:Event):void {
			bossBullet=new AlienBullet(smallBoss.x,smallBoss.y,smallBoss.rotation,300);
			bossBullet2=new AlienBullet(smallBoss.x,smallBoss.y,smallBoss.rotation + 30,300);
			bossBullet3=new AlienBullet(smallBoss.x,smallBoss.y,smallBoss.rotation - 30,300);
			addChild(bossBullet);
			addChild(bossBullet2);
			addChild(bossBullet3);
			bossBulletArray.push(bossBullet);
			bossBulletArray.push(bossBullet2);
			bossBulletArray.push(bossBullet3);
			//MovieClip(parent).bossBulletArray.push(myBullet);

		}
		public function fireItUp3(event:Event):void {
			bossBullet=new AlienBullet(redBoss.x,redBoss.y,redBoss.rotation,300);
			bossBullet2=new AlienBullet(redBoss.x,redBoss.y,redBoss.rotation + 30,300);
			bossBullet3=new AlienBullet(redBoss.x,redBoss.y,redBoss.rotation - 30,300);
			addChild(bossBullet);
			addChild(bossBullet2);
			addChild(bossBullet3);
			bossBulletArray.push(bossBullet);
			bossBulletArray.push(bossBullet2);
			bossBulletArray.push(bossBullet3);
			//MovieClip(parent).bossBulletArray.push(myBullet);

		}
		public function fireItUp4(event:Event):void {
			bossBullet=new AlienBullet(greenBoss.x,greenBoss.y,greenBoss.rotation,300);
			bossBullet2=new AlienBullet(greenBoss.x,greenBoss.y,greenBoss.rotation + 30,300);
			bossBullet3=new AlienBullet(greenBoss.x,greenBoss.y,greenBoss.rotation - 30,300);
			addChild(bossBullet);
			addChild(bossBullet2);
			addChild(bossBullet3);
			bossBulletArray.push(bossBullet);
			bossBulletArray.push(bossBullet2);
			bossBulletArray.push(bossBullet3);
			//MovieClip(parent).bossBulletArray.push(myBullet);

		}
		public function fireItUp5(event:Event):void {
			bossBullet=new AlienBullet(bigBlackBoss.x,bigBlackBoss.y,bigBlackBoss.rotation,300);
			bossBullet2=new AlienBullet(bigBlackBoss.x,bigBlackBoss.y,bigBlackBoss.rotation + 30,300);
			bossBullet3=new AlienBullet(bigBlackBoss.x,bigBlackBoss.y,bigBlackBoss.rotation - 30,300);
			addChild(bossBullet);
			addChild(bossBullet2);
			addChild(bossBullet3);
			bossBulletArray.push(bossBullet);
			bossBulletArray.push(bossBullet2);
			bossBulletArray.push(bossBullet3);
			//MovieClip(parent).bossBulletArray.push(myBullet);

		}
		public function load2Jill(event:MouseEvent):void {
			ButtonSound.play();
			hasBeenSaved=so.data.hasBeenSaved;
			if (! hasBeenSaved) {
				//gameState = "IntroSetup";

			} else {
				removeChild(titleScreen);
				removeChild(continueButton);
				removeChild(startButtonz);
				removeChild(InstructctionButton);
				//load the data from the shared Object
				waveNumber=so.data.waveNumber;
				////trace("waveNumber = "+ waveNumber);
				Jack.cash=so.data.cash;
				Jack.missleAmmo=so.data.missleAmmo;
				Jack.freezeAmmo=so.data.freezeAmmo;
				Jack.acidAmmo=so.data.acidAmmo;
				Jack.bulletAmmo=so.data.bulletAmmo;
				Jack.plasmaAmmo=so.data.plasmaAmmo;
				myArm.hitPoints=so.data.armor;
				nGameState="WaveEnd";
				gameState="Ngame";
				hasBeenSaved=true;
				//startSound.pause();
			}


		}
		public function rand(min:Number,max:Number):Number {
			var randomNum:Number=Math.floor(Math.random() * max - min + 1) + min;
			return randomNum;
		}
		public function transTime(event:TimerEvent) {
			removeChild(waveTrans);
			removeChild(waveLabel);
			nGameState="WaveCont";
		}
		public function splashIt(event:TimerEvent):void {
			gameState="IntroSetup";
		}
		public function getOverIt(event:TimerEvent):void {


			removeChild(gameOver);
			gameState="IntroSetup";
		}
		public function jillPeace(event:TimerEvent):void {
			removeChild(traderJill);
			removeChild(missleIcon);
			removeChild(freezeIcon);
			removeChild(acidIcon);
			removeChild(bulletIcons);
			removeChild(plasmaIcon);
			removeChild(replaceIcon);
			removeChild(traderLabel);
			removeChild(cashLabel);
			removeChild(ammoAcidLabel);
			removeChild(ammoFreezeLabel);
			removeChild(ammoPlasmaLabel);
			removeChild(ammoReplaceLabel);
			removeChild(ammoMissleLabel);
			removeChild(ammoBulletLabel);
			removeChild(nextButton);
			so.data.waveNumber=waveNumber;
			so.data.cash=Jack.cash;
			so.data.missleAmmo=Jack.missleAmmo;
			so.data.freezeAmmo=Jack.freezeAmmo;
			so.data.acidAmmo=Jack.acidAmmo;
			so.data.bulletAmmo=Jack.bulletAmmo;
			so.data.plasmaAmmo=Jack.plasmaAmmo;
			so.data.armor=myArm.hitPoints;
			so.data.hasBeenSaved=true;
			so.flush();
			waveNumber++;
			////trace("The wave number is"+waveNumber);
			lastAttack=false;
			attackBegun=false;
			moveUp=false;
			moveDown=false;
			moveRight=false;
			moveLeft=false;
			nGameState="WaveSetUp";


		}
		public function deathTime(event:TimerEvent):void {
			nGameState="Game0verSetup";

		}
		public function alienDeathTime(event:TimerEvent):void {
			nGameState="WaveEndSetUp";
		}
		public function goToBegin(event:TimerEvent):void {
			//trace("goto Begin called");
			gameState="Splash";
		}
		public function goToInst(event:MouseEvent) {
			removeChild(titleScreen);
					removeChild(continueButton);
					removeChild(startButtonz);
					removeChild(InstructctionButton);
			gameState="Instructions";
		}
		public function goBack(event:MouseEvent) {
			if (this.contains(how2Pg2)) {
						removeChild(how2Pg2);
						removeChild(ezellLink);
						removeChild(chrisLink);
						removeChild(instButton);
						removeChild(instButton3);
						trace("How2page was here");
					}
			ButtonSound.play();
			gameState="SetupStartScreen";
		}
		public function goBack21(event:MouseEvent) {
			removeChild(how2Pg2);
			removeChild(ezellLink);
			removeChild(chrisLink);
			removeChild(instButton);
			removeChild(instButton3);
			ButtonSound.play();
			gameState="Instructions";
		}
		public function how22(event:MouseEvent) {
			ButtonSound.play();
			removeChild(how2Pg1);
			removeChild(ezellLink);
			removeChild(chrisLink);
			removeChild(instButton);
			removeChild(instButton2);
			trace("should go to next page");
			gameState="how22SetUp";
		}
		public function go2ChrisSite(event:MouseEvent) {
			var url:String = "http://www.ninjagirlproductions.com/";
					var request:URLRequest = new URLRequest(url);
					//request.data = variables;
					try {
						navigateToURL(request,"_blank");
						//URLUtil.openWindow("http://www.google.com");
					} catch (e:Error) {
						// handle error here
						
					}
		}
		public function go2EzellSite(event:MouseEvent) {
			var url:String = "http://www.iamezell.com/";
					var request:URLRequest = new URLRequest(url);
					//request.data = variables;
					try {
						navigateToURL(request,"_blank");
						//URLUtil.openWindow("http://www.google.com");
					} catch (e:Error) {
						// handle error here
						
					}
		}
		/*public function callFlyer(event:TimerEvent):void{
		alienzA = new FlyerAlienKam();
		alienzA.name = "Mr Violet";
		alienzA.x = 0;
		alienzA.y = rand(0,500);
		addChild(alienzA);
		alienArray.push(alienzA);
		alienArray[alienArray.indexOf(alienzA)].setUp();
		}*/
		private function checkDomain():Boolean {
			var url:String=stage.loaderInfo.url;
			var urlStart:Number=url.indexOf("://") + 3;
			var urlEnd:Number=url.indexOf("/",urlStart);
			var domain:String=url.substring(urlStart,urlEnd);
			var LastDot:Number=domain.lastIndexOf(".") - 1;
			var domEnd:Number=domain.lastIndexOf(".",LastDot) + 1;
			domain=domain.substring(domEnd,domain.length);
			if (domain != "flashgamelicense.com") {

				return false;
			} else {
				return true;
			}
		}
	}//end class
}//end package