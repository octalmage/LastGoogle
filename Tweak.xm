#import <substrate.h>

%hook MusicQueueManager
-(void)notifyTrackChanged
{
	%log;
	
	NSFileHandle *aFileHandle;
	NSString *aFile;

	//Setting the file to write to.
	aFile = @"/var/log/lastgoogle.log";

	//Telling aFilehandle what file write to.
	aFileHandle = [NSFileHandle fileHandleForWritingAtPath:aFile]; 
	
	//Create file if it doesn't exist.
	if ( !aFileHandle ) 
	{
        [[NSFileManager defaultManager] createFileAtPath:aFile contents:nil attributes:nil];
		aFileHandle = [NSFileHandle fileHandleForWritingAtPath:aFile];
    }
	//Setting aFileHandle to write at the end of the file.
	[aFileHandle truncateFileAtOffset:[aFileHandle seekToEndOfFile]]; 

	//Sleep so nowPlayingInfo can update.
	[NSThread sleepForTimeInterval:1.0f];

	NSMutableDictionary *nowPlayingInfo = MSHookIvar<NSMutableDictionary *>(self, "_nowPlayingInfo");

	NSString * title =[nowPlayingInfo valueForKey:@"title"];
	NSString * artist =[nowPlayingInfo valueForKey:@"artist"];
	NSString * album =[nowPlayingInfo valueForKey:@"albumTitle"];

	int timestamp = [[NSNumber numberWithDouble: [[NSDate date] timeIntervalSince1970]] integerValue];

	//NSLog(@"LastGoogle|%@|%@|%@|%i", artist, title, album, timestamp);
	
	NSString *line = [NSString stringWithFormat:@"LastGoogle|%@|%@|%@|%i\n", artist, title, album, timestamp];
	
	[aFileHandle writeData:[line dataUsingEncoding:nil]]; //actually write the data
	
	[aFileHandle closeFile];

	
	/*for (NSString *key in nowPlayingInfo) 
	{
    	NSLog(@"key: %@", key);
    	NSLog(@"value: %@", [nowPlayingInfo objectForKey:key]);
	}*/
	

	%orig;
}
%end
