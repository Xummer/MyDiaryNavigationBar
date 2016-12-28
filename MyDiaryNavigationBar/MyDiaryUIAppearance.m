//
//  MyDiaryUIAppearance.m
//  MyDiaryNavigationBar
//
//  Created by Xummer on 2016/12/28.
//  Copyright © 2016年 Xummer. All rights reserved.
//

#import "MyDiaryUIAppearance.h"
#import <UIKit/UIKit.h>

@implementation MyDiaryUIAppearance

+ (void)customAppearance {
    UIApplication.sharedApplication.delegate.window.tintColor = MAIN_TINTCOLOR;
    [[self class] customNavigationBar];
}

+ (void)customNavigationBar {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.tintColor = MAIN_TINTCOLOR;
    navigationBar.titleTextAttributes =
    @{ NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       NSForegroundColorAttributeName:MAIN_TINTCOLOR
       };
}

@end
