
#import <Cordova/CDV.h>

@interface ExtractZip : CDVPlugin
{
    NSString *callbackID;
}

- (void)getFile:(CDVInvokedUrlCommand*)command;

@end
