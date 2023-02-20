#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNFuzzyTribbleHelper : UIResponder<RCTBridgeDelegate, RCTBridgeModule, UNUserNotificationCenterDelegate>

+ (instancetype)zebraBook_shared;
- (BOOL)zebraBook_tryThisWay;
- (UIInterfaceOrientationMask)zebraBook_getOrientation;
- (UIViewController *)zebraBook_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
