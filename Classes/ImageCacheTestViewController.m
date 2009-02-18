//
//  ImageCacheTestViewController.m
//  ImageCacheTest
//
//  Created by Adrian on 1/28/09.
//  Copyright 2009 Adrian Kosmaczewski. All rights reserved.
//

#import "ImageCacheTestViewController.h"
#import "UIImage+AKLoadingExtension.h"
#import "ImageCache.h"

@implementation ImageCacheTestViewController

- (void)dealloc 
{
    [super dealloc];
}

- (void)viewDidLoad 
{
    NSString *name = @"gtm.png";
    
    // Load the image
    UIImage *image = [UIImage newImageFromResource:name];
    
    // Put it in the cache
    [[ImageCache sharedImageCache] storeImage:image withKey:name];
    
    // Release the image
    [image release];
    image = nil;

    // Retrieve the image back
    UIImage *savedImage = [[ImageCache sharedImageCache] imageForKey:name];
    imageView.image = savedImage;

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

@end
