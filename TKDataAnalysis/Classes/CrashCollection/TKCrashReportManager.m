//
//  TKCrashReportManager.m
//  Pods
//
//  Created by 云峰李 on 2017/8/30.
//
//

#import "TKCrashReportManager.h"

static NSString* const kCrashReportLevel = @"ReportLevel";
static NSString* const kCrashReportMonitorEnable = @"ReportMonitorEnable";
static NSString* const kCrashReportMonitorTimeout = @"ReportMonitorTimeout";
static NSString* const kCrashReportChannel = @"ReportChannel";
static NSString* const kCrashViewTrackingEnable = @"Enable";
static NSString* const kCrashReportAppId = @"appId";

@implementation TKCrashReportManager

+ (void)initializationReportManager:(NSDictionary *)params
{
    NSParameterAssert(params);
    NSUInteger reportLogLevel = [params[kCrashReportLevel] unsignedIntegerValue];
    BOOL monitorEnable = [params[kCrashReportMonitorEnable] boolValue];
    CGFloat monitorTimeout = [params[kCrashReportMonitorTimeout] floatValue];
    NSString* channel = params[kCrashReportChannel];
    BOOL trackingEnable = [params[kCrashViewTrackingEnable] boolValue];
    NSString* appId = params[kCrashReportAppId];
    
    BuglyConfig* config = [[BuglyConfig alloc] init];
    config.reportLogLevel = reportLogLevel;
    config.blockMonitorEnable = monitorEnable;
    config.blockMonitorTimeout = monitorTimeout;
    config.channel = channel;
    config.viewControllerTrackingEnable = trackingEnable;
    
    [Bugly startWithAppId:appId config:config];
}

+ (void)setUserIdentifier:(NSString *)identifier
{
    NSParameterAssert(identifier);
    [Bugly setUserIdentifier:identifier];
}

+ (void)setCrashUserValue:(NSString *)value forKey:(NSString *)key
{
    [Bugly setUserValue:value forKey:key];
}

+ (void)level:(BuglyLogLevel) level logs:(NSString *)message
{
    [BuglyLog level:level logs:message];
}

@end
