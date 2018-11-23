//
//  FSViewToImage.m
//  FSViewToImage
//
//  Created by FudonFuchina on 2018/11/22.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "FSViewToImage.h"

@implementation FSViewToImage

+ (UIImage*)imageForUIView:(nonnull UIView *)view{
    CGSize size = view.bounds.size;
    CGRect savedFrame = view.frame;
    if ([view isKindOfClass:UIScrollView.class]) {
        UIScrollView *sView = (UIScrollView *)view;
        size = CGSizeMake(sView.frame.size.width,sView.contentSize.height+ sView.contentInset.top + sView.contentInset.bottom);
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, size.width, size.height);
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:currnetContext];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    view.frame = savedFrame;
    return image;
}

@end
