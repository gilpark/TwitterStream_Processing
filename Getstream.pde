
class Getstream
{	
  ///////////////////// set your twitter dev info ////////////////////////////////
  /// This is where you enter your Oauth info
  String OAuthConsumerKey = "";
  String OAuthConsumerSecret = "";
  // This is where you enter your Access Token info
  String AccessToken = "";
  String AccessTokenSecret = "";

  AccessToken loadAccessToken() 
  {
    return new AccessToken(AccessToken, AccessTokenSecret);
  }
  ////////////////////////////////////////////////////////////////////////////////

  //initialize twitter stream  
  TwitterStream twitter = new TwitterStreamFactory().getInstance();

  double[][] loc = null;
  String[] keywords = {};
  int _maxtweets;


  Getstream()  
  {  
    connectTwitter();
    twitter.addListener(listener);
  }

  Getstream(int maxtweets)  
  {
    //this.maxtweets = maxtweets;
    _maxtweets = maxtweets;
    connectTwitter();
    twitter.addListener(listener);
  }
 

  // Initial connection
  void connectTwitter() 
  {
    twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
    AccessToken accessToken = loadAccessToken();
    twitter.setOAuthAccessToken(accessToken);
  }

  //search tweets
  void search()
  {    
    twitter.sample();
  }

  void search(String[] keywords)
  {    
    FilterQuery query = new FilterQuery();
    query.track(keywords);
    twitter.filter(query);
  }

    void search(double[][] loc)
  {    
    FilterQuery query = new FilterQuery();
    query.locations(loc);
    twitter.filter(query);  
  }

    void search(String[] keywords, double[][] loc)
  {
      
      FilterQuery query = new FilterQuery();
      query.track(keywords);
      query.locations(loc);
      twitter.filter(query);
  }

  void shutdown()
  {
    twitter.shutdown();
  }

  // This listens for new tweet
  StatusListener listener = new StatusListener() 
  {

    void onStatus(Status status) {
      //println(status);
      //more info -> http://twitter4j.org/javadoc/twitter4j/Status.html
      String name = status.getUser().getScreenName();
      String msg = status.getText();
      GeoLocation loc = status.getGeoLocation();
      Place place = status.getPlace();
      Date time = status.getCreatedAt();
      
      //conver Status into tweet obj and add to tweetList
      tweetList.add(new Tweet(name, msg, loc, place, time, _maxtweets));
      
    }

    void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
      //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
    }
    void onTrackLimitationNotice(int numberOfLimitedStatuses) {
      // System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
    }
    void onScrubGeo(long userId, long upToStatusId) {
      //System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
    }

    void onException(Exception ex) {
      ex.printStackTrace();
    }
  };
}


