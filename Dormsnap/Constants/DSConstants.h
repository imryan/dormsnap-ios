//
//  DSConstants.h
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DSConstants : NSObject

extern NSString *const DSFontNameExtraLight;
extern NSString *const DSFontNameLight;
extern NSString *const DSFontNameRegular;
extern NSString *const DSFontNameMedium;
extern NSString *const DSFontNameSemiBold;
extern NSString *const DSFontNameBold;
extern NSString *const DSFontNameExtraBold;

+ (UIColor *)defaultGreenColor;
+ (UIColor *)defaultGrayColor;

+ (UIFont *)navigationBarFont;
+ (UIFont *)defaultFontWithSize:(CGFloat)size;

+ (NSAttributedString *)postLocationString:(NSString *)location;
+ (NSAttributedString *)postLikesString:(NSUInteger)likes;

+ (UIImage *)tabBarFeedImage;

@end
