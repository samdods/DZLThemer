//
//  DZLThemer.m
//  DZLThemer
//
//  Created by Sam Dods on 26/07/2014.
//  Copyright (c) 2014 Dodzilla. All rights reserved.
//

#import "DZLThemer.h"

static NSString *const DZLThemerKeyFontName = @"fontName";
static NSString *const DZLThemerKeyFontSize = @"fontSize";
static NSString *const DZLThemerKeyLineSpacing = @"lineSpacing";
static NSString *const DZLThemerKeyColorHex = @"colorHex";
static NSString *const DZLThemerKeyBackgroundColorHex = @"bgColorHex";

@interface UIColor (DZLThemer)
+ (instancetype)colorFromHexString:(NSString *)string;
@end



@interface DZLThemer ()
@property (nonatomic, copy) NSDictionary *theme;
@end

@implementation DZLThemer

+ (instancetype)shared
{
  static DZLThemer *themer;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    themer = [DZLThemer new];
  });
  return themer;
}

- (void)setPlistFileName:(NSString *)plistFileName
{
  _plistFileName = plistFileName;
  NSURL *url = [[NSBundle mainBundle] URLForResource:plistFileName withExtension:@"plist"];
  NSAssert(url, @"Resource not found for plist file name %@", plistFileName);
  
  self.theme = [NSDictionary dictionaryWithContentsOfURL:url];
  NSAssert([self.theme isKindOfClass:NSDictionary.class], @"Failed to create dictionary from plist file name %@", plistFileName);
}

- (NSDictionary *)theme
{
  NSAssert(_theme, @"DZLThemer plist file name has not been set.");
  return _theme;
}

#pragma mark - Public Interface

+ (UIFont *)fontForKeyPath:(NSString *)keyPath
{
  NSString *fontName = [self objectAtKeyPath:keyPath forKey:DZLThemerKeyFontName];
  NSNumber *number = [self objectAtKeyPath:keyPath forKey:DZLThemerKeyFontSize];
  
  CGFloat fontSize = [number floatValue];
  
  return fontName ? [UIFont fontWithName:fontName size:fontSize] : nil;
}

+ (CGFloat)lineSpacingForKeyPath:(NSString *)keyPath
{
  NSNumber *number = [self objectAtKeyPath:keyPath forKey:DZLThemerKeyLineSpacing];
  return [number floatValue];
}

+ (UIColor *)colorForKeyPath:(NSString *)keyPath
{
  NSString *colorHex = [self objectAtKeyPath:keyPath forKey:DZLThemerKeyColorHex];
  return [UIColor colorFromHexString:colorHex];
}

+ (UIColor *)backgroundColorForKeyPath:(NSString *)keyPath
{
  NSString *colorHex = [self objectAtKeyPath:keyPath forKey:DZLThemerKeyBackgroundColorHex];
  return [UIColor colorFromHexString:colorHex];
}

#pragma mark - Private Helpers

+ (id)objectAtKeyPath:(NSString *)keyPath forKey:(NSString *)key
{
  NSDictionary *dictionary = [[DZLThemer shared].theme valueForKeyPath:keyPath];
  id obj = dictionary[key];
  NSAssert(obj, @"%@ not found for key path %@", key, keyPath);
  return obj;
}

@end



@implementation UIColor (DZLThemer)

+ (instancetype)colorFromHexString:(NSString *)string
{
  string = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
  string = [string stringByReplacingOccurrencesOfString:@"0x" withString:@""];
  
  if (string.length == 6) {
    string = [string stringByAppendingString:@"ff"];
  }
  
  NSAssert(string.length == 8, @"Hex string '%@' not supported, must be 6 or 8 hex digits", string);
  
  NSScanner *scanner = [NSScanner scannerWithString:string];
  uint32_t hexColor;
  [scanner scanHexInt:&hexColor];
  
  CGFloat red = ((hexColor & 0xFF000000) >> 24) / 255.0f;
  CGFloat green = ((hexColor & 0x00FF0000) >> 16) / 255.0f;
	CGFloat blue = ((hexColor & 0x0000FF00) >> 8) / 255.0f;
	CGFloat alpha = (hexColor & 0x000000FF) / 255.0f;
  
	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
