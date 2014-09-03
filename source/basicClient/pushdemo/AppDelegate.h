//
//  AppDelegate.h
//  pushdemo
//
//  Created by Chris Risner on 5/7/14.
//  Copyright (c) 2014 msted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
#import <WindowsAzureMessaging/WindowsAzureMessaging.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *vc;
@property (strong, nonatomic) MSClient *client;

@end
