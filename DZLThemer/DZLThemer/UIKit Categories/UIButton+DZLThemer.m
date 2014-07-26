//
//  UIButton+DZLThemer.m
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import "UIButton+DZLThemer.h"
#import "DZLThemer.h"

@implementation UIButton (DZLThemer)

- (void)setThemeText:(NSString *)keyPath
{
  self.titleLabel.font = [DZLThemer fontForKeyPath:keyPath];
  [self setTitleColor:[DZLThemer colorForKeyPath:keyPath] forState:UIControlStateNormal];
}

@end
