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

#import "BPClient.h"
#import "BPCrashManager.h"
#import "BPDateRange.h"
#import "BPMetricCompletionHandler.h"
#import "BPRestProvider.h"
#import "BPSize.h"
#import "Buddy+Private.h"
#import "Buddy.h"
#import "BuddyCallbacks.h"
#import "BuddyClientProtocol.h"
#import "BuddyDevice.h"
#import "CryptoTools.h"
#import "Macro.h"
#import "Util.h"
#import "JAGPropertyConverter+BPJSONConverter.h"
#import "NSArray+BPSugar.h"
#import "NSData+BPConversion.h"
#import "NSDate+BPDateHelper.h"
#import "NSDate+JSON.h"
#import "NSError+BuddyError.h"
#import "NSString+JSON.h"
#import "BPBinaryModelBase.h"
#import "BPBlob.h"
#import "BPCheckin.h"
#import "BPCoordinate.h"
#import "BPFile.h"
#import "BPIdentity.h"
#import "BPMessage.h"
#import "BPMetadataItem.h"
#import "BPModelBase.h"
#import "BPNotificationResult.h"
#import "BPPageResults.h"
#import "BPPicture.h"
#import "BPSocialAuthenticatedUser.h"
#import "BPUser.h"
#import "BPUserList.h"
#import "BPUserListItem.h"
#import "BPVideo.h"
#import "BPAppSettings+Private.h"
#import "BPAppSettings.h"
#import "BPServiceController.h"
#import "JAGPropertyConverter.h"

FOUNDATION_EXPORT double BuddySDKVersionNumber;
FOUNDATION_EXPORT const unsigned char BuddySDKVersionString[];
