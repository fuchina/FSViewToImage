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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(10, 100, UIScreen.mainScreen.bounds.size.width - 20, 40)];
    v.backgroundColor = UIColor.redColor;
    [self.view addSubview:v];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [v addGestureRecognizer:tap];
}

- (void)click{
    UIImage *image = [FSViewToImage imageForUIView:self.view];
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
