#import <substrate.h>

%hook MusicQueueManager
-(void)notifyTrackChanged
{
	%log;

	//Sleep so nowPlayingInfo can update.
    [NSThread sleepForTimeInterval:1.0f];

	NSMutableDictionary *nowPlayingInfo = MSHookIvar<NSMutableDictionary *>(self, "_nowPlayingInfo");

	NSString * title =[nowPlayingInfo valueForKey:@"title"];
	NSString * artist =[nowPlayingInfo valueForKey:@"artist"];
	NSString * album =[nowPlayingInfo valueForKey:@"albumTitle"];

	int timestamp = [[NSNumber numberWithDouble: [[NSDate date] timeIntervalSince1970]] integerValue];

	NSLog(@"LastGoogle|%@|%@|%@|%i", artist, title, album, timestamp);
	
	/*for (NSString *key in nowPlayingInfo) 
	{
    	NSLog(@"key: %@", key);
    	NSLog(@"value: %@", [nowPlayingInfo objectForKey:key]);
	}*/
	

	%orig;
}
%end
