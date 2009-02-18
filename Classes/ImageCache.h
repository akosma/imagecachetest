//
//  ImageCache.h
//  ImageCacheTest
//
//  Created by Adrian on 1/28/09.
//  Copyright 2009 Adrian Kosmaczewski. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MEMORY_CACHE_SIZE 20
#define CACHE_FOLDER_NAME @"ImageCacheFolder"

// 10 days in seconds
#define IMAGE_FILE_LIFETIME 864000.0

@interface ImageCache : NSObject 
{
@private
    NSMutableArray *keyArray;
    NSMutableDictionary *memoryCache;
    NSFileManager *fileManager;
}

+ (ImageCache *)sharedImageCache;

- (UIImage *)imageForKey:(NSString *)key;

- (BOOL)hasImageWithKey:(NSString *)key;

- (void)storeImage:(UIImage *)image withKey:(NSString *)key;

- (BOOL)imageExistsInMemory:(NSString *)key;

- (BOOL)imageExistsInDisk:(NSString *)key;

- (NSUInteger)countImagesInMemory;

- (NSUInteger)countImagesInDisk;

- (void)removeImageWithKey:(NSString *)key;

- (void)removeAllImages;

- (void)removeAllImagesInMemory;

- (void)removeOldImages;

@end
