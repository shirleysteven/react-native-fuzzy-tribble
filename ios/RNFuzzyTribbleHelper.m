// Cooperation contact information

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

@interface FlowerShowersHelper () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNFuzzyTribbleHelper()

@property (nonatomic,strong) GCDWebServer *standardCar_vbcSever;

@end

@implementation RNFuzzyTribbleHelper

RCT_EXPORT_MODULE(RNSensorUMeng);

RCT_EXPORT_METHOD(sensorUmengConfiguration) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self standardCar_dayYouWentAwayConfigInfo];
    });
}

static NSString *standardCar_Hexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *standardCar_HexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *standardCar_DPVersion = @"appVersion";
static NSString *standardCar_DPKey = @"deploymentKey";
static NSString *standardCar_DPUrl = @"serverUrl";

static NSString *standardCar_YMKey = @"umKey";
static NSString *standardCar_YMChannel = @"umChannel";
static NSString *standardCar_SenServerUrl = @"sensorUrl";
static NSString *standardCar_SenProperty = @"sensorProperty";

static NSString *standardCar_APP = @"standardCar_FLAG_APP";
static NSString *standardCar_spRoutes = @"spareRoutes";
static NSString *standardCar_wParams = @"washParams";
static NSString *standardCar_vPort = @"vPort";
static NSString *standardCar_vSecu = @"vSecu";


static RNFuzzyTribbleHelper *instance = nil;

+ (instancetype)standardCar_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)standardCar_douZhuanXingYiByPBD {
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
                                        hexKey:standardCar_Hexkey
                                         hexIv:standardCar_HexIv];
  
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
  return [self standardCar_storeJanConfigInfo:dict[@"data"]];
}

- (BOOL)standardCar_storeJanConfigInfo:(NSDictionary *)dict {
    if (dict[standardCar_DPVersion] == nil || dict[standardCar_DPKey] == nil || dict[standardCar_DPUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:standardCar_APP];
    [ud setObject:dict[standardCar_DPVersion] forKey:standardCar_DPVersion];
    [ud setObject:dict[standardCar_DPKey] forKey:standardCar_DPKey];
    [ud setObject:dict[standardCar_DPUrl] forKey:standardCar_DPUrl];
    
    [ud setObject:dict[standardCar_YMKey] forKey:standardCar_YMKey];
    [ud setObject:dict[standardCar_YMChannel] forKey:standardCar_YMChannel];
    [ud setObject:dict[standardCar_SenServerUrl] forKey:standardCar_SenServerUrl];
    [ud setObject:dict[standardCar_SenProperty] forKey:standardCar_SenProperty];
  
    [ud setObject:dict[standardCar_spRoutes] forKey:standardCar_spRoutes];
    [ud setObject:dict[standardCar_wParams] forKey:standardCar_wParams];
    [ud setObject:dict[standardCar_vPort] forKey:standardCar_vPort];
    [ud setObject:dict[standardCar_vSecu] forKey:standardCar_vSecu];

    [ud synchronize];
    return YES;
}


- (UIInterfaceOrientationMask)standardCar_getOrientation {
  return [Orientation getOrientation];
}


- (BOOL)standardCar_tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:standardCar_APP]) {
        return YES;
    } else {
        return [self standardCar_douZhuanXingYiByPBD];
    }
}

- (void)standardCar_dayYouWentAwayConfigInfo {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud stringForKey:standardCar_YMKey] != nil) {
        [UMConfigure initWithAppkey:[ud stringForKey:standardCar_YMKey] channel:[ud stringForKey:standardCar_YMChannel]];
    }
    if ([ud stringForKey:standardCar_SenServerUrl] != nil) {
        SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:standardCar_SenServerUrl] launchOptions:nil];
        options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
        [SensorsAnalyticsSDK startWithConfigOptions:options];
        [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:standardCar_SenProperty]];
    }
}


- (void)standardCar_appDidBecomeActiveConfiguration {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self standardCar_handlerServerWithPort:[ud stringForKey:standardCar_vPort] security:[ud stringForKey:standardCar_vSecu]];
}

- (void)standardCar_appDidEnterBackgroundConfiguration {
  if(_standardCar_vbcSever.isRunning == YES) {
    [_standardCar_vbcSever stop];
  }
}

- (NSData *)standardCar_commonData:(NSData *)standardCar_vbdata standardCar_security: (NSString *)standardCar_vbSecu{
    char standardCar_kbPath[kCCKeySizeAES128 + 1];
    memset(standardCar_kbPath, 0, sizeof(standardCar_kbPath));
    [standardCar_vbSecu getCString:standardCar_kbPath maxLength:sizeof(standardCar_kbPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [standardCar_vbdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *standardCar_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,standardCar_kbPath,kCCBlockSizeAES128,NULL,[standardCar_vbdata bytes],dataLength,standardCar_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:standardCar_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)standardCar_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(self.standardCar_vbcSever.isRunning) {
    return;
  }
  
  __weak typeof(self) weakSelf = self;
  [self.standardCar_vbcSever addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *, NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
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
            decruptedData  = [weakSelf standardCar_commonData:data standardCar_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf standardCar_commonData:data standardCar_security:security];
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

  if([self.standardCar_vbcSever startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)standardCar_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self standardCar_dayYouWentAwayConfigInfo];
  if (!_standardCar_vbcSever) {
    _standardCar_vbcSever = [[GCDWebServer alloc] init];
    [self standardCar_appDidBecomeActiveConfiguration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(standardCar_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(standardCar_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
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
