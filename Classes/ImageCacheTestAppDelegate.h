//
//  ImageCacheTestAppDelegate.h
//  ImageCacheTest
//
//  Created by Adrian on 1/28/09.
//  Copyright 2009 Adrian Kosmaczewski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageCacheTestViewController;

@interface ImageCacheTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageCacheTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImageCacheTestViewController *viewController;

@end

