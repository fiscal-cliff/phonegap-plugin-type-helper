

#import "TypeHelper.h"

@implementation TypeHelper


- (void)getFile:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult * pluginResult = nil;
    NSError* error = nil;
    
    
    
    if (self.filePath != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:self.filePath];
        NSLog(@"Success!");
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't create the directory."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)handleOpenURL:(NSNotification*)notification
{
    // override to handle urls sent to your app
    // register your url schemes in your App-Info.plist

    NSURL* url = [notification object];

    if ([url isKindOfClass:[NSURL class]]) {
        self.filePath = [url absoluteString];
    }
}

@end