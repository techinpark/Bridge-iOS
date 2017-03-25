//
//  AppDelegate.m
//  Bridge
//
//  Created by Techin Park on 2017. 3. 25..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "AppDelegate.h"


#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self registerForRemoteNotifications];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 
#pragma mark Push Services 


#pragma mark -
#pragma mark Push Services

- (void)registerForRemoteNotifications {
    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if(!error){
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
        }];
    }
    else {
        // Code for old versions
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        {
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
        else
        {
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
             (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
        }
    }
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    //  NSLog(@"My token is: %@", deviceToken);
    
    NSString* newToken = [[[NSString stringWithFormat:@"%@",deviceToken]
                           stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"DeviceToken : %@", newToken );
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:newToken forKey:@"pushToken"];
    [defaults synchronize];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

//Called when a notification is delivered to a foreground app. iOS 10
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog( @"Handle push from foreground" );
    
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground)
    {
        [self setPushData:notification.request.content.userInfo];
    }
    else if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    {
        if (nil != notification.request.content.userInfo) {
            
        }
    }
    
    
    //completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
}

//Called to let your app know which action was selected by the user for a given notification.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{
    NSLog( @"Handle push from background or closed" );
    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
    [self setPushData:response.notification.request.content.userInfo];
    completionHandler();
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    application.applicationIconBadgeNumber = 0;
    //self.textView.text = [userInfo description];
    // We can determine whether an application is launched as a result of the user tapping the action
    // button or whether the notification was delivered to the already-running application by examining
    // the application state.
    
    if (application.applicationState == UIApplicationStateActive)
    {
        // Nothing to do if applicationState is Inactive, the iOS already displayed an alert view.
        NSLog(@"User Info : %@",userInfo);
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    
    NSLog(@"Remote Notification Received: %@", userInfo);
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"message to be displayed";
    notification.applicationIconBadgeNumber = 1;
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground || [UIApplication sharedApplication].applicationState == UIApplicationStateInactive)
    {
        
    }
    else if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    {
       
    }
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    completionHandler(UIBackgroundFetchResultNewData);
    
}


#pragma mark -
#pragma mark Register Info Get / Set

-(NSString *)getPushToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"pushToken"];
}

-(void)setPushData:(NSDictionary *)userinfo {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userinfo forKey:DEFAULTS_PUSH_DATA];
    [defaults synchronize];
}

-(BOOL)isExistPushData {
    
    if (nil != [self getPushData]) {
        return YES;
    }
    
    return NO;
}

-(NSDictionary *)getPushData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:DEFAULTS_PUSH_DATA];
}




@end
