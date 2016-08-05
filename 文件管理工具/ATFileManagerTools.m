//
//  ATFileManagerTools.m
//  ATFilesDemo
//
//  Created by william on 16/7/4.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "ATFileManagerTools.h"

@implementation ATFileManagerTools

+ (NSString *)creatDocumentDirectory{
    
    //创建Document目标路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    return documentsPath;
}

+ (NSString *)creatLibraryDirectory{
    
    //创建Library目标路径
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    
    return libraryPath;
}

+ (NSString *)creatCacheDirectory{
    
    //创建Cache目标路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    return cachePath;
}

+ (NSString *)creatDocumentFileByDirectoryName:(NSString *)directoryName{
    
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //创建document目标路径,Library目录路径:NSLibraryDirectory, Cache目录路径:NSCachesDirectory
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //用directoryName创建一个目标文件
    NSString *directoryPath = [documentPath stringByAppendingPathComponent:directoryName];
    
    //在上述的路径下创建目录
    if (![fileManager fileExistsAtPath:directoryPath]) {
        
        [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return directoryPath;
}

//在指定的目录下创建具体的文件
+ (NSString *)creatFilesByFileName:(NSString *)fileName inYourDirectory:(NSString *)directoryPath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
    
    if (![fileManager fileExistsAtPath:filePath]) {
        
        //根据filename创建具体文件
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    return filePath;
}

@end
