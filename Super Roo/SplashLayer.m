//
//  SplashLayer.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import "SplashLayer.h"
#import "MainScreenLayer.h"
#import "CustomScene.h"
#import "AppDelegate.h"


#pragma mark - SplashLayer

// HelloWorldLayer implementation
@implementation SplashLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SplashLayer *layer = [SplashLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(void) onEnter
{
	[super onEnter];

	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];

	CCSprite *background;
	
	if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
		background = [CCSprite spriteWithFile:@"Default-iphone5.png"];
        background.rotation = 90;
	} else {
		background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
        
	}
	background.position = ccp(size.width/2, size.height/2);
	// add the label as a child to this Layer
	[self addChild: background];
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"background_music.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"button-click.caf"];
    
	
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition:) delay:1];
}

-(void) makeTransition:(ccTime)dt
{
    [CustomScene node];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background_music.caf"];
    [[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume:0.7f];
    if([AppController backgroundMute]){
        [[SimpleAudioEngine sharedEngine] setMute:YES];
    }
    else{
        [[SimpleAudioEngine sharedEngine] setMute:NO];
    }
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[CustomScene sharedLayer
                                                                                                  ]]];
}
@end
