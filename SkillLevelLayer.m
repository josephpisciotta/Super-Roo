//
//  SkillLevelLayer.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces


#import "SkillLevelLayer.h"
#import "OptionsLayer.h"
#import "AppDelegate.h"
#import "CustomScene.h"


// Import Main Screen Layer





#pragma mark - SkillLevelLayer

// SkillLevelLayer implementation
@implementation SkillLevelLayer

// Helper class method that creates a Scene with the SkillLevelLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SkillLevelLayer *layer = [SkillLevelLayer node];
	
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
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Skill Select" fontName:@"Australian Sunset" fontSize:60];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/1.34 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        
        // Skill select label 
        CCLabelTTF *skillLevelLabel = [CCLabelTTF labelWithString:@"Skill Level:" fontName:@"Australian Sunset" fontSize:20];
        skillLevelLabel.anchorPoint = ccp(0.5f,0.5f);
        skillLevelLabel.position = ccp(size.width/2,size.height/2);
        [self addChild:skillLevelLabel];
        
        // Skill selector and call to functionality
        NSInteger selectedLevelIndex = [AppController getSkillLevel];
        NSArray *levels = [[NSArray alloc] initWithObjects:@"Kid", @"Big Kid",@"Hard", nil];
        skillSelector = [[ UISegmentedControl alloc ] initWithItems:levels];
        skillSelector.selectedSegmentIndex = selectedLevelIndex;
        skillSelector.frame = CGRectMake((size.width/2)-150, (size.height/2) + (skillLevelLabel.dimensions.height + 40), 300, 35);
        [skillSelector addTarget:self action:@selector(saveSkill:) forControlEvents:UIControlEventValueChanged];
        
        [[[CCDirector sharedDirector] view] addSubview:skillSelector];
        
        // MENU STYLE
        [CCMenuItemFont setFontSize:20];
        [CCMenuItemFont setFontName:@"Australian Sunset"];
        
        // Back Button
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
//            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[OptionsLayer scene]
//                                                       ]];
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[OptionsLayer scene]]];
            [skillSelector removeFromSuperview];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[OptionsLayer node]];
        }];
        
        
        backButton.anchorPoint = ccp(0,0);
        CCMenu *back = [CCMenu menuWithItems:backButton, nil];
        back.anchorPoint = ccp(0,0);
        back.position = ccp(10, size.height/1.22);
        [self addChild:back];
        
        
        [levels release];
        [skillSelector release];
        
        
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
-(void) saveSkill:(id)sender{
    NSInteger skill = [AppController getSkillFromSegmentControl:sender];
    [AppController saveSkillLevel:skill];
}

@end
