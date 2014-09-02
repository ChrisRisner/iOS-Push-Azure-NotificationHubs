//
//  ViewController.m
//  pushdemo
//
//  Created by Chris Risner on 5/7/14.
//  Copyright (c) 2014 msted. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblToken;
@property (strong, nonatomic) NSString *pushToken;
@property (strong, nonatomic) NSData *pushTokenData;
@property (strong, nonatomic) SBNotificationHub* hub;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.vc = self;
    
    self.hub = [[SBNotificationHub alloc] initWithConnectionString:
                @"NotificationHubListenSharedAccessSignature"
           notificationHubPath:@"NotificationHubName"];
}

-(void)setPushToken:(NSString *)token andData:(NSData *) data {
    self.pushToken = token;
    self.lblToken.text = token;
    self.pushTokenData = data;
    
}

- (IBAction)tappedRegisterWithNoTags:(id)sender {
    [self.hub registerNativeWithDeviceToken:self.pushTokenData tags:nil completion:^(NSError* error) {
        if (error != nil) {
            NSLog(@"Error registering for notifications: %@", error);
        } else {
            NSLog(@"Success registering for push with NO tags");
        }
    }];
}


- (IBAction)tappedRegisterWithTags:(id)sender {
    NSArray *tagArray =
    @[@"MyTag",
      @"AllUsers",
      @"iOSUser"
      ];
    NSSet *tagSet = [[NSSet alloc] initWithArray:tagArray];
    [self.hub registerNativeWithDeviceToken:self.pushTokenData tags:tagSet completion:^(NSError* error) {
        if (error != nil) {
            NSLog(@"Error registering for notifications: %@", error);
        } else {
            NSLog(@"Success registering for push with tags");
        }
    }];
}

- (IBAction)tappedRegisterWithTemplates:(id)sender {
    NSArray *tagArray =
                @[@"MyTag",
                  @"AllUsers",
                  @"iOSUser"
              ];
    NSSet *tagSet = [[NSSet alloc] initWithArray:tagArray];
    
    NSString *template = @"{\"aps\": {\"alert\": \"$(message)\"}}";
    
    
    [self.hub registerTemplateWithDeviceToken:self.pushTokenData name:@"messageTemplate" jsonBodyTemplate:template expiryTemplate:nil tags:tagSet completion:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Error registering for push notifications: %@", error);
        } else {
            NSLog(@"Success registering for push with template");
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
