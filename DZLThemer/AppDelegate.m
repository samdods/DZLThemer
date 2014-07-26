//
//  AppDelegate.m
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import "AppDelegate.h"
#import "DZLThemer.h"

#define Stringify(x) @#x
#define StringFromDefinedValue(x) Stringify(x)

#ifndef THEME_PLIST
#error THEME_PLIST undefined
#endif
static NSString *const ThemePlistFileName = StringFromDefinedValue(THEME_PLIST);


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [DZLThemer shared].plistFileName = ThemePlistFileName;
  return YES;
}

@end
