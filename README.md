# LastGoogle

Mobile Substrate tweak to log songs played using the Google Play Music iOS app. 

This tweak logs songs played using NSLog. 

## Requirements

* syslogd to /var/log/syslog (from Cydia).
* A way to view the log, like openssh. 

## Instructions

You can use grep to find the logged songs: 

```
grep "PlayMusic.*LastGoogle|" /var/log/syslog
```

Example output: 

```
Jan 14 02:18:47 Jasons-iPhone PlayMusic[787]: LastGoogle|Digitalism|Just Gazin'|I Love You, Dude|1421223527
Jan 14 02:22:19 Jasons-iPhone PlayMusic[787]: LastGoogle|Digitalism|Miami Showdown|I Love You, Dude|1421223739
Jan 14 02:25:44 Jasons-iPhone PlayMusic[787]: LastGoogle|Digitalism|Encore|I Love You, Dude|1421223944
Jan 14 02:30:03 Jasons-iPhone PlayMusic[787]: LastGoogle|Digitalism|Harrison Fjord|I Love You, Dude|1421224203
Jan 14 02:36:15 Jasons-iPhone PlayMusic[787]: LastGoogle|Digitalism|Stratosphere|I Love You, Dude|1421224575
```

Log format: 

```
LastGoogle|Artist|Song|Album|Timestamp
```

You can then use these logs anyway you'd like! 

For example, you can Scrobble the songs on [Last.fm](http://last.fm) using [ScrobbleLogs](https://github.com/octalmage/ScrobbleLogs).
