TwitterStream_Processing
===================
-----------------------------------------------------------------

Twitter streaming API for Processing by Gill.

Get API key if you don't have it.

[https://dev.twitter.com](https://dev.twitter.com)

This app allows you to stream tweets from twitter using the TwitterStream API.


>####[Past vs. Future](http://140dev.com/twitter-api-programming-tutorials/aggregating-tweets-search-api-vs-streaming-api/)
>This is the essential difference between the *two APIs*. *Search* goes back in time and *streaming* goes forward. When you first decide to collect tweets on a subject, you have nothing to start with. The search API is best used then to fill in the past 7 days for your subject matter. This is often called back-filling. With a database caught up to the present moment, you can then turn on the streaming API and capture all tweets going forward.

 ---------------------
 
* **Getstream** - you can get Streaming data in two ways.

	 `stream = new Getstream();` //if you need non-stop streamin
	 
	 `stream = new Getstream(num); `//set max tweets you want to get
	 
	
	 `search()`fn takes *two parameters* : location, keywords(w/o parameters it will sample )
	* keywords - you can get tweets contain given search terms
			
			String terms[] = {"google",...};
	* location - you can narrow down the result with given location




* **Tweet**
	 
	each Tweet obj contains usernaem, msg, geocode, date.
	
	



