#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNFuzzyTribbleHelper : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)tribble_shared;
- (BOOL)tribble_tryThisWay;
- (UIInterfaceOrientationMask)tribble_getOrientation;
- (UIViewController *)tribble_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
