#import <substrate.h>

%hook MusicQueueManager
-(void)notifyTrackChanged
{
	%log;

	//Sleep so nowPlayingInfo can update.
    [NSThread sleepForTimeInterval:1.0f];
	NSLog(@"Hey, notifyTrackChanged!");

	NSMutableDictionary *nowPlayingInfo = MSHookIvar<NSMutableDictionary *>(self, "_nowPlayingInfo");

	NSString * title =[nowPlayingInfo valueForKey:@"title"];
	NSString * artist =[nowPlayingInfo valueForKey:@"artist"];
	NSString * album =[nowPlayingInfo valueForKey:@"albumTitle"];

	NSDate *date = [NSDate date];
	NSTimeInterval timestamp = [date timeIntervalSince1970];


	NSLog(@"LastGoogle|%@|%@|%f", artist, title, timestamp);
	//NSLog(@"Song = %@", title);

	
	/*for (NSString *key in nowPlayingInfo) 
	{
    	NSLog(@"key: %@", key);
    	NSLog(@"value: %@", [nowPlayingInfo objectForKey:key]);
	}*/
	

	%orig;
}
%end
