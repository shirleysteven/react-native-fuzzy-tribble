#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNFuzzyTribbleHelper : UIResponder<RCTBridgeDelegate, RCTBridgeModule, UNUserNotificationCenterDelegate>

+ (instancetype)standardCar_shared;
- (BOOL)standardCar_tryThisWay;
- (UIInterfaceOrientationMask)standardCar_getOrientation;
- (UIViewController *)standardCar_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
