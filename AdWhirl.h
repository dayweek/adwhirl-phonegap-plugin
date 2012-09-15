#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <AdWhirlView.h>


@interface AdWhirl : CDVPlugin <AdWhirlDelegate> {
   NSString* callbackID;  
    BOOL isAdded;
}
// Properties
@property (nonatomic, copy) NSString* callbackID;

// Instance Methods
- (void) showAd:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void) hideAd:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
@end
