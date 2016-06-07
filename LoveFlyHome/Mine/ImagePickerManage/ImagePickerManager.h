//
//  ImagePickerManager.h
//  cueJob
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 __xue__. All rights reserved.
//
#import <Foundation/Foundation.h>

#define Root_View_Controller [[(AppDelegate *)[[UIApplication sharedApplication] delegate] window] rootViewController]

typedef enum {
    ImagePickerManagerTypePhotoLibrary,
    ImagePickerManagerTypeCamera,
    ImagePickerManagerTypeMovie
}ImagePickerManagerType;

typedef void (^ImagePickerManagerCompletionBlock)(BOOL success, id content);

@interface ImagePickerManager : NSObject <NSCopying> {
    
    ImagePickerManagerType _type; // 拍照类型
    ImagePickerManagerCompletionBlock _completionHandler;
}

#pragma mark - Singlton 单例

+ (id)shareImagePickerManager;
+ (id)allocWithZone:(struct _NSZone *)zone;
- (id)copyWithZone:(NSZone *)zone;
- (id)retain;
- (NSUInteger)retainCount;
- (oneway void)release;
- (id)autorelease;

#pragma mark - Take pictures 拍照

- (void)takePictureWithType:(ImagePickerManagerType)type completion:(ImagePickerManagerCompletionBlock)completion;

@end