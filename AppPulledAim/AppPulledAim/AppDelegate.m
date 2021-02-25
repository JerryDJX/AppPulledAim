//
//  AppDelegate.m
//  AppPulledAim
//
//  Created by DJX on 2021/2/23.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NSString+UrlEncode.h"

@interface AppDelegate ()
@property (nonatomic,strong) ViewController *vc;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.vc = [[ViewController alloc]init];
    self.window.rootViewController = self.vc;
    return YES;
}
 
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSString *openURLOptionsSourceApplicationValue = options[@"UIApplicationOpenURLOptionsSourceApplicationKey"];//得出这是从AppMailing跳过来的
    if ([openURLOptionsSourceApplicationValue isEqualToString:@"cn.people.AppMailing"]) {
        if ([url.host isEqualToString:@"canshu"]) {
            NSLog(@"%@",url.query);
            NSString *decodedValue = [url.query URLDecodedString];
            NSDictionary *dict = @{@"canshu":decodedValue};
            [[NSNotificationCenter defaultCenter]postNotificationName:@"showAppMailingCanShu" object:nil userInfo:dict];
        }
    }
    return YES;
}

#pragma mark - UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
