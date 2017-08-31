//
//  TKTargetDataAnalysis.m
//  Pods
//
//  Created by 云峰李 on 2017/8/31.
//
//

#import "TKTargetDataAnalysis.h"
#import "TKCrashReportManager.h"
#import "TKLogSystem.h"

static NSString* const kUserIdentifier = @"Identifier";
static NSString* const kUserValue = @"userValue";
static NSString* const kUserKey = @"userKey";

static NSString* const kLogFlag = @"logFlag";
static NSString* const kLogMessage = @"logMessage";

@implementation TKTargetDataAnalysis

- (void)tkAction_initReportManager:(NSDictionary *)params
{
    NSParameterAssert(params);
    [TKCrashReportManager initializationReportManager:params];
}

- (void)tkAction_setUserIdentifier:(NSDictionary *)params
{
    NSParameterAssert(params);
    [TKCrashReportManager setUserIdentifier:params[kUserIdentifier]];
}

- (void)tkAction_setUserValueWithKey:(NSDictionary *)params
{
    NSParameterAssert(params);
    [TKCrashReportManager setCrashUserValue:params[kUserValue]
                                     forKey:params[kUserKey]];
}

- (void)tkAction_initLogWithConfig:(NSDictionary *)config
{
    [TKLogSystem initializationWithConfig:config];
}

- (void)tkAction_logWithFlagAndMessage:(NSDictionary *)params
{
    NSParameterAssert(params);
    DDLogFlag flag = [params[kLogFlag] unsignedIntegerValue];
    NSString* message = params[kLogMessage];
    [TKLogSystem logWithFlag:flag
                     message:message];
}

@end
