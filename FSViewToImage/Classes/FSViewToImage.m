//
//  FSViewToImage.m
//  FSViewToImage
//
//  Created by FudonFuchina on 2018/11/22.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSViewToImage.h"

@implementation FSViewToImage

+ (UIImage*)imageForUIView:(UIView*)view{
    //    UIGraphicsBeginImageContext(view.bounds.size);// 只会生成屏幕所见的部分
    CGSize size = view.bounds.size;
    if ([view isKindOfClass:UIScrollView.class]) {
        UIScrollView *sView = (UIScrollView *)view;
        size = CGSizeMake(sView.frame.size.width,sView.contentSize.height+ sView.contentInset.top+ sView.contentInset.bottom);
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:currnetContext];
    //    CGContextRestoreGState(currnetContext);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)captureScrollView:(UIScrollView *)scrollView{
    NSAssert([scrollView isKindOfClass:UIScrollView.class] == YES, @"scrollView必须是UIScrollView");
    if (![scrollView isKindOfClass:UIScrollView.class]) {
        return nil;
    }
    CGRect frame = scrollView.frame;
    scrollView.frame = CGRectMake(0, scrollView.frame.origin.y, scrollView.contentSize.width, scrollView.contentSize.height);
    
    //设置截屏大小(截屏区域的大小必须要跟视图控件的大小一样)
    UIGraphicsBeginImageContextWithOptions(scrollView.frame.size, YES, 0.0);
    [[scrollView layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    scrollView.frame = frame;
    return viewImage;
}

@end
