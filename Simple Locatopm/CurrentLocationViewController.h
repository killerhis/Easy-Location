//
//  FirstViewController.h
//  Simple Locatopm
//
//  Created by Hicham Chourak on 24/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentLocationViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet UILabel *messageLabel;
@property (nonatomic, strong) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, strong) IBOutlet UILabel *longitudeLabel;
@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UIButton *tagButton;
@property (nonatomic, strong) IBOutlet UIButton *getButton;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) IBOutlet UILabel *latitudeTextLabel;
@property (nonatomic, strong) IBOutlet UILabel *longitudeTextLabel;
@property (nonatomic, strong) IBOutlet UIView *panelView;

- (IBAction)getLocation:(id)sender;

@end
