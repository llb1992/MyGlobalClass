//
//  ATFileManagerTools.h
//  ATFilesDemo
//
//  Created by william on 16/7/4.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//
/**
 *文件管理工具
 */

#import <Foundation/Foundation.h>

@interface ATFileManagerTools : NSObject

/**
 *创建Document目标路径(沙盒)
 */
+ (NSString *)creatDocumentDirectory;

/**
 *创建Library目标路径
 */
+ (NSString *)creatLibraryDirectory;

/**
 *创建Cache目标路径
 */
+ (NSString *)creatCacheDirectory;

/**
 *创建一个指定的目录
 */
+ (NSString *)creatDocumentFileByDirectoryName:(NSString *)directoryName;

/**
 *在指定的目录下创建具体的文件
 *注意:fileName中需将文件的格式加入
 */
+ (NSString *)creatFilesByFileName:(NSString *)fileName inYourDirectory:(NSString *)directoryPath;

@end
