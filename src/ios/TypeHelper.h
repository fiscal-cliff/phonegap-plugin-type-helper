
#import <Cordova/CDV.h>

@interface ExtractZip : CDVPlugin
{
    NSString *callbackID;
}

- (void)getFile:(CDVInvokedUrlCommand*)command;

@property (strong, nonatomic) NSString *filePath

@end
