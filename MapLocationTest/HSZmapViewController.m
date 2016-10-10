//
//  HSZmapViewController.m
//  MapLocationTest
//
//  Created by 何松泽 on 15/12/2.
//  Copyright © 2015年 HSZ. All rights reserved.
//

#import "HSZmapViewController.h"

@implementation HSZmapViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.hidesBarsOnSwipe = YES;
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIColor blueColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"地图";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //显示原生的NavigationBar
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    
    
    [self.navigationItem setHidesBackButton:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"地图";
    
    [self initGUI];
}

#pragma mark 添加地图控件
-(void)initGUI{
//    CGRect rect=[UIScreen mainScreen].bounds;
    _mapView=[[MKMapView alloc]init];
    [self.view addSubview:_mapView];
    //设置代理
    _mapView.delegate=(id)self;
    
    //请求定位服务
    _locationManager=[[CLLocationManager alloc]init];
    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
        [_locationManager requestWhenInUseAuthorization];
    }
    
    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    _mapView.userTrackingMode=MKUserTrackingModeFollow;
    
    //设置地图类型
    _mapView.mapType=MKMapTypeStandard;
    
}


#pragma mark - 地图控件代理方法
#pragma mark 更新用户位置，只要用户改变则调用此方法（包括第一次定位到用户位置）
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    NSLog(@"%@",userLocation);
    //设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
    //    MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
    //    MKCoordinateRegion region=MKCoordinateRegionMake(userLocation.location.coordinate, span);
    //    [_mapView setRegion:region animated:true];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
}

- (IBAction)buttonPressed:(UIButton *)button
{
    NSString *customURL = @"com.hinabian.iosapp://";
    
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:customURL]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
//                                                        message:[NSString stringWithFormat:
//                                                                 @"No custom URL defined for %@", customURL]
//                                                       delegate:self cancelButtonTitle:@"Ok"
//                                              otherButtonTitles:nil];
//        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
                                                        message:[NSString stringWithFormat:
                                                                 @"No custom URL defined for %@", customURL]
                                                       delegate:self cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil]; 
        [alert show]; 
    } 
}
@end
