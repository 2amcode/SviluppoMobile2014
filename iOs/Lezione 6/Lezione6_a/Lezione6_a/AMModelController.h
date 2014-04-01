//
//  AMModelController.h
//  Lezione6_a
//
//  Created by Andrea Maschio on 26/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMDataViewController;

@interface AMModelController : NSObject <UIPageViewControllerDataSource>

- (AMDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(AMDataViewController *)viewController;

@end
