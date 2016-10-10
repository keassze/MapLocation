//
//  HSZmapViewController.h
//  MapLocationTest
//
//  Created by 何松泽 on 15/12/2.
//  Copyright © 2015年 HSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HSZmapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic)CLLocationManager *locationManager;

- (IBAction)buttonPressed:(UIButton *)sender;
@end
