//
//  ImageCacheTest.h
//  ImageCacheTest
//
//  Created by Adrian on 1/28/09.
//  Copyright 2009 Adrian Kosmaczewski. All rights reserved.
//

#import "GTMSenTestCase.h"

@class ImageCache;

@interface ImageCacheTest : SenTestCase 
{
    ImageCache *cache;
}

- (void)testCanStoreImages;

- (void)testCanRetrieveImages;

- (void)testCanFlushImagesFromMemoryButNotDisk;

- (void)testHasOnlyMaximumNumberOfImagesInMemory;

- (void)testCanFlushCacheCompletely;

@end
