//
//  TKTargetDataAnalysis.h
//  Pods
//
//  Created by 云峰李 on 2017/8/31.
//
//

#import <Foundation/Foundation.h>

@interface TKTargetDataAnalysis : NSObject

- (void)tkAction_initReportManager:(NSDictionary *)params;

- (void)tkAction_setUserIdentifier:(NSDictionary *)params;

- (void)tkAction_setUserValueWithKey:(NSDictionary *)params;

- (void)tkAction_initLogWithConfig:(NSDictionary *)config;

- (void)tkAction_logWithFlagAndMessage:(NSDictionary *)params;

@end
