//
//  DZLThemer.h
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZLThemer : NSObject

+ (instancetype)shared;

@property (nonatomic, copy) NSString *plistFileName;

+ (UIFont *)fontForKeyPath:(NSString *)keyPath;

+ (CGFloat)lineSpacingForKeyPath:(NSString *)keyPath;

+ (UIColor *)colorForKeyPath:(NSString *)keyPath;

+ (UIColor *)backgroundColorForKeyPath:(NSString *)keyPath;

@end
