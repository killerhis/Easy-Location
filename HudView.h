//
//  HudView.h
//  Easy Location
//
//  Created by Hicham Chourak on 26/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HudView : UIView

+ (HudView *)hudInView:(UIView *)view animated:(BOOL)animated;

@property (nonatomic, strong) NSString *text;

@end
