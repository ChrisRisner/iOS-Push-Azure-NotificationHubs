//
//  ViewController.h
//  pushdemo
//
//  Created by Chris Risner on 5/7/14.
//  Copyright (c) 2014 msted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WindowsAzureMessaging/WindowsAzureMessaging.h>

@interface ViewController : UIViewController

-(void)setPushToken:(NSString *)token
            andData:(NSData *) data;

@end
