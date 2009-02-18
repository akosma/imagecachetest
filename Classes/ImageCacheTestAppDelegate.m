//
//  ImageCacheTestAppDelegate.m
//  ImageCacheTest
//
//  Created by Adrian on 1/28/09.
//  Copyright 2009 Adrian Kosmaczewski. All rights reserved.
//

#import "ImageCacheTestAppDelegate.h"
#import "ImageCacheTestViewController.h"
#import "ImageCache.h"

@implementation ImageCacheTestAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [[ImageCache sharedImageCache] removeAllImagesInMemory];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
