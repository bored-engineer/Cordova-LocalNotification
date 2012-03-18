//
//  LocalNotification.h
//
//  Created by Luke Young (innoying) on 3/18/2012.
// 	Inspiration from original plugin from Greg Allen
//  Copyright 2012 innoying.com
//  Released under MIT license
//

#import <Foundation/Foundation.h>

#ifdef CORDOVA_FRAMEWORK
#import <Cordova/CDVPlugin.h>
#else
#import "CDVPlugin.h"
#endif

@interface LocalNotification : CDVPlugin {
}

- (void)addNotification:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)cancelNotification:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)cancelAllNotifications:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end