//
//  TKLogSystem.h
//  Pods
//
//  Created by 云峰李 on 2017/8/31.
//
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKLogSystem : NSObject

/**
 根据配置信息 初始化日志系统

 @param config 配置信息 
 目前的配置 仅包括日志等级.
 默认为所有日志类型都输出
 */
+ (void)initializationWithConfig:(NSDictionary *)config;

+ (void)logWithFlag:(DDLogFlag) flag message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
