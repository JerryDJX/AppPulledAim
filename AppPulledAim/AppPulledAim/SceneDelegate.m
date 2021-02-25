//
//  SceneDelegate.m
//  AppPulledAim
//
//  Created by DJX on 2021/2/23.
//

#import "SceneDelegate.h"
#import "NSString+UrlEncode.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

-(void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0)){
    NSURL *url = URLContexts.allObjects.firstObject.URL;
    UISceneOpenURLOptions *options = URLContexts.allObjects.firstObject.options;//得出这是从AppMailing跳过来的
    if ([options.sourceApplication isEqualToString:@"cn.people.AppMailing"]) {
        if ([url.host isEqualToString:@"canshu"]) {
            NSLog(@"%@",url.query);
            NSString *decodedValue = [url.query URLDecodedString];
            NSDictionary *dict = @{@"canshu":decodedValue};
            [[NSNotificationCenter defaultCenter]postNotificationName:@"showAppMailingCanShu" object:nil userInfo:dict];
        }
    }
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.`
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
//    NSString *openURLOptionsSourceApplicationValue = options[@"UIApplicationOpenURLOptionsSourceApplicationKey"];//得出这是从AppMailing跳过来的
//    if ([openURLOptionsSourceApplicationValue isEqualToString:@"cn.people.AppMailing"]) {
//        if ([url.host isEqualToString:@"canshu"]) {
//            NSLog(@"%@",url.query);
////            NSString *decodedValue = [url.query URLDecodedString];
//            NSDictionary *dict = @{@"canshu":url.query};
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"showAppMailingCanShu" object:nil userInfo:dict];
//        }
//    }
//    return YES;
//}

@end
