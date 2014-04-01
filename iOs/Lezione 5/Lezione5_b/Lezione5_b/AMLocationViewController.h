//
//  AMFirstViewController.h
//  Lezione5_b
//
//  Created by Andrea Maschio on 24/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface AMLocationViewController : UIViewController<CLLocationManagerDelegate>
{
  CLLocationManager *locationManager;
    
    __weak IBOutlet MKMapView *mapView;
}
@end
