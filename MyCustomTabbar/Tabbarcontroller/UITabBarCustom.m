//
//  UITabBarCustom.m
//  iOSCodeStructure
//
//  Created by Nishant
//  Copyright (c) 2013 Nishant. All rights reserved.
//

#import "UITabBarCustom.h"
#import "AppDelegate.h"
@class AppDelegate;
@interface UITabBarCustom ()
{
    UINavigationController * navController;
}
@end

@implementation UITabBarCustom
@synthesize btnTab1, btnTab2, btnTab3, btnTab4,btnTab5;
@synthesize imgTabBg;
#pragma mark - This is the main Tabbar in the Application
#pragma mark - View Life Cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    HeightTabbar=50;
    noOfTab=5;
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self addCustomElements];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideOriginalTabBar];
}
#pragma mark - Hide Original TabBar - Add Custom TabBar
- (void)hideOriginalTabBar
{
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            view.hidden = YES;
            break;
        }
    }
}
-(void)addCustomElements
{
    //Add Bg Image
    if(imgTabBg != nil)
    {
        [imgTabBg removeFromSuperview];
    }
    float y = [UIScreen mainScreen].bounds.size.height-HeightTabbar;
    float w = [UIScreen mainScreen].bounds.size.width;
    bottom_view=[[UIView alloc] initWithFrame:CGRectMake(0,y,w,HeightTabbar)];
    imgTabBg = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,w,HeightTabbar)];
    imgTabBg.backgroundColor=[UIColor redColor];

    [self.view addSubview:bottom_view];

    [bottom_view addSubview:imgTabBg];
    y_position=0;
    btn_y_position=0;
    btn_x_position=0;
    btn_width=w/noOfTab;
    btn_height=HeightTabbar;
    [self addAllElements];
}
-(void)addAllElements
{
    //Add Tab Buttons
    if(btnTab1 != nil)
        [btnTab1 removeFromSuperview];
    if (btnTab2 != nil)
        [btnTab2 removeFromSuperview];
    if(btnTab3 != nil)
        [btnTab3 removeFromSuperview];
    if (btnTab4 != nil)
        [btnTab4 removeFromSuperview];
    if (btnTab5 != nil)
        [btnTab5 removeFromSuperview];
    
    btnTab1 = [self getGeneralTabButton:0 isSelected:true];
    btnTab2 = [self getGeneralTabButton:1 isSelected:false];
    btnTab3 = [self getGeneralTabButton:2 isSelected:false];
    btnTab4 = [self getGeneralTabButton:3 isSelected:false];
    btnTab5 = [self getGeneralTabButton:4 isSelected:false];
    
    [bottom_view addSubview:btnTab1];
    [bottom_view addSubview:btnTab2];
    [bottom_view addSubview:btnTab3];
    [bottom_view addSubview:btnTab4];
    [bottom_view addSubview:btnTab5];
    
    // Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
    [btnTab1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [btnTab2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [btnTab3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [btnTab4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [btnTab5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
}

-(UIButton *)getGeneralTabButton:(int)pintTag isSelected:(BOOL)pbolIsSelected
{
    UIImage *btnImage;
    UIImage *btnImageSelected;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:RGB(249, 227, 110) forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
    
    [btn setTag:pintTag];
    [btn setSelected:pbolIsSelected];
    
    switch (pintTag) {
        case 0:	//Tab-1
            btnImage = [UIImage imageNamed:@"home.png"];
            btnImageSelected = [UIImage imageNamed:@"selected_home.png"];
            btn.frame = CGRectMake(btn_x_position,btn_y_position, btn_width, btn_height);
            [btn setTitle:@"home" forState:UIControlStateNormal];
            btn.backgroundColor=[UIColor blueColor];
            break;
        case 1:	//Tab-2
            btnImage = [UIImage imageNamed:@"schedule.png"];
            btnImageSelected = [UIImage imageNamed:@"selected_schedule.png"];
            btn.frame = CGRectMake(btn_x_position+btn_width, btn_y_position, btn_width, btn_height);
            [btn setTitle:@"schedule" forState:UIControlStateNormal];
            btn.backgroundColor=[UIColor greenColor];
            break;
        case 2:	//Tab-3
            btnImage = [UIImage imageNamed:@"urbantv.png"];
            btnImageSelected = [UIImage imageNamed:@"urbantv.png"];
            btn.frame = CGRectMake(btn_x_position+(btn_width*2), btn_y_position, btn_width, btn_height);
            btn.backgroundColor=RGB(249, 227, 110); //yellow
            [btn setTitle:@"urbantv" forState:UIControlStateNormal];
            [btn setTitleColor:RGB(62,40,97) forState:UIControlStateSelected]; //purpal
            //[btn setTitleColor:RGB(62,40,97) forState:UIControlStateNormal];
            break;
        case 3:	//Tab-4
            btnImage = [UIImage imageNamed:@"news.png"];
            btnImageSelected = [UIImage imageNamed:@"selected_news.png"];
            btn.frame = CGRectMake(btn_x_position+(btn_width*3), btn_y_position, btn_width, btn_height);
            [btn setTitle:@"news" forState:UIControlStateNormal];
            btn.backgroundColor=[UIColor purpleColor];
            break;
        default://Tab-1
            btnImage = [UIImage imageNamed:@"share.png"];
            btnImageSelected = [UIImage imageNamed:@"selected_share.png"];
            btn.frame = CGRectMake(btn_x_position+(btn_width*4), btn_y_position, btn_width, btn_height);
            [btn setTitle:@"share" forState:UIControlStateNormal];
            btn.backgroundColor=[UIColor orangeColor];
            break;
    }
    
    [btn setImage:btnImage forState:UIControlStateNormal];
    [btn setImage:btnImageSelected forState:UIControlStateSelected];
    btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.imageView.frame.size.height,btn.frame.size.width/2-(btn.imageView.frame.size.width/2),0,0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0,-15,-btn.titleLabel.frame.size.height*2,0);
    btn.titleLabel.textAlignment=NSTextAlignmentCenter;
    return btn;
}

#pragma mark - Select Tab
- (void)buttonClicked:(id)sender
{
    int tagNum =(int)[sender tag];
    [self selectTab:tagNum];
}
- (void)selectTab:(int)tabID
{
    switch(tabID)
    {
        case 0:
            [btnTab1 setSelected:true];
            [btnTab2 setSelected:false];
            [btnTab3 setSelected:false];
            [btnTab4 setSelected:false];
            [btnTab5 setSelected:false];
            break;
        case 1:
            [btnTab1 setSelected:false];
            [btnTab2 setSelected:true];
            [btnTab3 setSelected:false];
            [btnTab4 setSelected:false];
            [btnTab5 setSelected:false];
            break;
        case 2:
            [btnTab1 setSelected:false];
            [btnTab2 setSelected:false];
            [btnTab3 setSelected:true];
            [btnTab4 setSelected:false];
            [btnTab5 setSelected:false];
            break;
        case 3:
            [btnTab1 setSelected:false];
            [btnTab2 setSelected:false];
            [btnTab3 setSelected:false];
            [btnTab4 setSelected:true];
            [btnTab5 setSelected:false];
            break;
        case 4:
            [btnTab1 setSelected:false];
            [btnTab2 setSelected:false];
            [btnTab3 setSelected:false];
            [btnTab4 setSelected:false];
            [btnTab5 setSelected:true];
            break;
    }
    self.selectedIndex = tabID;
    if (self.selectedIndex == tabID)
    {
        if (appDelegate.isPopToAllView==FALSE){
            navController = (UINavigationController *)[self selectedViewController];
            [navController popToRootViewControllerAnimated:YES];
        }
        else{
            navController = (UINavigationController *)[self selectedViewController];
            [navController popToRootViewControllerAnimated:YES];
        }
    }else{
        self.selectedIndex = tabID;
    }
}
#pragma mark - Show/Hide TabBar
- (void)showTabBar
{
    self.imgTabBg.hidden = NO;
    self.btnTab1.hidden = NO;
    self.btnTab2.hidden = NO;
    self.btnTab3.hidden = NO;
    self.btnTab4.hidden = NO;
    self.btnTab5.hidden = NO;
    self.btnTab1.userInteractionEnabled=YES;
    self.btnTab2.userInteractionEnabled=YES;
    self.btnTab3.userInteractionEnabled=YES;
    self.btnTab4.userInteractionEnabled=YES;
    self.btnTab5.userInteractionEnabled=YES;
}
- (void)hideTabBar
{
    self.imgTabBg.hidden = YES;
    self.btnTab1.hidden = YES;
    self.btnTab2.hidden = YES;
    self.btnTab3.hidden = YES;
    self.btnTab4.hidden = YES;
    self.btnTab5.hidden = YES;
    self.btnTab1.userInteractionEnabled=NO;
    self.btnTab2.userInteractionEnabled=NO;
    self.btnTab3.userInteractionEnabled=NO;
    self.btnTab4.userInteractionEnabled=NO;
    self.btnTab5.userInteractionEnabled=NO;
}
#pragma mark -Load Nib
- (id)loadViewNib:(NSString *)nibName {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    if([nibs count] > 0) {
        return [nibs objectAtIndex:0];
    }
    return nil;
}
#pragma mark- player delegate method
-(void)pushSettingView
{

}
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqual:@"outputVolume"]) {
        NSLog(@"volume changed!");

    }
    
}
@end
