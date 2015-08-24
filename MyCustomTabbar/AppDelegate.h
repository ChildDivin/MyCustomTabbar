//
//  AppDelegate.h
//  MyCustomTabbar
//
//  Created by Tops on 6/30/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UITabBarCustom;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navObj;
@property (nonatomic) BOOL isPopToAllView;
@property (nonatomic, retain) UITabBarCustom *objCustomTabBar;
-(void)gotoDetailApp:(int)pintTabId;

@end

