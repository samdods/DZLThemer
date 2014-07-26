//
//  UILabel+DZLThemer.m
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import "UILabel+DZLThemer.h"
#import <objc/runtime.h>
#import "DZLThemer.h"

@implementation UILabel (DZLThemer)

- (void)setThemeText:(NSString *)keyPath
{
  self.font = [DZLThemer fontForKeyPath:keyPath];
  self.textColor = [DZLThemer colorForKeyPath:keyPath];
  CGFloat lineSpacing = [DZLThemer lineSpacingForKeyPath:keyPath];
  objc_setAssociatedObject(self, @selector(themeLineSpacing), @(lineSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)themeLineSpacing
{
  return [objc_getAssociatedObject(self, _cmd) floatValue];
}

@end
