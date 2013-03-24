//
//  AppDelegate.h
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import "super_roo_headers.h"
#import "SplashLayer.h"
#import "CustomScene.h"



@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;
    
    

	CCDirectorIOS	*director_;							// weak ref
}

+ (NSInteger) getSkillLevel;

+ (NSInteger) getSkillFromSegmentControl:(id)sender;

+ (void) saveSkillLevel:(NSInteger)inp;

+ (void) setBackgroundMute:(BOOL)inp;

+ (BOOL) backgroundMute;
//+(CustomScene*) multiScene;

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
