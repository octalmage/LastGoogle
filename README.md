# LastGoogle

Mobile Substrate tweak to log songs played using the Google Play Music iOS app. 

This tweak logs songs to `/var/log/lastgoogle.log`.

### Plans 

This is still a work in progress, but I wanted to get something working as soon as possible. 

Here's what I have planned (in order): 

* Only log after 30 seconds. 
* Automatticly send to Last.fm.
* Now Playing support. 
* Heart liked tracks.

### Requirements
* A Jailbroken iPhone.
* You have to manually create the file `/var/log/lastgoogle.log` so LastGoogle can write to it.
* A way to view the log, like openssh. 

### Instructions

Log format: 

```
LastGoogle|Artist|Song|Album|Timestamp
```

You can use these logs anyway you'd like! 

For example, you can Scrobble the songs on [Last.fm](http://last.fm) using [ScrobbleLogs](https://github.com/octalmage/ScrobbleLogs).

Remember to empty the log when you're done! 

### License

MIT
