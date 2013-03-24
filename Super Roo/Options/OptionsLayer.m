//
//  OptionsLayer.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces



// Import Main Screen Layer
#import "OptionsLayer.h"
#import "MainScreenLayer.h"
#import "AppDelegate.h"
#import "AudioSettingsLayer.h"
#import "SkillLevelLayer.h"
#import "HighScoreOptionsLayer.h"
#import "CustomScene.h"


#pragma mark - OptionsLayer

// OptionsLayer implementation
@implementation OptionsLayer

// Helper class method that creates a Scene with the OptionsLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OptionsLayer *layer = [OptionsLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance

//static HighScoreOptionsLayer* highscoreoptions;
//static AudioSettingsLayer* audiosettingslayer;
//static SkillLevelLayer* skillLevelLayer;


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		//[[[[CCDirector sharedDirector] runningScene] children] removeObject:[MainScreenLayer node]];
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Options" fontName:@"Australian Sunset" fontSize:60];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/1.34 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        
        // MENU STYLE
        [CCMenuItemFont setFontSize:22];
        [CCMenuItemFont setFontName:@"Australian Sunset"];
        
        // Back Button
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Main Menu" block:^(id sender) {
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[MainScreenLayer  scene]]];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[MainScreenLayer node]];
        }];
        backButton.anchorPoint = ccp(0,0);
        back = [CCMenu menuWithItems:backButton, nil];
        back.anchorPoint = ccp(0,0);
        back.position = ccp(10, size.height/1.22);
        [self addChild:back];
        
        
        // Type of Settings Menu
        CCMenuItem *audioSettingsButton = [CCMenuItemFont itemWithString:@"Audio Settings" block:^(id sender) {
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[AudioSettingsLayer scene]]];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[AudioSettingsLayer node]];
        }];
        
        CCMenuItem *skillLevelButton = [CCMenuItemFont itemWithString:@"Skill Level Selection" block:^(id sender) {
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[SkillLevelLayer scene]]];
            //[[AppController menuScene]  updateForegroundLayerWithNewLayer:[SkillLevelLayer node]];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[SkillLevelLayer node]];
        }];
        
        CCMenuItem *highscoreButton = [CCMenuItemFont itemWithString:@"High Scores" block:^(id sender) {
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[HighScoreOptionsLayer scene]]];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[HighScoreOptionsLayer node]];
        }];


        
        typeOfSettings = [CCMenu menuWithItems:audioSettingsButton,skillLevelButton,highscoreButton, nil];
        [typeOfSettings alignItemsVerticallyWithPadding : 5];
        typeOfSettings.anchorPoint = ccp(0.5f,1.0f);
		typeOfSettings.position = ccp( size.width/2, size.height/3);
        [self addChild:typeOfSettings];
        
        
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

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}



@end
