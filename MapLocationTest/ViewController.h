//
//  ViewController.h
//  MapLocationTest
//
//  Created by 何松泽 on 15/12/2.
//  Copyright © 2015年 HSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    CLLocation *_location;
    
    
//    CLGeocoder *_geocoder;
//    NSString *countryStr;
//    NSString *locationStr;
//    NSString *cityStr;
}

//@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
//@property (weak, nonatomic) IBOutlet UILabel *locationLabel;


@end

