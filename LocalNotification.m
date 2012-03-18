//
//  LocalNotification.m
//
//  Created by Luke Young (innoying) on 3/18/2012.
// 	Inspiration from original plugin from Greg Allen
//  Copyright 2012 innoying.com
//  Released under MIT license
//

#import "LocalNotification.h"

@implementation LocalNotification
- (void)addNotification:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {

    //Extract the options
	double timestamp = [[options objectForKey:@"date"] doubleValue];
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
	NSString *message = [options objectForKey:@"message"];
	NSString *action = [options objectForKey:@"action"];
	NSString *notificationId = [options objectForKey:@"id"];
    NSString *sound = [options objectForKey:@"sound"];
    NSString *background = [options objectForKey:@"background"];
    NSString *foreground = [options objectForKey:@"foreground"];
    NSString *repeat = [options objectForKey:@"repeat"];
	NSInteger badge = [[options objectForKey:@"badge"] intValue];
	bool hasAction = ([[options objectForKey:@"hasAction"] intValue] == 1)?YES:NO;
	
	//Init the notification
	UILocalNotification *notification = [[UILocalNotification alloc] init];
	//Setup the fire date
	notification.fireDate = date;
	//If it has an action setup
	notification.hasAction = hasAction;
	//Set the action
	notif.alertAction = action;
	//Default Time-zone
	notification.timeZone = [NSTimeZone defaultTimeZone];
	//Never Repeat
    notification.repeatInterval = 0;
	//Set the message
	notif.alertBody = message;
	//Setup the sound to play
    notif.soundName = sound;
    //Zero out the Icon badge number
    notif.applicationIconBadgeNumber = 0;
	
	//Setup the userdictionary
	NSDictionary *userDict = [NSDictionary dictionaryWithObjectsAndKeys:notificationId,@"notificationId",background,@"background",foreground,@"forground",nil];
    
    //Set the userInfo to userDictionary
    notif.userInfo = userDict;
	
	//Schedule the notifcation
	[[UIApplication sharedApplication] scheduleLocalNotification:notif];
	
	//Release the notification
	//[notif release];
}

- (void)cancelNotification:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
	NSString *requestedId = [arguments objectAtIndex:0];
	NSArray *scheduledNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
	for (UILocalNotification *notification in scheduledNotifications) {
		NSString *id = [notification.userInfo objectForKey:@"notificationId"];
		if ([requestedId isEqualToString:id]) {
			[[UIApplication sharedApplication] cancelLocalNotification:notification];
		}
	}
}

- (void)cancelAllNotifications:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
}



@end