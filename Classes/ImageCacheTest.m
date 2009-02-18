//
//  ImageCacheTest.m
//  ImageCacheTest
//
//  Created by Adrian on 1/28/09.
//  Copyright 2009 Adrian Kosmaczewski. All rights reserved.
//

#import "ImageCacheTest.h"
#import "ImageCache.h"
#import "UIImage+AKLoadingExtension.h"

@implementation ImageCacheTest

- (void)setUp
{
    cache = [ImageCache sharedImageCache];
    [cache removeAllImages];
}

- (void)tearDown
{
    cache = nil;
}

- (void)testCanStoreImages
{
    NSString *imageName = @"gtm.png";
    UIImage *image = [UIImage newImageFromResource:imageName];
    [cache storeImage:image withKey:imageName];
    STAssertTrue([cache hasImageWithKey:imageName], @"Image %@ does not exist in the cache", imageName);
    STAssertTrue([cache imageExistsInMemory:imageName], @"Image %@ does not exist in memory", imageName);
    STAssertTrue([cache imageExistsInDisk:imageName], @"Image %@ does not exist in disk", imageName);
    int diskCount = [cache countImagesInDisk];
    int memoryCount = [cache countImagesInMemory];
    STAssertEquals(1, diskCount, @"Number of images in disk: expected 1, had %d", diskCount);
    STAssertEquals(1, memoryCount, @"Number of images in memory: expected 1, had %d", memoryCount);
}

- (void)testCanRetrieveImages
{
    NSString *imageName = @"gtm.png";
    UIImage *image = [UIImage newImageFromResource:imageName];
    [cache storeImage:image withKey:imageName];
    UIImage *retrievedImage = [cache imageForKey:imageName];
    STAssertNotNil(retrievedImage, @"The retrieved image must not be nil: %@", imageName);    
}

- (void)testCanFlushImagesFromMemoryButNotDisk
{
    NSString *imageName = @"gtm.png";
    UIImage *image = [UIImage newImageFromResource:imageName];
    [cache storeImage:image withKey:imageName];

    int diskCount = [cache countImagesInDisk];
    int memoryCount = [cache countImagesInMemory];
    STAssertEquals(1, diskCount, @"Number of images in disk: expected 1, had %d", diskCount);
    STAssertEquals(1, memoryCount, @"Number of images in memory: expected 1, had %d", memoryCount);

    [cache removeAllImagesInMemory];

    diskCount = [cache countImagesInDisk];
    memoryCount = [cache countImagesInMemory];
    STAssertEquals(1, diskCount, @"Number of images in disk: expected 1, had %d", diskCount);
    STAssertEquals(0, memoryCount, @"Number of images in memory: expected 1, had %d", memoryCount);
    
    UIImage *retrievedImage = [cache imageForKey:imageName];
    STAssertNotNil(retrievedImage, @"The retrieved image must not be nil: %@", imageName);    
}

- (void)testHasOnlyMaximumNumberOfImagesInMemory
{
    NSArray *images = [[NSArray alloc] initWithObjects:@"gtm copy 1.png", @"gtm copy 2.png",
                       @"gtm copy 3.png", @"gtm copy 4.png",
                       @"gtm copy 5.png", @"gtm copy 6.png",
                       @"gtm copy 7.png", @"gtm copy 8.png",
                       @"gtm copy 9.png", @"gtm copy 10.png",
                       @"gtm copy 11.png", @"gtm copy 12.png",
                       @"gtm copy 13.png", @"gtm copy 14.png",
                       @"gtm copy 15.png", @"gtm copy 16.png",
                       @"gtm copy 17.png", @"gtm copy 18.png",
                       @"gtm copy 19.png", @"gtm copy 20.png", 
                       @"gtm copy 21.png", @"gtm copy 22.png", nil];
    
    int count = [images count];
    STAssertGreaterThan(count, MEMORY_CACHE_SIZE, @"There should be more than %d images in the array, there are %d", MEMORY_CACHE_SIZE, count);
    
    for (NSString *imageName in images)
    {
        UIImage *image = [UIImage newImageFromResource:imageName];
        [cache storeImage:image withKey:imageName];
        count = [cache countImagesInMemory];
        STAssertLessThanOrEqual(count, MEMORY_CACHE_SIZE, @"There should be less than %d images in memory, there are %d", MEMORY_CACHE_SIZE, count);
    }
}

- (void)testCanFlushCacheCompletely
{
    NSString *imageName = @"gtm.png";
    UIImage *image = [UIImage newImageFromResource:imageName];
    [cache storeImage:image withKey:imageName];
    
    int diskCount = [cache countImagesInDisk];
    int memoryCount = [cache countImagesInMemory];
    STAssertEquals(1, diskCount, @"Number of images in disk: expected 1, had %d", diskCount);
    STAssertEquals(1, memoryCount, @"Number of images in memory: expected 1, had %d", memoryCount);
    
    [cache removeAllImages];
    
    diskCount = [cache countImagesInDisk];
    memoryCount = [cache countImagesInMemory];
    STAssertEquals(0, diskCount, @"Number of images in disk: expected 1, had %d", diskCount);
    STAssertEquals(0, memoryCount, @"Number of images in memory: expected 1, had %d", memoryCount);    
}

@end
