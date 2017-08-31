//
//  TKLogSystem.m
//  Pods
//
//  Created by 云峰李 on 2017/8/31.
//
//

#import "TKLogSystem.h"
#import "TKRemoteLogger.h"

static DDLogLevel ddLogLevel = DDLogLevelVerbose;
static NSString* const kLogLevel = @"logLevel";

@implementation TKLogSystem

+ (void)initializationWithConfig:(NSDictionary *)config
{
    NSInteger logLevel = [config[kLogLevel] integerValue];
    ddLogLevel = logLevel;
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(255, 0, 0)
                                     backgroundColor:nil
                                             forFlag:DDLogFlagError];
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(125,200,80)
                                     backgroundColor:nil
                                             forFlag:DDLogFlagInfo];
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(200,100,200)
                                     backgroundColor:nil
                                             forFlag:DDLogFlagDebug];
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:DDASLLogger.sharedInstance];
}

+ (void)logWithFlag:(DDLogFlag) flag message:(NSString *)message
{
    if (message) {
        switch (flag) {
            case DDLogFlagError:
                DDLogError(@" - Error:%@",message);
                break;
            case DDLogFlagWarning:
                DDLogWarn(@" - Warning:%@",message);
                break;
            case DDLogFlagInfo:
                DDLogInfo(@" - Info:%@", message);
                break;
            case DDLogFlagDebug:
                DDLogDebug(@" - Debug:%@",message);
                break;
            case DDLogFlagVerbose:
                DDLogVerbose(@" - Verbose:%@", message);
                break;
        }
    }
}

@end
