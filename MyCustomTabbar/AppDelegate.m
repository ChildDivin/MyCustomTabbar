//
//  AppDelegate.m
//  MyCustomTabbar
//
//  Created by Tops on 6/30/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "AppDelegate.h"
#import "UITabBarCustom.h"
#import "HomeVC.h"
#import "NewVC.h"
#import "ScheduleVC.h"
#import "UrbantvVC.h"
#import "ShareVC.h"
@interface AppDelegate ()
{
    HomeVC *homeObj;
    NewVC *newObj;
    ScheduleVC *scheduleObj;
    UrbantvVC *urbanObj;
    ShareVC *shareObj;
}
@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];//
    [self gotoDetailApp:0];
    self.navObj =[[UINavigationController alloc] initWithRootViewController:self.objCustomTabBar];
    self.window.rootViewController=self.navObj;
    self.navObj.navigationBarHidden=YES;
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}
#pragma mark-Cutom tab bar
-(void)gotoDetailApp:(int)pintTabId{
    [self setTabBar];
    self.objCustomTabBar.delegate=self;
    //  [self.navController pushViewController:self.objCustomTabBar animated:YES];
    [self.objCustomTabBar setSelectedIndex:pintTabId];
    [self.objCustomTabBar selectTab:pintTabId];
}
-(void)setTabBar
{
    //Note: Use this method and respective variables when there is TabBar in the app.
    self.objCustomTabBar=[[UITabBarCustom alloc]init];
    // first
    homeObj =[[HomeVC alloc] initWithNibName:@"HomeVC" bundle:Nil];
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:homeObj];
    
    //second
    scheduleObj = [[ScheduleVC alloc] initWithNibName:@"ScheduleVC" bundle:Nil];
    UINavigationController *navSche = [[UINavigationController alloc] initWithRootViewController:scheduleObj];
    
    //Thard
    urbanObj = [[UrbantvVC alloc] initWithNibName:@"UrbantvVC" bundle:Nil];
    UINavigationController *navUrban =[[UINavigationController alloc] initWithRootViewController:urbanObj];
    
    //forth
    newObj = [[NewVC alloc] initWithNibName:@"NewVC" bundle:Nil];
    UINavigationController *navNew=[[UINavigationController alloc] initWithRootViewController:newObj];
    //fifth
    shareObj = [[ShareVC alloc] initWithNibName:@"ShareVC" bundle:Nil];
    UINavigationController *navShare =[[UINavigationController alloc] initWithRootViewController:shareObj];
    //    viewObj = [[ViewController alloc] initWithNibName:@"ViewController" bundle:Nil];
    //    UINavigationController *navView =[[UINavigationController alloc] initWithRootViewController:viewObj];
    
    self.objCustomTabBar.viewControllers =@[navHome,navSche,navUrban,navNew,navShare];
    
    [navHome setNavigationBarHidden:TRUE];
    [navNew setNavigationBarHidden:TRUE];
    [navSche setNavigationBarHidden:TRUE];
    [navShare setNavigationBarHidden:TRUE];
    [navUrban setNavigationBarHidden:TRUE];
    
}
@end
