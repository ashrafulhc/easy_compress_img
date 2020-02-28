#import "EasyCompressImgPlugin.h"
#if __has_include(<easy_compress_img/easy_compress_img-Swift.h>)
#import <easy_compress_img/easy_compress_img-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "easy_compress_img-Swift.h"
#endif

@implementation EasyCompressImgPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEasyCompressImgPlugin registerWithRegistrar:registrar];
}
@end
