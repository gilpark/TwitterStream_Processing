int tsize;

class Tweet
{
  String _name;
  String _msg;
  GeoLocation _loc;
  Place _place;
  Date _time;
  
  int _tweetCount;

  //for test displaying
  int x,y;

  Tweet(String name, String msg, GeoLocation loc, Place place, Date time, int tweetCount)
  {
    _name = name;
    _msg = msg;
    _loc = loc;
    _place = place;
    _time = time;
    _tweetCount = tweetCount;
    
    tsize++;

    if(_tweetCount < tsize && _tweetCount != 0)
    {
      println("closing connection..");
      stream.shutdown();
      tsize = 0;
    } 
    //for debuging
    // println("\n"+tweetCount+" Tweet : ");
    // println("Name : " + getName());
    // println("Msg : " + getMsg());
    // // println("Location : " +getLat()+","+getLon()+"--"+getPlace());
    // println("Date : " + getTime());
    // println("Added");

    x = (int)random(width);
    y = (int)random(height);
  }

  String getName()
  {
    return _name;
  }

  String getMsg()
  {
    return _msg;
  }
  float getLat()
  {
    return (float)_loc.getLatitude();
  }
  float getLon()
  {
    return (float)_loc.getLongitude();
  }
  String getPlace()
  {
    return _place.getName();
  }
  Date getTime()
  {
    return _time;
  }

  void display()
  {
    //do something cool
    
  fill(255);
    ellipse(x,y,5,5);
  }

}

