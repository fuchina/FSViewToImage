//
//  FSViewToImage.m
//  FSViewToImage
//
//  Created by FudonFuchina on 2018/11/22.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSViewToImage.h"
#import "FSUIKit.h"
#import "FSKit.h"

@implementation FSViewToImage

+ (UIImage *)imageForUIView:(nonnull UIView *)view {
    return [FSImage imageForUIView:view];
}

+ (UIImage *)screenShot {
    UIApplication *app = [UIApplication sharedApplication];
    UIView *statusBar = [app valueForKey:@"_statusBar"];
//    NSAssert(statusBar != nil, @"获取状态栏失败");
    UIImage *image1 = [self imageForUIView:statusBar];
    UIImage *image2 = [self screenShotApple];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    imageView.image = image2;
    UIImageView *sbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, statusBar.frame.size.width, statusBar.frame.size.height)];
    sbImageView.image = image1;
    [imageView addSubview:sbImageView];
    return [self imageForUIView:imageView];
}

+ (UIImage *)screenShotApple {
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIWindowScene *ws = FSKit.currentWindowScene;
    for (UIWindow *window in ws.windows) {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            CGContextConcatCTM(context, [window transform]);
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            [[window layer] renderInContext:context];
            CGContextRestoreGState(context);
        }
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
