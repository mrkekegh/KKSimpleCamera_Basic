//
//  KKAppDelegate.h
//  KKSimpleCamera_Basic
//
//  Created by keke on 14-9-16.
//  Copyright (c) 2014年 keke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface KKAppDelegate : UIResponder <UIApplicationDelegate>
{
    RootViewController *rootViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
