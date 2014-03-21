/*
Based on neufuture's 'SimpleTwitterStream' link : https://github.com/neufuture/SimpleTwitterStream/
still there  are some errors.
feedbacks are welcome.

sendtogil on GitHub

*/

import java.util.*;

/////////////////////////////search variables////////////////////////////////
//!!set search terms otherwise it will sample tweets
String terms[] = 
{
  "google",
};
//set bouding box for chicago area : (41.8819,-87.678)
// chagne locations if you need
double lat = 41.8819;
double lon = -87.6278;

double lon1 = lon - .5;
double lon2 = lon + .5;
double lat1 = lat - .5;
double lat2 = lat + .5;
//double box[][] = {{lon1, lat1},{lon2, lat2}}; //for given location
double box[][] = null;// without location
////////////////////////////////////////////////////////////////////////////

//Tweet to array List
//HashMap<Integer, Tweet> tweetMap = new HashMap<Integer, Tweet>();
List<Tweet> tweetList;

Getstream stream; 

void setup() 
{
  size(800, 800);
  background(0);
  tweetList = new ArrayList<Tweet>();
  stream = new Getstream(); //if you need non-stop streaming
  //stream = new Getstream(10); //set max tweets
  stream.search(); // search(terms, location);
}

void draw() 
{

  for (int i = 0; i< tweetList.size(); i++)
  {
    Tweet t = tweetList.get(i);
    t.display();
    text(t.getName(), t.x, t.y - 10);
  }

  //it's not working this way... : throws concurrent modification error

  //Iterator<Tweet> iterator = tweetList.iterator();
  //while(iterator.hasNext())
  //{
  //Tweet t = (Tweet) iterator.next();
  //if(tsize > 5) iterator.remove();
  //else{
  //t.display();
  //text(t.getName(), t.x, t.y - 10);
  //background(0, 200);
  //}  
  //}
}

void keyPressed()
{
  for (Tweet t : tweetList)
  {
  }
}


