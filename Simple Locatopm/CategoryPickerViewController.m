//
//  CategoryPickerViewController.m
//  Easy Location
//
//  Created by Hicham Chourak on 25/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import "CategoryPickerViewController.h"

@interface CategoryPickerViewController ()

@end

@implementation CategoryPickerViewController {
    NSArray *categories;
    NSIndexPath *selectedIndexPath;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    categories = [NSArray arrayWithObjects:
                  @"No Category",
                  @"Apple Store",
                  @"Bar",
                  @"Bookstore",
                  @"Club",
                  @"Grocery Store",
                  @"Historic Building",
                  @"House",
                  @"Icecream Vendor",
                  @"Landmark",
                  @"Park",
                  nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *categoryName = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = categoryName;
    
    if ([categoryName isEqualToString:self.selectedCategoryName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedIndexPath = indexPath;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != selectedIndexPath.row) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:selectedIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        selectedIndexPath = indexPath;
    }
    
    NSString *categoryName = [categories objectAtIndex:indexPath.row];
    [self.delegate categoryPicker:self didPickCategory:categoryName];
}

@end
