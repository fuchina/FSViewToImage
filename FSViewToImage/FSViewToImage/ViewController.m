//
//  ViewController.m
//  FSViewToImage
//
//  Created by fudongdong on 2018/11/22.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "ViewController.h"
#import "FSViewToImage.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIScrollView    *_scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(10, 100, UIScreen.mainScreen.bounds.size.width - 20, 40)];
    v.backgroundColor = UIColor.redColor;
    [self.view addSubview:v];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [v addGestureRecognizer:tap];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 140)];
    scrollView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 2000, scrollView.frame.size.width, 50)];
    greenView.backgroundColor = UIColor.greenColor;
    [scrollView addSubview:greenView];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 2150);
}

- (void)click{
    UIImage *image = [FSViewToImage imageForUIView:_scrollView];
    if (image) {
        NSData *data = UIImagePNGRepresentation(image);
        NSString *png = [[NSString alloc] initWithFormat:@"/Users/fudongdong/Desktop/FSViewToImageTest/%@*%@_vti.png",@(image.size.width),@(image.size.height)];
        BOOL success = [data writeToFile:png atomically:YES];
        if (!success) {
            NSLog(@"写入桌面失败");
        }
    }
}


@end
