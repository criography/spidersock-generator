<?php

class Cgy_Twitter_Parser{

	private $cacheTime       = 300; //5min * 60s
  private $jsonFile        = 'twitter.json';

	/* create an App, generate all your keys and tokens through: https://apps.twitter.com/app/new */
	private $username        = 'aardvarklondon';
	private $consumer_key    = '';
	private $consumer_secret = '';
	private $user_token      = '';
	private $user_secret     = '';
  private $timeout         = 5;
	/* deprecated:  private $url= 'https://api.twitter.com/1/statuses/user_timeline.json?include_entities=0&include_rts=1&screen_name={{username}}&count=1&trim_user=1&callback=?'; */




  
  function __construct(){

	  /* load OAuth libs */
	  require '../../core/lib/tmhOAuth/tmhOAuth.php';
	  require '../../core/lib/tmhOAuth/tmhUtilities.php';



	  //if cached file exists load it and decode:
    if(file_exists($this->jsonFile)){
      $original = file_get_contents($this->jsonFile);
      $parsed   = json_decode($original);
      
      // if it's been $cacheTime since last refresh call API
      if((time() - $parsed->time) > $this->cacheTime){
        $this->getTweet();
        
      //otherwise print cached file  
      }else{
        $this->throwJSON($original);
        
      };

    // if there's no cache file, call last.fm API and generate it  
    }else{
	    $this->setTwitterUsername();
      $this->getTweet();
    } 
    
  }








  

	/**
	 * setTwitterAccount
	 * ------------------------------------------------------------
	 * attempt connecting to WPDB and pulling custom field named twitter_username.
	 * Fallback to class variable if null
	 *
	 * @return string Complete Twitter feed URL
	 */

	private function setTwitterUsername(){
		if(empty($this->username)){
			define( 'SHORTINIT', true );
			require_once( $_SERVER['DOCUMENT_ROOT'] . '/wp-load.php' );
			global $wpdb;

			$username = $wpdb->get_var( $wpdb->prepare( "SELECT meta_value FROM $wpdb->postmeta WHERE meta_key = 'twitter_username';" ) );
			if(!is_null($username)){
				$this->username = $username;
			}
		}
	}









	/**
	 * getFileContents
	 * ------------------------------------------------------------
	 * CURL file loader
	 *
	 * @param string $twitterURL URL
	 * @return string Destination URL contents
	 */

	private function getFileContents($twitterUrl){
		$ch      = curl_init();

		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL, $twitterUrl);
		curl_setopt($ch, CURLOPT_TIMEOUT, $this->timeout);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		//curl_setopt($ch, CURLOPT_USERPWD, $this->user . ":" . $this->password);

		$data = curl_exec($ch);
		curl_close($ch);

		return $data;
	}














	/**
	 * parseTweet
	 * ------------------------------------------------------------
	 * inject tweet text string with links
	 *
	 * @param string $tweet tweet plain text
	 * @return string HTML Formatted Tweet
	 */

	private function parseTweet($tweet){
		//handle any special characters
		$tweet = htmlentities($tweet, ENT_QUOTES, 'utf-8');

		//parse the tweet text into html
		$tweet = preg_replace('@(https?://([-\w\.]+)+(/([\w/_\.]*(\?\S+)?(#\S+)?)?)?)@', '<a href="$1" rel="nofollow">$1</a>', $tweet);
		$tweet = preg_replace('/@(\w+)/', '<a href="http://twitter.com/$1" rel="nofollow">@$1</a>', $tweet);
		$tweet = preg_replace('/\s#(\w+)/', ' <a href="https://twitter.com/hashtag/$1" rel="nofollow">#$1</a>', $tweet);

		//assemble everything
		return $tweet;

	}






	/**
	 * requestTweetViaAPI
	 * ------------------------------------------------------------
	 * attempt connection with Twitter's API and pulling latest tweet
	 *
	 * @param string $tweet tweet plain text
	 * @return string JSON Formatted Tweet, or false if error
	 */

	private function requestTweetViaAPI(){

		/* establish new OAuth connection */
		$tmhOAuth = new tmhOAuth(array(
			'consumer_key'    => $this->consumer_key,
			'consumer_secret' => $this->consumer_secret,
			'user_token'      => $this->user_token,
			'user_secret'     => $this->user_secret
		));

		/* request latest tweet */
		$code = $tmhOAuth->request('GET', $tmhOAuth->url('1.1/statuses/user_timeline'), array(
			'screen_name' => $this->username,
			'count'       => 1
		));


		if ($code == 200) {
			return $tmhOAuth->response['response'];
		} else {
			return false;
		}

	}






  
  
  /**
   * getTweet
   * ------------------------------------------------------------
   * control Tweet grabbing
   */
  private function getTweet(){

	  $twitterFeed = json_decode( $this->requestTweetViaAPI() );

	  if(is_array($twitterFeed)){
		  $output  = array('time' => time(), 'tweets' => array(array('created_at' => $twitterFeed[0]->created_at, 'text' => $this->parseTweet($twitterFeed[0]->text))));                 // output JSON
		  $output = json_encode($output);

		  //save cache file
		  file_put_contents($this->jsonFile, $output);

		  //print JSON
		  $this->throwJSON($output);
	  }


  }

  
  
  
  
  
  
  
  

  /**
   * throwJSON
   * ------------------------------------------------------------
   * @param   $json {JSON object}
   * @return  JSON output with set header
   */
  private function throwJSON($json){
    header('Cache-Control: maxage='.($this->cacheTime));
    header('Expires: ' . gmdate('D, d M Y H:i:s', time()+($this->cacheTime)) . ' GMT');
    header("Pragma: cache");
    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
    header("Content-type: application/json");
    echo $json;
  }

   
   
}





new Cgy_Twitter_Parser();

?>