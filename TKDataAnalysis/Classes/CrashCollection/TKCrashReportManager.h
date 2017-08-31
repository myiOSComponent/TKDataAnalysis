//
//  TKCrashReportManager.h
//  Pods
//
//  Created by 云峰李 on 2017/8/30.
//
//

#import <Foundation/Foundation.h>
#import <Bugly/Bugly.h>

#define TK_CrashReport_MACRO(_level, fmt, ...) [BuglyLog level:_level tag:nil log:fmt, ##__VA_ARGS__]
#define TKRLogError(fmt, ...)   TK_CrashReport_MACRO(BuglyLogLevelError, fmt, ##__VA_ARGS__)
#define TKRLogWarn(fmt, ...)    TK_CrashReport_MACRO(BuglyLogLevelWarn,  fmt, ##__VA_ARGS__)
#define TKRLogInfo(fmt, ...)    TK_CrashReport_MACRO(BuglyLogLevelInfo, fmt, ##__VA_ARGS__)
#define TKRLogDebug(fmt, ...)   TK_CrashReport_MACRO(BuglyLogLevelDebug, fmt, ##__VA_ARGS__)
#define TKRLogVerbose(fmt, ...) TK_CrashReport_MACRO(BuglyLogLevelVerbose, fmt, ##__VA_ARGS__)

/**
 崩溃报告管理对象
 */
@interface TKCrashReportManager : NSObject

/**
 初始化报告管理对象

 @param params 管理对象配置
 */
+ (void)initializationReportManager:(NSDictionary *)params;

/**
 崩溃日志的用户标识，用来区分

 @param identifier 标识
 */
+ (void)setUserIdentifier:(NSString *)identifier;

/**
 当前崩溃时，一同传递到后台的信息

 @param value 数据
 @param key key
 */
+ (void)setCrashUserValue:(NSString *)value forKey:(NSString *)key;

+ (void)level:(BuglyLogLevel) level logs:(NSString *)message;


@end
