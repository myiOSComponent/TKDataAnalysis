//
//  TKRemoteLogger.h
//  Pods
//
//  Created by 云峰李 on 2017/8/31.
//
//

#import <Foundation/Foundation.h>

#import <CocoaLumberjack/CocoaLumberjack.h>

/**
 远程Logger，会将日志信息发送到bugly进行收集。如果后期需要，会建新的类发送到自己服务器.
 */
@interface TKRemoteLogger : DDAbstractLogger <DDLogger>

@property (class, readonly, strong) TKRemoteLogger* sharedInstance;

@end
