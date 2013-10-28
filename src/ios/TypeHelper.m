

#import "TypeHelper.h"

@implementation TypeHelper : CDVPlugin


- (void)getFile:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult * pluginResult = nil;
    //NSError* error = nil;
    
    
    
    if (self.filePath != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:self.filePath];
        NSLog(@"Success!");
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"file is nil."];
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
    [self removeUnusedFiles:self.filePath];
}

- (void)removeUnusedFiles:(NSString *)except{
    
    NSString* path = [NSString stringWithFormat:@"%@/Inbox", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]];
    NSFileManager* fileManager= [NSFileManager defaultManager];
    NSArray *directoryContent = [fileManager contentsOfDirectoryAtPath:path error:NULL];
    for(int count = 0; count < (int)[directoryContent count]; count++){
        NSString *currentFilePath = [directoryContent objectAtIndex:count];
        NSLog(@"File %d: %@", count, currentFilePath);
        if([except rangeOfString:currentFilePath].location == NSNotFound){
            [fileManager removeItemAtPath:[path stringByAppendingPathComponent:currentFilePath] error:NULL];
            NSLog(@"Removed!");
        }
    }
}

@end