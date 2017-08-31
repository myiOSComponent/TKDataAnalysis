//
//  TKRemoteLogger.m
//  Pods
//
//  Created by 云峰李 on 2017/8/31.
//
//

#import "TKRemoteLogger.h"
#import "TKCrashReportManager.h"

@implementation TKRemoteLogger

+ (instancetype)sharedInstance {
    static TKRemoteLogger *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    // Skip captured log messages
    if ([logMessage->_fileName isEqualToString:@"DDASLLogCapture"]) {
        return;
    }
    
    NSString * message = _logFormatter ? [_logFormatter formatLogMessage:logMessage] : logMessage->_message;
    
    if (message) {
        switch (logMessage->_flag) {
            case DDLogFlagError     :
                TKRLogError(@"%@", message);
                break;
            case DDLogFlagWarning   :
                TKRLogWarn(@"%@", message);
                break;
            case DDLogFlagInfo      :
                TKRLogInfo(@"%@", message);
                break;
            case DDLogFlagDebug     :
                TKRLogDebug(@"%@", message);
                break;
            case DDLogFlagVerbose   :
                TKRLogVerbose(@"%@", message);
            default                 :
                TKRLogDebug(@"%@", message);
                break;
        }
    }
}

- (NSString *)loggerName {
    return @"com.thinkWind.RemoteLogger";
}


@end
