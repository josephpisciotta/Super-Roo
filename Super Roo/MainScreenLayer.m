//
//  MainScreenLayer.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import "MainScreenLayer.h"
#import "OptionsLayer.h"
#import "AppDelegate.h"
#import "CustomScene.h"
#import "InstructionsLayer.h"


// Import Options Layer


#pragma mark - MainScreenLayer

// MainScreenLayer implementation
@implementation MainScreenLayer
static UIImageView * background;
+(UIImageView*) background{return background;}
//// Helper class method that creates a Scene with the MainScreenLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainScreenLayer *layer = [MainScreenLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
 //on "init" you need to initialize your instance
//static OptionsLayer * optionslayer;
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		self.isTouchEnabled = YES;
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Super Roo" fontName:@"Australian Sunset" fontSize:60];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/1.34 );
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
        // Main Menu
        //
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:20];
		[CCMenuItemFont setFontName:@"Australian Sunset"];
		// New Game Button
		CCMenuItem *newGameButton = [CCMenuItemFont itemWithString:@"New Game" block:^(id sender) {
			
		}];

		// Resume Game Button
		CCMenuItem *resumeGameButton = [CCMenuItemFont itemWithString:@"Resume" block:^(id sender) {
			
			
		}];
        
        // Options Button
        CCMenuItemFont *optionsButton = [CCMenuItemFont itemWithString:@"Options" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[OptionsLayer scene] ]];
            [[SimpleAudioEngine sharedEngine] playEffect:@"button-click.caf"];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[OptionsLayer node]];
        }];
        
        // Instructions
		CCMenuItem *instructionsButton = [CCMenuItemFont itemWithString:@"Instructions" block:^(id sender) {
			
			CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[InstructionsLayer node]];
		}];
        
        // Quit
		CCMenuItem *quitButton = [CCMenuItemFont itemWithString:@"Quit" block:^(id sender) {
			
			exit(0);
		}];
        
        
        
		BOOL prevGameExists = NO;
        if(prevGameExists){
            menu = [CCMenu menuWithItems:newGameButton, resumeGameButton, optionsButton, instructionsButton, quitButton, nil];
        }
        else{
            menu = [CCMenu menuWithItems:newGameButton, optionsButton, instructionsButton, quitButton, nil];
        }
        menu.isTouchEnabled=YES;
        menu.enabled = YES;
        self.isTouchEnabled=YES;
        
        
		[menu alignItemsVerticallyWithPadding:5];
        [menu setAnchorPoint:ccp(0.5f,0.0f)];
		[menu setPosition:ccp( size.width/2, size.height/3)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        
        
        
        
        
        
        NSLog(@"%i %i %i %i",[self isRunning],[self isTouchEnabled],[menu isRunning], [menu isTouchEnabled]);
	}
	return self;
}

//+(OptionsLayer*) optionslayer{return optionslayer;}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	// don't forget to call "super dealloc"
    [background release];

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
+(void) addLayerToScene:(CCLayer*)newl withOld:(CCLayer*)old{
    //unsigned int count = [subLayers count];
    
    [[[[[CCDirector sharedDirector] runningScene] children] lastObject] removeChild: old cleanup:YES];
    //[[[CCDirector sharedDirector] runningScene]  addChild:newl];
    //[[[CCDirector sharedDirector] runningScene] removeChild:old cleanup:YES];
    [[[CCDirector sharedDirector] runningScene]  addChild:newl];
    NSLog(@"sdfgsdfg");
}
@end
