//
//  AppDelegate.m
//  Simple Locatopm
//
//  Created by Hicham Chourak on 24/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import "AppDelegate.h"
#import "CurrentLocationViewController.h"
#import "LocationsViewController.h"
#import "MapViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation AppDelegate

@synthesize managedObjectContext, managedObjectModel, persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:0];
    CurrentLocationViewController *currentLocationViewController = (CurrentLocationViewController *)[[navigationController viewControllers] objectAtIndex:0];
    currentLocationViewController.managedObjectContext = self.managedObjectContext;
    
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:1];
    LocationsViewController *locationsViewController = (LocationsViewController *)[[navigationController viewControllers] objectAtIndex:0];
    locationsViewController.managedObjectContext = self.managedObjectContext;
    
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:2];
    MapViewController *mapViewController = (MapViewController *)[[navigationController viewControllers] objectAtIndex:0];
    mapViewController.managedObjectContext = self.managedObjectContext;
    
    //MapViewController *mapViewController = (MapViewController *)[[tabBarController viewControllers] objectAtIndex:2];
    //mapViewController.managedObjectContext = self.managedObjectContext;
    
    // GA Setup
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
    [GAI sharedInstance].dispatchInterval = 20;
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-54104285-4"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Core Data

- (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel == nil) {
        NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"DataModel" ofType:@"momd"];
        NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
        managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return managedObjectModel;
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (NSString *)dataStorePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"DataStore.sqlite"];
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator == nil) {
        NSURL *storeURL = [NSURL fileURLWithPath:[self dataStorePath]];
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        NSError *error;
        
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            //NSLog(@"Error adding persistent store %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    return persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext == nil) {
        NSPersistentStoreCoordinator *coordinator = self.persistentStoreCoordinator;
        
        if (coordinator != nil) {
            managedObjectContext = [[NSManagedObjectContext alloc] init];
            [managedObjectContext setPersistentStoreCoordinator:coordinator];
        }
    }
    
    return managedObjectContext;
}

- (void)fatalCoreDataError:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Internal Error", nil)
                              message:NSLocalizedString(@"There was a fatal error in the app and it cannot continue.\n\nPress OK to terminate the app. Sorry for the inconvenience.", nil)
                              delegate:self
                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)theAlertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    abort();
}

@end
