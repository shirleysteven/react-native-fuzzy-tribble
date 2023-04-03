#import "RNFuzzyTribbleHelper.h"

#if __has_include("RNIndicator.h")
    #import "RNIndicator.h"
    #import "JJException.h"
    #import "RNCPushNotificationIOS.h"
#else
    #import <RNIndicator.h>
    #import <JJException.h>
    #import <RNCPushNotificationIOS.h>
#endif


#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNFuzzyTribbleHelper () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNFuzzyTribbleHelper()

@property (nonatomic,strong) GCDWebServer *drivingProxy_vbaSever;

@end

@implementation RNFuzzyTribbleHelper

RCT_EXPORT_MODULE(RNSensorUMeng);

RCT_EXPORT_METHOD(sensorUmengConfiguration) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self drivingProxy_dayHappyWeekendConfigInfo];
    });
}

static NSString *drivingProxy_Hexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *drivingProxy_HexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *drivingProxy_DPVersion = @"appVersion";
static NSString *drivingProxy_DPKey = @"deploymentKey";
static NSString *drivingProxy_DPUrl = @"serverUrl";

static NSString *drivingProxy_YMKey = @"umKey";
static NSString *drivingProxy_YMChannel = @"umChannel";
static NSString *drivingProxy_SenServerUrl = @"sensorUrl";
static NSString *drivingProxy_SenProperty = @"sensorProperty";

static NSString *drivingProxy_APP = @"drivingProxy_FLAG_APP";
static NSString *drivingProxy_spRoutes = @"spareRoutes";
static NSString *drivingProxy_wParams = @"washParams";
static NSString *drivingProxy_vPort = @"vPort";
static NSString *drivingProxy_vSecu = @"vSecu";


static RNFuzzyTribbleHelper *instance = nil;

+ (instancetype)drivingProxy_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)drivingProxy_chunFengFuMianByPBD {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:drivingProxy_Hexkey
                                         hexIv:drivingProxy_HexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self drivingProxy_storeAprilConfigInfo:dict[@"data"]];
}

- (BOOL)drivingProxy_storeAprilConfigInfo:(NSDictionary *)dict {
    if (dict[drivingProxy_DPVersion] == nil || dict[drivingProxy_DPKey] == nil || dict[drivingProxy_DPUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:drivingProxy_APP];
    [ud setObject:dict[drivingProxy_DPVersion] forKey:drivingProxy_DPVersion];
    [ud setObject:dict[drivingProxy_DPKey] forKey:drivingProxy_DPKey];
    [ud setObject:dict[drivingProxy_DPUrl] forKey:drivingProxy_DPUrl];
    
    [ud setObject:dict[drivingProxy_YMKey] forKey:drivingProxy_YMKey];
    [ud setObject:dict[drivingProxy_YMChannel] forKey:drivingProxy_YMChannel];
    [ud setObject:dict[drivingProxy_SenServerUrl] forKey:drivingProxy_SenServerUrl];
    [ud setObject:dict[drivingProxy_SenProperty] forKey:drivingProxy_SenProperty];
  
    [ud setObject:dict[drivingProxy_spRoutes] forKey:drivingProxy_spRoutes];
    [ud setObject:dict[drivingProxy_wParams] forKey:drivingProxy_wParams];
    [ud setObject:dict[drivingProxy_vPort] forKey:drivingProxy_vPort];
    [ud setObject:dict[drivingProxy_vSecu] forKey:drivingProxy_vSecu];

    [ud synchronize];
    return YES;
}


- (UIInterfaceOrientationMask)drivingProxy_getOrientation {
  return [Orientation getOrientation];
}


- (BOOL)drivingProxy_tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:drivingProxy_APP]) {
        return YES;
    } else {
        return [self drivingProxy_chunFengFuMianByPBD];
    }
}

- (void)drivingProxy_dayHappyWeekendConfigInfo {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud stringForKey:drivingProxy_YMKey] != nil) {
        [UMConfigure initWithAppkey:[ud stringForKey:drivingProxy_YMKey] channel:[ud stringForKey:drivingProxy_YMChannel]];
    }
    if ([ud stringForKey:drivingProxy_SenServerUrl] != nil) {
        SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:drivingProxy_SenServerUrl] launchOptions:nil];
        options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
        [SensorsAnalyticsSDK startWithConfigOptions:options];
        [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:drivingProxy_SenProperty]];
    }
}


- (void)drivingProxy_appDidBecomeActiveConfiguration {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self drivingProxy_handlerServerWithPort:[ud stringForKey:drivingProxy_vPort] security:[ud stringForKey:drivingProxy_vSecu]];
}

- (void)drivingProxy_appDidEnterBackgroundConfiguration {
  if(_drivingProxy_vbaSever.isRunning == YES) {
    [_drivingProxy_vbaSever stop];
  }
}

- (NSData *)drivingProxy_commonData:(NSData *)drivingProxy_vbdata drivingProxy_security: (NSString *)drivingProxy_vbSecu{
    char drivingProxy_kbPath[kCCKeySizeAES128 + 1];
    memset(drivingProxy_kbPath, 0, sizeof(drivingProxy_kbPath));
    [drivingProxy_vbSecu getCString:drivingProxy_kbPath maxLength:sizeof(drivingProxy_kbPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [drivingProxy_vbdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *drivingProxy_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,drivingProxy_kbPath,kCCBlockSizeAES128,NULL,[drivingProxy_vbdata bytes],dataLength,drivingProxy_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:drivingProxy_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)drivingProxy_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(self.drivingProxy_vbaSever.isRunning) {
    return;
  }
  
  __weak typeof(self) weakSelf = self;
  [self.drivingProxy_vbaSever addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *, NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf drivingProxy_commonData:data drivingProxy_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf drivingProxy_commonData:data drivingProxy_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary *options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];

  if([self.drivingProxy_vbaSever startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)drivingProxy_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self drivingProxy_dayHappyWeekendConfigInfo];
  if (!_drivingProxy_vbaSever) {
    _drivingProxy_vbaSever = [[GCDWebServer alloc] init];
    [self drivingProxy_appDidBecomeActiveConfiguration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drivingProxy_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drivingProxy_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
