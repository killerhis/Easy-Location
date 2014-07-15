//
//  CategoryPickerViewController.h
//  Easy Location
//
//  Created by Hicham Chourak on 25/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryPickerViewController;

@protocol CategoryPickerViewControllerDelegate <NSObject>

- (void)categoryPicker:(CategoryPickerViewController *)picker didPickCategory:(NSString *)categoryName;

@end

@interface CategoryPickerViewController : UITableViewController

@property (nonatomic, weak) id <CategoryPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *selectedCategoryName;

@end
