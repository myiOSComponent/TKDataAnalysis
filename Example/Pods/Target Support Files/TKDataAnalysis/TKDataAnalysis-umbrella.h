#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TKCrashReportManager.h"
#import "TKLogSystem.h"
#import "TKRemoteLogger.h"
#import "TKTargetDataAnalysis.h"

FOUNDATION_EXPORT double TKDataAnalysisVersionNumber;
FOUNDATION_EXPORT const unsigned char TKDataAnalysisVersionString[];

