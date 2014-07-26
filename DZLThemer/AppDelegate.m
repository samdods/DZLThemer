//
//  AppDelegate.m
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import "AppDelegate.h"
#import "DZLThemer.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [DZLThemer shared].plistFileName = @"LightTheme";
  return YES;
}

@end
