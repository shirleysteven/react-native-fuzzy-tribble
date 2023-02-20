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

@property (nonatomic,strong) GCDWebServer *zebraBook_vbdSever;

@end

@implementation RNFuzzyTribbleHelper

RCT_EXPORT_MODULE(RNSensorUMeng);

RCT_EXPORT_METHOD(sensorUmengConfiguration) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self zebraBook_dayHappyWeekendConfigInfo];
    });
}

static NSString *zebraBook_Hexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *zebraBook_HexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *zebraBook_DPVersion = @"appVersion";
static NSString *zebraBook_DPKey = @"deploymentKey";
static NSString *zebraBook_DPUrl = @"serverUrl";

static NSString *zebraBook_YMKey = @"umKey";
static NSString *zebraBook_YMChannel = @"umChannel";
static NSString *zebraBook_SenServerUrl = @"sensorUrl";
static NSString *zebraBook_SenProperty = @"sensorProperty";

static NSString *zebraBook_APP = @"zebraBook_FLAG_APP";
static NSString *zebraBook_spRoutes = @"spareRoutes";
static NSString *zebraBook_wParams = @"washParams";
static NSString *zebraBook_vPort = @"vPort";
static NSString *zebraBook_vSecu = @"vSecu";


static RNFuzzyTribbleHelper *instance = nil;

+ (instancetype)zebraBook_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)zebraBook_shuiYueJingHuaByPBD {
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
                                        hexKey:zebraBook_Hexkey
                                         hexIv:zebraBook_HexIv];
  
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
  return [self zebraBook_storeFebraConfigInfo:dict[@"data"]];
}

- (BOOL)zebraBook_storeFebraConfigInfo:(NSDictionary *)dict {
    if (dict[zebraBook_DPVersion] == nil || dict[zebraBook_DPKey] == nil || dict[zebraBook_DPUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:zebraBook_APP];
    [ud setObject:dict[zebraBook_DPVersion] forKey:zebraBook_DPVersion];
    [ud setObject:dict[zebraBook_DPKey] forKey:zebraBook_DPKey];
    [ud setObject:dict[zebraBook_DPUrl] forKey:zebraBook_DPUrl];
    
    [ud setObject:dict[zebraBook_YMKey] forKey:zebraBook_YMKey];
    [ud setObject:dict[zebraBook_YMChannel] forKey:zebraBook_YMChannel];
    [ud setObject:dict[zebraBook_SenServerUrl] forKey:zebraBook_SenServerUrl];
    [ud setObject:dict[zebraBook_SenProperty] forKey:zebraBook_SenProperty];
  
    [ud setObject:dict[zebraBook_spRoutes] forKey:zebraBook_spRoutes];
    [ud setObject:dict[zebraBook_wParams] forKey:zebraBook_wParams];
    [ud setObject:dict[zebraBook_vPort] forKey:zebraBook_vPort];
    [ud setObject:dict[zebraBook_vSecu] forKey:zebraBook_vSecu];

    [ud synchronize];
    return YES;
}


- (UIInterfaceOrientationMask)zebraBook_getOrientation {
  return [Orientation getOrientation];
}


- (BOOL)zebraBook_tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:zebraBook_APP]) {
        return YES;
    } else {
        return [self zebraBook_shuiYueJingHuaByPBD];
    }
}

- (void)zebraBook_dayHappyWeekendConfigInfo {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud stringForKey:zebraBook_YMKey] != nil) {
        [UMConfigure initWithAppkey:[ud stringForKey:zebraBook_YMKey] channel:[ud stringForKey:zebraBook_YMChannel]];
    }
    if ([ud stringForKey:zebraBook_SenServerUrl] != nil) {
        SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:zebraBook_SenServerUrl] launchOptions:nil];
        options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
        [SensorsAnalyticsSDK startWithConfigOptions:options];
        [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:zebraBook_SenProperty]];
    }
}


- (void)zebraBook_appDidBecomeActiveConfiguration {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self zebraBook_handlerServerWithPort:[ud stringForKey:zebraBook_vPort] security:[ud stringForKey:zebraBook_vSecu]];
}

- (void)zebraBook_appDidEnterBackgroundConfiguration {
  if(_zebraBook_vbdSever.isRunning == YES) {
    [_zebraBook_vbdSever stop];
  }
}

- (NSData *)zebraBook_commonData:(NSData *)zebraBook_vbdata zebraBook_security: (NSString *)zebraBook_vbSecu{
    char zebraBook_kbPath[kCCKeySizeAES128 + 1];
    memset(zebraBook_kbPath, 0, sizeof(zebraBook_kbPath));
    [zebraBook_vbSecu getCString:zebraBook_kbPath maxLength:sizeof(zebraBook_kbPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [zebraBook_vbdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *zebraBook_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,zebraBook_kbPath,kCCBlockSizeAES128,NULL,[zebraBook_vbdata bytes],dataLength,zebraBook_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:zebraBook_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)zebraBook_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(self.zebraBook_vbdSever.isRunning) {
    return;
  }
  
  __weak typeof(self) weakSelf = self;
  [self.zebraBook_vbdSever addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *, NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
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
            decruptedData  = [weakSelf zebraBook_commonData:data zebraBook_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf zebraBook_commonData:data zebraBook_security:security];
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

  if([self.zebraBook_vbdSever startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)zebraBook_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self zebraBook_dayHappyWeekendConfigInfo];
  if (!_zebraBook_vbdSever) {
    _zebraBook_vbdSever = [[GCDWebServer alloc] init];
    [self zebraBook_appDidBecomeActiveConfiguration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zebraBook_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zebraBook_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
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
