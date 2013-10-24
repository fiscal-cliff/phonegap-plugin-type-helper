

#import "TypeHelper.h"

@implementation TypeHelper


- (void)getFile:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult * pluginResult = nil;
    NSError* error = nil;
    
    NSString* dirName = [command.arguments objectAtIndex:0];
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* dirPath = [path stringByAppendingPathComponent:dirName];
    
    NSLog(@"Trying to create directory: %@",dirName);
    bool isCreated = ![[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:NO attributes:nil error: &error];
    
    if (isCreated) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:dirPath];
        NSLog(@"Success!");
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't create the directory."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end