//
//  AppDelegate.m
//  MyDiaryNavigationBar
//
//  Created by Xummer on 2016/12/28.
//  Copyright © 2016年 Xummer. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MyDiaryUIAppearance.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [MyDiaryUIAppearance customAppearance];
    
    ViewController *vCtrl = [[ViewController alloc] init];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vCtrl];
    self.window.rootViewController = navCtrl;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
