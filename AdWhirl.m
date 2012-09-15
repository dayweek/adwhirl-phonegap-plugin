
#import "AdWhirl.h" 
#import <AdWhirlView.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVPlugin.h>
@implementation AdWhirl 

@synthesize callbackID;

- (NSString *)adWhirlApplicationKey {
    
    return @"app key";
    
}


- (UIViewController *)viewControllerForPresentingModalView {
    
    return [self viewController];
    
}

- (void)showAd:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    self.callbackID = [arguments pop];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    if(isAdded) {
        [self writeJavascript: [pluginResult toErrorCallbackString:self.callbackID]];
    } else {
    
        AdWhirlView *adWhirlView = [AdWhirlView requestAdWhirlViewWithDelegate:self];
        adWhirlView.tag = 100; 
        UIViewController *appViewController = [self viewController];
        
        UIWebView *webview = self.webView;
        CGRect newFrame = webview.frame;
        newFrame = CGRectOffset(newFrame, 0.0, 50);
        newFrame.size.height = newFrame.size.height - 50.0;
        webview.frame = newFrame;
        [appViewController.view addSubview:adWhirlView];
        NSLog(@"webviewadded");
        isAdded = YES;
        [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
    }  

}

- (void)hideAd:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    self.callbackID = [arguments pop];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    if(isAdded) {
        for (UIView *subview in [[[self viewController ]view ]subviews]) {
            
            if (subview.tag == 100){ 
                [subview removeFromSuperview];
                UIWebView *webview = self.webView;
                CGRect newFrame = webview.frame;
                newFrame = CGRectOffset(newFrame, 0.0, -50);
                newFrame.size.height = newFrame.size.height + 50.0;   
                webview.frame = newFrame;
                [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
                NSLog(@"webviewremoved");
                isAdded = NO;
            }
        }
    } else {
        [self writeJavascript: [pluginResult toErrorCallbackString:self.callbackID]];
    }
}
@end
