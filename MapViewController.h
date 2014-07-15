//
//  MapViewController.h
//  Easy Location
//
//  Created by Hicham Chourak on 28/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

- (IBAction)showUser;
- (IBAction)showLocations;

@end
