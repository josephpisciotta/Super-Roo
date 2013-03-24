//
//  AudioSettingsLayer.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "AudioSettingsLayer.h"
#import "OptionsLayer.h"
#import "AppDelegate.h"
#import "CustomScene.h"





#pragma mark - AudioSettingsLayer

// AudioSettingsLayer implementation
@implementation AudioSettingsLayer

// Helper class method that creates a Scene with the AudioSettingsLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AudioSettingsLayer *layer = [AudioSettingsLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Audio Settings" fontName:@"Australian Sunset" fontSize:60];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/1.34 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        // UISelector and label
        backgroundMusicOnOff = [[ UISwitch alloc ] initWithFrame: CGRectMake(size.width/1.6, size.height/1.9, 0, 0) ];
        if([[SimpleAudioEngine sharedEngine] mute]) backgroundMusicOnOff.on = NO;
        else backgroundMusicOnOff.on = YES;
        backgroundMusicOnOff.onTintColor = UIColor.lightGrayColor;
        CCLabelTTF *backgroundMusicLabel = [CCLabelTTF labelWithString:@"Background Music:" fontName:@"Australian Sunset" fontSize:20];
        backgroundMusicLabel.position = ccp(size.width/2.7,size.height/2.3);
        [self addChild:backgroundMusicLabel];
        
        [backgroundMusicOnOff addTarget:self action:@selector(bgMusicFlip:) forControlEvents:UIControlEventValueChanged];
        
        [[[CCDirector sharedDirector] view] addSubview:backgroundMusicOnOff];
        
        // MENU STYLE
        [CCMenuItemFont setFontSize:20];
        [CCMenuItemFont setFontName:@"Australian Sunset"];
        
        // Back Button
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
            CustomScene* curr = [CustomScene sharedLayer];
            [backgroundMusicOnOff removeFromSuperview];
            [curr setuiLayer:[OptionsLayer node]];
            
        }];
        backButton.anchorPoint = ccp(0,0);
        CCMenu *back = [CCMenu menuWithItems:backButton, nil];
        back.anchorPoint = ccp(0,0);
        back.position = ccp(10, size.height/1.22);
        
        
        
        
        [backgroundMusicOnOff release];
        [self addChild:back];
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
         
- (void) bgMusicFlip:(id) sender{
    if (![[SimpleAudioEngine sharedEngine] mute]) {
        // This will unmute the sound
        [[SimpleAudioEngine sharedEngine] setMute:YES];
        [AppController setBackgroundMute:YES];

    }
    else {
        //This will mute the sound
        [[SimpleAudioEngine sharedEngine] setMute:NO];
        [AppController setBackgroundMute:NO];

    }
}


@end
