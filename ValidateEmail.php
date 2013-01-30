<?php
	class ValidateEmail
	{
		
		public function __construct()
		{
			$server = mysql_connect("h50mysql83.secureserver.net", "spotaplace", "Robbins9@");
			if (!$server) die("Unable to connect to MySQL: " . mysql_error());
			mysql_select_db("spotaplace") or die("something went wrong" .mysql_error());
		}
		
		public function valid_email($email){
			$num1 = 0;
			$num2 = 1;
			$t = array();
			if( !eregi("^[a-z0-9]+([_\\.-][a-z0-9]+)*"."@([a-z0-9]+([\.-][a-z0-9]+))*$",$email, $regs)){
				$t[0] = 0;
				return $t;
     	 //return false;
  		 } else if( gethostbyname($regs[2]) == $regs[2] ){
      	// if host is invalid
			
			//array_push($t, $num1);
			$t[0] = $num1;
     	return $t;
  		 } else {
			 //array_push($t, $num2);
			 $t[0] = $num2;
     	return $t;
  	 	}
		 
		 }
		 
		 public function add_user($user_email,$user_password){
			 
			$num1 = 0;
			$num2 = 1;
			$t = array();
			
			 $user_passwordMD5 = md5($user_password);
			 $hash = md5( rand(0,1000) ); // Generate random 32 character hash and assign it to a local variable.  
			 
			 //first let check if there is already a user and password
			 $search = mysql_query("SELECT email FROM spotUsers WHERE email='".$user_email."'") or die(mysql_error());
			 $match  = mysql_num_rows($search); 
					//$match = 0;
			if($match > 0){  
				$t[0] = $num1;
				//there is a match
				//echo $t[0];
				return $t;
  		 	} else {
					//array_push($t, $num2);
					//echo 'no match';
					// $query = "INSERT INTO spotUsers(email,password,hash)VALUES('". mysql_escape_string($user_email)."','".mysql_escape_string($user_passwordMD5)."','".mysql_escape_string($hash)."')";
					 $query = "INSERT INTO spotUsers(email,password,hash)VALUES('". mysql_escape_string($user_email)."','".mysql_escape_string($user_passwordMD5)."','".mysql_escape_string($hash)."')";
					 $result = @mysql_query($query) or die(mysql_error());
					 
					 $to = $user_email;
					 $subject = 'Signup | Verification'; //Give the email a subject
					 $message = ' Thanks for signing up! 
						Your account has been created, you can login with the following credentials after you have activated your account by pressing the url below. 
		  
						 ------------------------ 
						 Username: '.$user_email.' 
						 Password: '.$user_password.' 
						 ------------------------ 
						  
					 Please click this link to activate your account: 
					 http://www.spotaplace.com/verify.php?email='.$user_email.'&hash='.$hash.' 
					  
					 '; // Our message above including the link  
										   
						$headers = 'From:noreply@spotaplace.com' . "\r\n"; // Set from headers  
						mail($to, $subject, $message, $headers); // Send our email 
						$t[0] = $num2;
						//echo $t[0];
						return $t;
  	 		}
			
		 }
		 
		 public function checkAndLogin($user_email,$user_password){
			 		$num1 = 0;
					$num2 = 1;
					$t = array();
					//we need to get some varibles from the object
					
					
			 		$user_passwordMD5 = md5($user_password);
					
					$username = mysql_escape_string($user_email);  
   					$password = mysql_escape_string($user_passwordMD5);                     
    				$search = mysql_query("SELECT email, password, active FROM spotUsers WHERE email='".$username."' AND password='".$password."' AND active='1'") or die(mysql_error());   
    				$match  = mysql_num_rows($search); 
					//$match = 0;
					if($match > 0){  
					 	//$t[0] = $num2;
						$search = mysql_query("SELECT * FROM spotUsers WHERE email='".$username."' AND password='".$password."' AND active='1'") or die(mysql_error());
						//get the user_id number information from the search
						while($row = mysql_fetch_array($search)){
						 $theId = $row['user_id'];
						 }
						 
						 //now lets query the engine again and all the info
						 $search = mysql_query("SELECT * FROM spotUsers WHERE user_id ='".$theId."' ") or die(mysql_error());
						while($row = mysql_fetch_assoc($search))
						{
							array_push($t, $row);
						}
     					return $t;
  		 			} else {
						
			 		//array_push($t, $num2);
					 $t[0] = $num1;
     					return $t;
  	 				}
		 }
		 
		 
		 public function getMembershipInfo($user_info){
			 
		 }
}
?>