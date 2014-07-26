//
//  UIView+DZLThemer.m
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import "UIView+DZLThemer.h"
#import "DZLThemer.h"

@implementation UIView (DZLThemer)

- (void)setThemeBackground:(NSString *)keyPath
{
  self.backgroundColor = [DZLThemer backgroundColorForKeyPath:keyPath];
}

@end
