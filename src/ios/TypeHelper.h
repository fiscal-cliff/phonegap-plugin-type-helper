
#import <Cordova/CDV.h>

@interface TypeHelper : CDVPlugin

- (void)getFile:(CDVInvokedUrlCommand*)command;
- (void)removeUnusedFiles:(NSString*)except;

@property (strong, nonatomic) NSString *filePath;

@end
