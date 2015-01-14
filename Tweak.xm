#import <substrate.h>

%hook MusicQueueManager
-(void)notifyTrackChanged
{
	%log;

	NSLog(@"Hey, notifyTrackChanged!");

	//NSString *currentTrack = [self currentTrack];
	//NSLog(@"Value of currentTrack = %@", currentTrack);

	NSMutableDictionary *nowPlayingInfo = MSHookIvar<NSMutableDictionary *>(self, "_nowPlayingInfo");

	NSString * title =[nowPlayingInfo valueForKey:@"title"];
	NSString * artist =[nowPlayingInfo valueForKey:@"artist"];

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
