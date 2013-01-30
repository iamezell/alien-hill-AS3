package{
	import adobe.utils.CustomActions;
	import com.greensock.TweenLite;
	import com.yahoo.astra.fl.managers.AlertManager;
	import fl.data.DataProvider;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.ui.Mouse;
	import flash.filters.DropShadowFilter;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.net.Responder;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.net.navigateToURL;
	import flash.net.URLVariables;
	import flash.net.NetConnection;
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import flash.events.ProgressEvent;
	import nl.demonsters.debugger.MonsterDebugger;
	import Users;
	import fl.containers.UILoader;
	import SpotEvent;
	import LoadingTemp;
	import SWFAddress;
	import SWFAddressEvent;
	
	
	//import tweening libraries
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	//import library items
	import newLogo1;
	//welcome message
	import welcomemes;
	//import the main menu
	import main_menu;
	//the sign in form
	import SignInControl;
	//sign in button
	import signInBtn;
	//import the sign in control
	import SignUpControl;
	//sign up button
	import SignUpBtn;
	//import resistration control
	import RegisterAsControl;
	//import the uploader registration bronze silver and gold controls
	//bronze first
	import BronzeMemRegControl;
	//silver
	import RegAsSilverUpCont;
	//gold
	import GoldPackageUPControl;
	//the search compnent for looking for something to do.
	import FstdControl;
	
	//import the bonze uploader control pannel
	import BRNZUploadPanel;
	//import the bottom menu for the profile areas
	import BottomMenu;
	//looking for something to do page control
	//import LfstdPageControl;
	import AnimBack;
	import GalNext;
	import GalLast;
	import CurrentGalNum;
	
	
	
	
	public class SpotMain extends MovieClip {
		//the user class
		public var user:Users = new Users();
		//monster debugger class
		public var debugger:MonsterDebugger = new MonsterDebugger(this);
		public var imageFile:FileReference = new FileReference();
		private var uploadURL:URLRequest;
		public var imageTypes:FileFilter = new FileFilter("Images (*.jpg, *.jpeg, *.gif, *.png)", "*.jpg; *.jpeg; *.gif; *.png");
		//the site state
		public var siteState:String;
		//the logo graphic
		public var myLogo:newLogo1 = new newLogo1();
		//welcome message
		public var welcome:welcomemes = new welcomemes();
		//the backgrounds for the content of the start page
		public var mainMenu:main_menu = new main_menu();
		//drop shadow filter
		public var dropShadow:DropShadowFilter = new DropShadowFilter();
		//to hold filter info
		public var filtersArray:Array;
		//sign in button
		public var signIn:signInBtn = new signInBtn();
		//sign up button
		public var signUp:SignUpBtn = new SignUpBtn();
		//sign in control
		public var signInCont:SignInControl = new SignInControl();
		//sign up control
		public var signUpCont:SignUpControl = new SignUpControl();
		//boolean stating weather mainmenu is on stage
		public var mainUp:Boolean;
		//registration control
		public var regCont:RegisterAsControl  = new RegisterAsControl();
		//bronze registration for uploader control
		public var bronzeUpRegCont:BronzeMemRegControl = new BronzeMemRegControl();
		//silver
		public var silverUpRegCont:RegAsSilverUpCont = new RegAsSilverUpCont();
		//gold
		public var goldUpRegCont:GoldPackageUPControl = new GoldPackageUPControl();
		////////////////////////////////////////////////////////////////////////////
		//the bronze uploader control pannel
		public var bronzeUploaderPan:BRNZUploadPanel = new BRNZUploadPanel();
		//bottom menu think this should go in the general profie area
		public var bottomMenu:BottomMenu = new BottomMenu();
		//dataprovider for state combo boxes
		public var stateDP:DataProvider = new DataProvider();
		public var hourComboDP:DataProvider = new DataProvider();
		public var ampmComboDP:DataProvider = new DataProvider();
		//dataprovider for event types
		public var eventTypeDP:DataProvider = new DataProvider();
		public var lookingSearchControl:FstdControl = new FstdControl();
		public var lfstdPage:Number = 1;
		public var uil:UILoader;
		//we need an array to hold all of the events
		public var eventsArray:Array = new Array();
		public var spotEvent:SpotEvent;
		public var uilArray:Array = new Array();
		public var counter:Number = 0;
		public var nextTweenCounter:Number = 0;
		public var nextActionCounter:Number = 0;
		public var galNextBtn:GalNext = new GalNext();
		public var galLastBtn:GalLast = new GalLast();
		public var galDoneBtn:GalDoneBtn = new GalDoneBtn();
		public var lastPage:Boolean = false;
		
		
		
		
		
		
		//ok this area will be for sending info to and from amfphp
		public var gs:NetConnection = new NetConnection();
		public var gs2:NetConnection = new NetConnection();
		public var gs3:NetConnection = new NetConnection();
		public var gs4:NetConnection = new NetConnection();
		public var gs5:NetConnection = new NetConnection();
		//for getting user info when user login
		public var gs6:NetConnection = new NetConnection();
		public var gs7:NetConnection = new NetConnection();
		
		//for information comming back
		public var res:Responder = new Responder(onResult, onFault);
		public var res2:Responder = new Responder(onResult2, onFault2);
		public var res3:Responder = new Responder(onResult3, onFault3);
		public var res4:Responder = new Responder(onResult4, onFault4);
		public var res5:Responder = new Responder(onResult5, onFault5);
		public var res6:Responder = new Responder(onResult6, onFault6);
		public var res7:Responder = new Responder(onResult7, onFault7);
		
		public var loading:LoadingTemp = new LoadingTemp();
		public var animBack:AnimBack = new AnimBack();
		public var galNum:CurrentGalNum = new CurrentGalNum();
		public var cityString:String;
		public var stateString:String;
		public var typeString:String;
		
		
		
		
		
		public function SpotMain():void {
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		//initate all of the members///////////////////////////////////////////////////
		public function init(event:Event):void {
			///data/////////////////////////////////
			stateDP.addItem( { label:"Alabama", data:"Alabama" } );
			stateDP.addItem( { label:"Alaska", data:"Alaska" } );
			stateDP.addItem( { label:"Arizona", data:"Arizona" } );
			stateDP.addItem( { label:"Arkansas", data:"Arkansas" } );
			stateDP.addItem( { label:"California", data:"California" } );
			stateDP.addItem( { label:"Colorado", data:"Colorado" } );
			stateDP.addItem( { label:"Connecticut", data:"Connecticut" } );
			stateDP.addItem( { label:"Delaware", data:"Delaware" } );
			stateDP.addItem( { label:"District of Columbia", data:"District of Columbia" } );
			stateDP.addItem( { label:"Florida", data:"Florida" } );
			stateDP.addItem( { label:"Georgia", data:"Georgia" } );
			stateDP.addItem( { label:"Hawaii", data:"Hawaii" } );
			stateDP.addItem( { label:"Idaho", data:"Idaho" } );
			stateDP.addItem( { label:"Iowa", data:"Iowa" } );
			stateDP.addItem( { label:"Indiana", data:"Indiana" } );
			stateDP.addItem( { label:"Kentucky", data:"Kentucky" } );
			stateDP.addItem( { label:"Louisiana", data:"Louisiana" } );
			stateDP.addItem( { label:"Maine", data:"Maine" } );
			stateDP.addItem( { label:"Maryland", data:"Maryland" } );
			stateDP.addItem( { label:"Massachusetts", data:"Massachusetts" } );
			stateDP.addItem( { label:"Michigan", data:"Michigan" } );
			stateDP.addItem( { label:"Minnesota", data:"Minnesota" } );
			stateDP.addItem( { label:"Mississippi", data:"Mississippi" } );
			stateDP.addItem( { label:"Missouri", data:"Missouri" } );
			stateDP.addItem( { label:"Montana", data:"Montana" } );
			stateDP.addItem( { label:"Nebraska", data:"Nebraska" } );
			stateDP.addItem( { label:"Nevada", data:"Nevada" } );
			stateDP.addItem( { label:"New Hampshire", data:"New Hampshire" } );
			stateDP.addItem( { label:"New Jersey", data:"New Jersey" } );
			stateDP.addItem( { label:"New York", data:"New York" } );
			stateDP.addItem( { label:"North Carolina", data:"North Carolina" } );
			stateDP.addItem( { label:"North Dakota", data:"North Dakota" } );
			stateDP.addItem( { label:"Ohio", data:"Ohio" } );
			stateDP.addItem( { label:"Oklahoma", data:"Oklahoma" } );
			stateDP.addItem( { label:"Oregon", data:"Oregon" } );
			stateDP.addItem( { label:"Pennsylvania", data:"Pennsylvania" } );
			stateDP.addItem( { label:"Rhode Island", data:"Rhode Island" } );
			stateDP.addItem( { label:"South Carolina", data:"South Carolina" } );
			stateDP.addItem( { label:"South Dakota", data:"South Dakota" } );
			stateDP.addItem( { label:"Tennessee", data:"Tennessee" } );
			stateDP.addItem( { label:"Texas", data:"Texas" } );
			stateDP.addItem( { label:"Utah", data:"Utah" } );
			stateDP.addItem( { label:"Vermont", data:"Vermont" } );
			stateDP.addItem( { label:"Virginia", data:"Virginia" } );
			stateDP.addItem( { label:"Washington", data:"Washington" } );
			stateDP.addItem( { label:"West Virginia", data:"West Virginia" } );
			stateDP.addItem( { label:"Wisconsin", data:"Wisconsin" } );
			stateDP.addItem( { label:"Wyoming", data:"Wyoming" } );
			////////////////////////////////////////
			
			
			eventTypeDP.addItem( { label:"Wedding Ceremony", data:"Wedding Ceremony" } );
			eventTypeDP.addItem( { label:"Wedding Rehearsal Dinner", data:"Wedding Rehearsal Dinner" } );
			eventTypeDP.addItem( { label:"Banquet / Dinner", data:"Banquet / Dinner" } );
			eventTypeDP.addItem( { label:"Private Party", data:"Private Party" } );
			eventTypeDP.addItem( { label:"Corporate Event", data:"Corporate Event" } );
			eventTypeDP.addItem( { label:"PR / Marketing Event", data:"PR / Marketing Event" } );
			eventTypeDP.addItem( { label:"Meeting", data:"Meeting" } );
			eventTypeDP.addItem( { label:"Conference", data:"Conference" } );
			eventTypeDP.addItem( { label:"Convention", data:"Convention" } );
			eventTypeDP.addItem( { label:"Class", data:"Class" } );
			eventTypeDP.addItem( { label:"Lecture / Speaker", data:"Lecture / Speaker" } );
			eventTypeDP.addItem( { label:"Retreat", data:"Retreat" } );
			eventTypeDP.addItem( { label:"Stage Performance", data:"Stage Performance" } );
			eventTypeDP.addItem( { label:"Filming / Photo Shoot", data:"Filming / Photo Shoot" } );
			
			hourComboDP.addItem( { label:"12:00", data:"12:00" } );
			hourComboDP.addItem( { label:"12:30", data:"12:30" } );
			hourComboDP.addItem( { label:"1:00", data:"1:00" } );
			hourComboDP.addItem( { label:"1:30", data:"1:30" } );
			hourComboDP.addItem( { label:"2:00", data:"2:00" } );
			hourComboDP.addItem( { label:"2:30", data:"2:30" } );
			hourComboDP.addItem( { label:"3:00", data:"3:00" } );
			hourComboDP.addItem( { label:"3:30", data:"3:30" } );
			hourComboDP.addItem( { label:"4:00", data:"4:00" } );
			hourComboDP.addItem( { label:"4:30", data:"4:30" } );
			hourComboDP.addItem( { label:"5:00", data:"5:00" } );
			hourComboDP.addItem( { label:"5:30", data:"5:30" } );
			hourComboDP.addItem( { label:"6:00", data:"6:00" } );
			hourComboDP.addItem( { label:"6:30", data:"6:30" } );
			hourComboDP.addItem( { label:"7:00", data:"7:00" } );
			hourComboDP.addItem( { label:"7:30", data:"7:30" } );
			hourComboDP.addItem( { label:"8:00", data:"8:00" } );
			hourComboDP.addItem( { label:"8:30", data:"8:30" } );
			hourComboDP.addItem( { label:"9:00", data:"9:00" } );
			hourComboDP.addItem( { label:"9:30", data:"9:30" } );
			hourComboDP.addItem( { label:"10:00", data:"10:00" } );
			hourComboDP.addItem( { label:"10:30", data:"10:30" } );
			hourComboDP.addItem( { label:"11:00", data:"11:00" } );
			hourComboDP.addItem( { label:"11:30", data:"11:30" } );
			bronzeUploaderPan.hourCombo.dataProvider = hourComboDP;
			//HAD TO
			ampmComboDP.addItem( { label:"AM", data:"AM" } );
			ampmComboDP.addItem( { label:"PM", data:"PM" } );
			bronzeUploaderPan.ampmCombo.dataProvider = ampmComboDP;
			
			
			bronzeUploaderPan.hourCombo.addItem( { label:"12:00", data:"12:00" } );
			bronzeUploaderPan.hourCombo.addItem( { label:"12:30", data:"12:30" } );
			
			
			////////////////////////////////////////////dataprovider for event type
			bronzeUploaderPan.eventTypeCombo.dataProvider = eventTypeDP;
			//lets fill the combo box for uploaders
			bronzeUploaderPan.stateCombo.dataProvider = stateDP;
			lookingSearchControl.stateCombo.dataProvider = stateDP;
			lookingSearchControl.eventTypeCombo.dataProvider = eventTypeDP;
			lookingSearchControl.enterBtn.addEventListener(MouseEvent.CLICK, lscHandler);
			
			//set event listener for uploading
			bronzeUploaderPan.browseBtn.addEventListener(MouseEvent.CLICK, browseIt);
			bronzeUploaderPan.uploadBtn.addEventListener(MouseEvent.CLICK, upLoadIt);
			bronzeUploaderPan.closeBtn.addEventListener(MouseEvent.CLICK, closeBronzeUPPan);
			
			//uploading stuff
			uploadURL = new URLRequest("http://localhost/img");
			imageFile.addEventListener(Event.SELECT, selectHandler);
			imageFile.addEventListener(Event.COMPLETE, completeHandler);
			imageFile.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			imageFile.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityHandler);
			imageFile.addEventListener(ProgressEvent.PROGRESS,progressHandler);
			
			
			//eventlistener for problems with the info going to amf and the connect call
			gs.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs.connect("http://localhost/amfphp/gateway.php");
			gs.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityHandler);
			
			gs2.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs2.connect("http://localhost/amfphp/gateway.php");
			
			gs3.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs3.connect("http://localhost/amfphp/gateway.php");
			
			gs4.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs4.connect("http://localhost/amfphp/gateway.php");
			
			gs5.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs5.connect("http://localhost/amfphp/gateway.php");
			
			gs6.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs6.connect("http://localhost/amfphp/gateway.php");
			
			gs7.addEventListener(NetStatusEvent.NET_STATUS, theStatus);
			gs7.connect("http://localhost/amfphp/gateway.php");
			
			//filter stuff for use with indicator since no hand cursor at the moment
			dropShadow.color = 0x000000;
			dropShadow.blurX = 10;
			dropShadow.blurY = 10;
			dropShadow.angle = 0;
			dropShadow.alpha = 0.5;
			dropShadow.distance = 10;
			
			filtersArray = new Array(dropShadow);
			
			//set the state of the site on finish loading
			siteState = "startPageSU";
			//align the stage for full screen
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE
			//set up welcome
			welcome.x = 162;
			welcome.y = 264;
			welcome.addEventListener(MouseEvent.CLICK, closeWelcome);
			//set up mainMenu
			mainMenu.x = stage.stageWidth / 2-100;
			mainMenu.y = stage.stageHeight / 2 - 100;
			mainMenu.mouseEnabled = false;
			mainMenu.mouseChildren = true;
			//mainMenu.alpha = .5;
			//add listener for the looking for something to so text in the main menu
			mainMenu.lfstd.addEventListener(MouseEvent.CLICK, goToLFSTD);
			//add a hand pointer to it also
			mainMenu.lfstd.mouseEnabled = true;
			mainMenu.lfstd.buttonMode = true;
			mainMenu.lfstd.useHandCursor = true;
			mainMenu.lfstd.addEventListener(MouseEvent.ROLL_OVER, overIndicator);
			mainMenu.lfstd.addEventListener(MouseEvent.ROLL_OUT, turnOffIndicator);
			//start your engines
			addEventListener(Event.ENTER_FRAME, mainLoop);
			//fix up the logo
			//myLogo.smoothing = true;	
			myLogo.x = stage.stageWidth / 2;
			myLogo.y = stage.stageHeight / 2;
			myLogo.scaleX = 1;
			myLogo.scaleY = 1;
			
			//place the sign in button
			signIn.x = 836;
			signIn.y = 25;
			signIn.addEventListener(MouseEvent.CLICK, getTheSignIn);
			signIn.addEventListener(MouseEvent.ROLL_OVER, overIndicator);  
			signIn.addEventListener(MouseEvent.ROLL_OUT, turnOffIndicator);
			
			//place the sign up button
			signUp.x = signIn.x +signIn.width + 30;
			signUp.y = signIn.y;
			signUp.addEventListener(MouseEvent.CLICK, getTheSignUp);
			signUp.addEventListener(MouseEvent.ROLL_OVER, overIndicator);  
			signUp.addEventListener(MouseEvent.ROLL_OUT, turnOffIndicator);
			
			
			
			//place the sign in control box
			signInCont.x = mainMenu.x;
			signInCont.y = mainMenu.y;
			//event listener for the submit button
			signInCont.signInSubmitBtn.addEventListener(MouseEvent.CLICK, testAndSignUP);
			signInCont.passTextInput.displayAsPassword = true;
			//signup control stuff
			signUpCont.x = mainMenu.x - 200;
			signUpCont.y = mainMenu.y;
			signUpCont.submitBtn.addEventListener(MouseEvent.CLICK, testAndSignUP2);
			signUpCont.regPass.displayAsPassword = true;
			signUpCont.confirmPass.displayAsPassword = true;
			//place regControl and it children
			regCont.x = mainMenu.x;
			regCont.y = mainMenu.y;
			
			//lets get ready to setup the uploader
			regCont.regAsUp.addEventListener(MouseEvent.CLICK, goToRegUP);
			regCont.regAsUp.addEventListener(MouseEvent.ROLL_OVER, overIndicator);  
			regCont.regAsUp.addEventListener(MouseEvent.ROLL_OUT, turnOffIndicator);
			
			//setup registration controls for bronze silver and gold
			bronzeUpRegCont.x = 50;
			bronzeUpRegCont.y = 300;
			bronzeUpRegCont.mouseEnabled = true;
			bronzeUpRegCont.buttonMode = true;
			bronzeUpRegCont.useHandCursor = true;			//silver
			bronzeUpRegCont.Btn.addEventListener(MouseEvent.CLICK, goToBronzeUploaderProfile);
			silverUpRegCont.x = 375;
			silverUpRegCont.y = 300;
			//gold
			goldUpRegCont.x = 675;
			goldUpRegCont.y = 300;
			///////////////////////////////////////////////////
			bronzeUploaderPan.x = 441;
			bronzeUploaderPan.y = 102;
			//bottom menu
			bottomMenu.x = 0;
			bottomMenu.y = stage.stageHeight - bottomMenu.height;
			//search for looking for somethigntodo
			
			lookingSearchControl.close.addEventListener(MouseEvent.CLICK, closeLFSTDC);
			loading.x  = stage.stageWidth / 2 - loading.width / 2;
			loading.y = stage.stageHeight / 2;
			
			animBack.y = 300;
			//////////////////////////////
			galLastBtn.x = stage.stageWidth / 6;
			galLastBtn.y = stage.stageHeight - 280;
			galLastBtn.buttonMode = true;
			galLastBtn.useHandCursor = true;
			galLastBtn.addEventListener(MouseEvent.CLICK, lastBtnHandler);
			galNextBtn.x = stage.stageWidth / 1.5;
			galNextBtn.y = stage.stageHeight - 280;
			galNextBtn.buttonMode = true;
			galNextBtn.useHandCursor = true;
			galNextBtn.addEventListener(MouseEvent.CLICK, nextBtnHandler);
			galDoneBtn.x = (galLastBtn.x + galNextBtn.x)/2;
			galDoneBtn.y = galNextBtn.y;
			galDoneBtn.buttonMode = true;
			galDoneBtn.useHandCursor = true;
			galDoneBtn.addEventListener(MouseEvent.CLICK, lastDoneHandler);
			galNum.x = stage.stageWidth / 2;
			galNum.y = 30;
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, handleSWFAdress);
			
			
		}
		
		
		//////////////////////////////////////////////////////////////////////////////
		public function mainLoop(event:Event):void {
			switch(siteState) {
				case "startPageSU":
				//add the logo
				addChild(myLogo);
				//add the content backs in
				//tween the logo
				TweenLite.to(myLogo, 1, { scaleY:2, scaleX:2, delay:.5, onComplete:logoToCorner } );
				
				siteState = "startPage";
				break;
				case "startPage":
				//call resize function every iteration of loop for this site state
				resizeStartPage();
				
				break;
				
				case "genMemProfileSU":
				
				if (this.contains(signIn)) {
					removeChild(signIn);
				}
				if (this.contains(signUp)) {
					removeChild(signUp);
				}
				if (this.contains(signInCont)) {
					removeChild(signInCont);
				}
				if (this.contains(signUpCont)) {
					removeChild(signUpCont);
				}
				addChild(regCont);
				mainMenu.x = 10;
				addChild(mainMenu);
				addChild(bottomMenu);
				siteState = "genMemProfile";
				break;
				case "genMemProfile":
				
				break;
				case "regAsUPSU":
				if (this.contains(regCont)) {
					removeChild(regCont);
				}
				if (this.contains(mainMenu)) {
					removeChild(mainMenu);
				}
				
				addChild(bronzeUpRegCont);
				addChild(silverUpRegCont);
				addChild(goldUpRegCont);
				siteState = "regASUP";
				
				break;
				case "regAsUP":
				break;
				case "BronzeUploaderProfileSU":
				removeChild(bronzeUpRegCont);
				removeChild(silverUpRegCont);
				removeChild(goldUpRegCont);
				addChild(mainMenu);
				addChild(bottomMenu);
				addChild(bronzeUploaderPan);
				siteState = "BronzeUploaderProfile"
				
				break;
				case "BronzeUploaderProfile":
				
				break;
				case "LFSTDSU":
				
				siteState = "LFSTD";
				break;
				case "LFSTD":
				
				break;
				
				
			}
		}
		
		//this function resizes items in the start page when users browser changes
		public function resizeStartPage():void {
			
			
		}
		
		//tween for after logo scales in intro
		public function logoToCorner():void {
			TweenLite.to(myLogo, 1, { x:0, y:0, scaleX:1, scaleY:1 , onComplete:showWelcome});
			//textBackOpenAnim();
		}
		
		public function showWelcome():void {
			welcome.alpha = 0;
			addChild(welcome);
			TweenLite.to(welcome, 1, { alpha:1 } );
			
		}
		
		//this function just removes the welcome message
		public function closeWelcome(event:MouseEvent) {
			removeChild(welcome);
			addChild(mainMenu);
			addChild(signIn);
			addChild(signUp);
			
		}
		
		public function goToLFSTD(event:MouseEvent) {
			trace("jo");
			var nextPos:Number = mainMenu.x - (mainMenu.width + 120);
			TweenLite.to(mainMenu, 1, { x:nextPos,ease:Expo.easeIn,onComplete:showLookingSearchControl } );
			
			
			siteState = "LFSTDSU";
			
		}
		//////////these are for the effects for letting theb user know what is going on////
		public function overIndicator(event:MouseEvent) {
			event.target.filters = filtersArray;
			
		}
		
		public function turnOffIndicator(event:MouseEvent) {
			event.target.filters = [];
		}
		///////////////////////////////////////////////////////////////////////////////////////
		
		public function getTheSignIn(event:MouseEvent) {
			
			removeChild(mainMenu);
			removeChild(signUp);
			addChild(signInCont);
		}
		
		public function getTheSignUp(event:MouseEvent) {
			removeChild(mainMenu);
			removeChild(signIn);
			addChild(signUpCont);
		}
		
		public function testAndSignUP(event:MouseEvent) {
			trace("in testAndSignUP");
			//first lets make sure that there is a vaild email address
			var emailString:String = signInCont.emailTextInput.text;
			//trace(isValidEmail(emailString));//true trace(isValidEmail('all@asd'));//false
			gs.call("ValidateEmail.valid_email", res, emailString );
		}
		//for sign up control
		public function testAndSignUP2(event:MouseEvent) {
			trace("in testAndSignUP");
			//first lets make sure that there is a vaild email address
			var emailString:String = signUpCont.regEmail.text;
			//trace(isValidEmail(emailString));//true trace(isValidEmail('all@asd'));//false
			gs.call("ValidateEmail.valid_email", res3, emailString );
		}
		
		public function isValidEmail(email:String):Boolean { 
			//var emailExpression:RegExp = /^[a-z][w.-]+@w[w.-]+.[w.-]*[a-z][a-z]$/i; 
			var emailExpression:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+.)+[A-Z]{2,4}$/i;
			return emailExpression.test(email); 
			}
			
		public function onResult(responds:Array) {
			trace("in onresult");
			trace(responds);
			//MonsterDebugger.inspect(responds);
			if(responds.length > 0){
				//check the value of the first element
				if (responds[0] == 1) {
					trace("it is true");
					checkPassword();
				}else if (responds[0] == 0) {
					trace("not true");
					//notification.text = "";
					//notification.text =  "Please enter valid email";
					AlertManager.createAlert(this, "Please enter valid email");
				}
			} else {
				trace("nothing in array");
			}
		}
		
		
		
		public function onResult2(responds:Array) {
			trace("in res2");
			
			if(responds.length > 0){
				//check the value of the first element
				AlertManager.createAlert(this, "Welcome to the members area");
				//ok lets fill the user object
				user.generalMember = "yes";
				//lets fill in the user object
				user.id = responds[0].user_id;
				user.isCVOBronze = responds[0].cvo_bronze;
				user.isCVOSilver = responds[0].cvo_silver;
				user.isCVOGold = responds[0].cvo_gold;
				user.isPVOBronze = responds[0].pvo_bronze;
				user.isPVOSilver = responds[0].pvo_silver;
				user.isPVOGold = responds[0].pvo_gold;
				user.isPBronze = responds[0].promoter_silver;
				user.isPSilver = responds[0].promoter_bronze;
				user.isPGold = responds[0].promoter_gold;
				user.isEPBronze = responds[0].event_planner_bronze;
				user.isEPSilver = responds[0].event_planner_bronze;
				user.isEPGold = responds[0].event_planner_gold;
				user.isUBronze = responds[0].uploader_bronze;
				user.isUSilver = responds[0].uploader_silver;
				user.isUGold = responds[0].uploader_gold;
				user.isVBronze = responds[0].vendor_bronze;
				user.isVSilver = responds[0].vendor_silver;
				user.isVGold = responds[0].vendor_gold;
				
				MonsterDebugger.inspect(responds);
				SWFAddress.setValue("members");
				siteState = "genMemProfileSU";	
					return;
				}else{
					trace("cant get in buddy");
					//notification.text = "";
					//notification.text =  "Please enter valid email";
					AlertManager.createAlert(this, "username or password not found");
				}
			
			
		}
		
		public function onResult3(responds:Array) {
			trace("in onresult");
			trace(responds);
			//MonsterDebugger.inspect(responds);
			if(responds.length > 0){
				//check the value of the first element
				if (responds[0] == 1) {
					trace("it is true");
					checkPassword2();
				}else if (responds[0] == 0) {
					trace("not true");
					//notification.text = "";
					//notification.text =  "Please enter valid email";
					AlertManager.createAlert(this, "Please enter valid email");
				}
			} else {
				trace("nothing in array");
			}
		}
		
		//this checks the pasword for the signup control
		public function checkPassword2() {
			trace("in check password");
			//make sure there is something in the password fields
			if (signUpCont.regPass.text == "" || signUpCont.confirmPass.text == "") {
				AlertManager.createAlert(this, "Please enter a vaild password");
			}else if (signUpCont.regPass.text != signUpCont.confirmPass.text) {
				AlertManager.createAlert(this, "Passwords do not match");
			}else {
				trace("calling");
				gs.call("ValidateEmail.add_user", res4, signUpCont.regEmail.text, signUpCont.regPass.text );
			}
			
		}
		
		public function checkPassword() {
			trace("in check password");
			//make sure there is something in the password fields
			if (signInCont.passTextInput.text == "") {
				//notification.text = "no password";
				AlertManager.createAlert(this, "Please enter a vaild password");

				return;
			}else {
				trace("calling");
				gs2.call("ValidateEmail.checkAndLogin", res2, signInCont.emailTextInput.text, signInCont.passTextInput.text );
			}
			
		}
		
		public function onResult4(responds:Array) {
			
			if(responds.length > 0){
				//check the value of the first element
				if (responds[0] == 1) {
					trace(responds[0]);
					AlertManager.createAlert(this, "You have been registered please check your email to confirm");
				}else if (responds[0] == 0) {
					trace(responds[0]);
					trace("not true");
					//notification.text = "";
					//notification.text =  "Please enter valid email";
					AlertManager.createAlert(this, "Email already exsists if you have forgotten your password please go to the sign area and click on -forgot password-");
				}
			} else {
				trace("nothing in array");
			}
			
		}
		
		public function onResult5(responds:Array) {
			AlertManager.createAlert(this, "uploading finished");
			//removeChild(bronzeUploaderPan);
			trace("in res5");
		}
		
		public function onResult6(responds:Array) {
			//AlertManager.createAlert(this, "uploading finished");
			//ok lets get the info out of the array and put it into an event object
			
			addChild(animBack);
			
			if(responds.length > 0){
					for ( var i:Number = 0; i < responds.length; i++) {
						spotEvent = new SpotEvent();
						uil = new UILoader();
						
						
						
						spotEvent.eventId = responds[i].event_id;
						spotEvent.name = responds[i].name;
						spotEvent.city = responds[i].city;
						spotEvent.state = responds[i].state;
						spotEvent.type = responds[i].type;
						spotEvent.date = responds[i].date;
						spotEvent.time = responds[i].time;
						spotEvent.promoter = responds[i].promoter;
						spotEvent.rsvpEmail = responds[i].rsvp_email;
						spotEvent.rsvpNumber = responds[i].rsvp_number;
						spotEvent.picName = responds[i].pic_name;
						spotEvent.pickPath = responds[i].pic_path;
						spotEvent.desc = responds[i].event_desc;
						
						uil.x = stage.stageWidth + 100;						
						uil.width = 250;
						uil.height = 300;
						uil.source = spotEvent.pickPath + "/" + spotEvent.picName;					
						uil.y = 320;
						uil.filters = filtersArray;
						
						uil.addEventListener(Event.COMPLETE, completeHandler); 
						eventsArray.push(spotEvent);
						uilArray.push(uil);
						addChild(uilArray[i]);
						
					}
					
					
					//we need to put some sort of loader on the main page
					//load the info into the uiloaders
					
					//start the title animation
					
			}
			trace("in res6");
		}
		
			public function onResult7(responds:Array) {
			//AlertManager.createAlert(this, "uploading finished");
			//ok lets get the info out of the array and put it into an event object
			
			addChild(animBack);
			if (responds.length < 5) {
				lastPage = true;
				galNextBtn.enabled = false;
			}
			if(responds.length > 0){
					for ( var i:Number = 0; i < responds.length; i++) {
						spotEvent = new SpotEvent();
						uil = new UILoader();
						
						
						
						spotEvent.eventId = responds[i].event_id;
						spotEvent.name = responds[i].name;
						spotEvent.city = responds[i].city;
						spotEvent.state = responds[i].state;
						spotEvent.type = responds[i].type;
						spotEvent.date = responds[i].date;
						spotEvent.time = responds[i].time;
						spotEvent.promoter = responds[i].promoter;
						spotEvent.rsvpEmail = responds[i].rsvp_email;
						spotEvent.rsvpNumber = responds[i].rsvp_number;
						spotEvent.picName = responds[i].pic_name;
						spotEvent.pickPath = responds[i].pic_path;
						spotEvent.desc = responds[i].event_desc;
						
						uil.x = stage.stageWidth + 100;						
						uil.width = 250;
						uil.height = 300;
						uil.source = spotEvent.pickPath + "/" + spotEvent.picName;					
						uil.y = 320;
						uil.filters = filtersArray;
						
						uil.addEventListener(Event.COMPLETE, completeHandler); 
						eventsArray.push(spotEvent);
						uilArray.push(uil);
						addChild(uilArray[i]);
						
					}
					
					
					//we need to put some sort of loader on the main page
					//load the info into the uiloaders
					
					//start the title animation
					
			}
			trace("in res6");
		}
		
		public function onFault(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		public function onFault2(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		public function onFault3(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		public function onFault4(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		public function onFault5(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		
		public function onFault6(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		
		public function onFault7(responds:Object) {
			trace("did not know");
			
			for (var i in responds) {
				trace(responds[i]);
			}
		}
		
		
		public function theStatus(event:NetStatusEvent) {
			trace("in status");
			trace(event.info.code);
		}
		
		public function theStatus2(event:NetStatusEvent) {
			trace("in status 2");
			trace(event.info.code);
		}
		
		public function goToRegUP(event:MouseEvent) {
			siteState = "regAsUPSU";
		}
		public function goToBronzeUploaderProfile(event:MouseEvent) {
			trace("button working");
			siteState = "BronzeUploaderProfileSU";
		}
		
		public function browseIt(event:MouseEvent) {
			//get information about the image from the upload
		
			//upload the the info
			
			trace("worked");
			//trace(myForm.myDate.selectedDate);
			imageFile.browse( new Array( new FileFilter( "Images (*.jpg, *.jpeg, *.gif, *.png)", "*.jpg;*.jpeg;*.gif;*.png" ) ) );
			

		}
		
		
		private function selectHandler(event:Event):void {
            var file:FileReference = FileReference(event.target);
           bronzeUploaderPan.fileNameText.text = file.name + " URL=" + uploadURL.url;
			
            
        }
		
		private function ioErrorHandler(event:IOErrorEvent):void {
            trace("ioErrorHandler: " + event);
        }
		
		function completeHandler(event:Event):void
		{
			counter += 1;
			if (counter == 5) {
				removeChild(loading);
				doOoenLFSTDanimation();
			}
			trace(counter);
		}
		
		function upLoadIt(event:MouseEvent) {
			//var file:FileReference = FileReference(event.target);
			var request:URLRequest = new URLRequest("http://localhost/test"
			+ "pics.php");
			try {
				imageFile.upload(request);
				
			}
			catch(error:Error) {
				trace("unable to upload file");
			}
            trace("selectHandler: name=" + imageFile.name + " URL=" + uploadURL.url);
			gs5.call("SendPic.sendData", res5, user.id,uploadURL.url,bronzeUploaderPan.EventNameTextInput.text,bronzeUploaderPan.eventTypeCombo.selectedLabel,bronzeUploaderPan.cityInput.text,bronzeUploaderPan.stateCombo.selectedLabel,bronzeUploaderPan.datePick.selectedDate,bronzeUploaderPan.hourCombo.selectedLabel+""+bronzeUploaderPan.ampmCombo.selectedLabel,bronzeUploaderPan.promoterInputText.text,bronzeUploaderPan.RSVPEmailTextINput.text,bronzeUploaderPan.RSVPNumberTextINput.text,imageFile.name,bronzeUploaderPan.eventDescTextArea.text );
            //file.upload(request);$user_id,$path,$name,$type,$city,$state,$date,$time,$promoter,$rsvp_email,$rsvp_number,$pic_name
		}
		
		function showLookingSearchControl() {
			lookingSearchControl.alpha = 0;
			lookingSearchControl.x = stage.stageWidth / 2 - lookingSearchControl.width / 2;
			lookingSearchControl.y = mainMenu.y;
			addChild(lookingSearchControl);
			TweenLite.to(lookingSearchControl, .5, { delay:.2, alpha:1 } );
		}
		
		public function closeLFSTDC(event:MouseEvent) {
			removeChild(lookingSearchControl);
			
		}
		
		public function closeBronzeUPPan(event:MouseEvent) {
			removeChild(bronzeUploaderPan);
		}
		
		private function securityHandler(event:SecurityErrorEvent):void {
			trace("a security error occurred");
		}
		private function progressHandler(event:ProgressEvent):void {
			trace ("file uploading\noprogress (bytes): " + event.bytesLoaded + " / " + event.bytesTotal);
		}
		
		public function lscHandler(event:MouseEvent) {
			trace("in lsc");
			addChild(loading);
			cityString = lookingSearchControl.cityInput.text;
			stateString = lookingSearchControl.stateCombo.selectedLabel;
			typeString = lookingSearchControl.eventTypeCombo.selectedLabel;
			gs6.call("Gallery.getGalleryData", res6, lfstdPage, lookingSearchControl.cityInput.text, lookingSearchControl.stateCombo.selectedLabel, lookingSearchControl.eventTypeCombo.selectedLabel);
			
		}
		
		public function doOoenLFSTDanimation():void {
			//first we have to put all the loader onto the stage
			
			var theX:Number = stage.stageWidth / 2;
			TweenLite.to( animBack, 1, { width:stage.stageWidth + 300, alpha:.7, onComplete:nextTween } );
			
			//TweenLite.to(uilArray[0], 1, { x:theX } );
		}
		
		public function nextTween():void {
			nextTweenCounter++;
			var theX1:Number = stage.stageWidth / 6;
			var theX2:Number = theX1+ (uilArray[0].width* 1);
			var theX3:Number = theX1+ (uilArray[0].width* 2);
			var theX4:Number = theX1+ (uilArray[0].width* 3);
			var theX5:Number = theX1+ (uilArray[0].width* 4);
			switch(nextTweenCounter) {
				case 1:
				TweenLite.to(uilArray[0], 1, { x:theX1, onComplete:nextTween } );
				break;
				case 2:
				TweenLite.to(uilArray[1], 1, { x:theX2, onComplete:nextTween } );
				break;
				case 3:
				TweenLite.to(uilArray[2], 1, { x:theX3, onComplete:nextTween } );
				break;
				case 4:
				TweenLite.to(uilArray[3], 1, { x:theX4, onComplete:nextTween } );
				break;
				case 5:
				TweenLite.to(uilArray[4], 1, { x:theX5, onComplete:showNextLastBtns } );
				break;
				
			}
			
		}
		
		public function showNextLastBtns():void {
			addChild(galNextBtn);
			addChild(galLastBtn);
			addChild(galNum);
			addChild(galDoneBtn);
		}
		
		public function lastBtnHandler(event:MouseEvent):void {
			
		}
		public function nextBtnHandler(event:MouseEvent):void {
			//add the loading button to the string
			//addChild(loading);
			nextAction();
			lfstdPage++;
			
			
		}
		public function nextAction():void {
			nextActionCounter++;
			var theX1:Number = -200;
			switch(nextTweenCounter) {
				case 1:
				TweenLite.to(uilArray[0], 1, { x:theX1, onComplete:nextTween } );
				break;
				case 2:
				TweenLite.to(uilArray[1], 1, { x:theX1, onComplete:nextTween } );
				break;
				case 3:
				TweenLite.to(uilArray[2], 1, { x:theX1, onComplete:nextTween } );
				break;
				case 4:
				TweenLite.to(uilArray[3], 1, { x:theX1, onComplete:nextTween } );
				break;
				case 5:
				TweenLite.to(uilArray[4], 1, { x:theX1, onComplete:callNext } );
				break;
				
			}
		}
		
		public function callNext():void {
			addChild(loading);
			gs7.call("Gallery.getGalleryData", res7, lfstdPage, cityString, stateString, typeString);
		}
		public function lastDoneHandler(event:MouseEvent):void {
			
		}
		
		public function handleSWFAdress(event:SWFAddressEvent):void {
			
		}
		

		
		
	}
}