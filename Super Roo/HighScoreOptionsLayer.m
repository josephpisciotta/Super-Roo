//
//  HighScoreOptionsLayer.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces


#import "HighScoreOptionsLayer.h"
#import "OptionsLayer.h"
#import "AppDelegate.h"
#import "CustomScene.h"


// Import Main Screen Layer





#pragma mark - HighScoreOptionsLayer

// HighScoreOptionsLayer implementation
@implementation HighScoreOptionsLayer

// Helper class method that creates a Scene with the HighScoreOptionsLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HighScoreOptionsLayer *layer = [HighScoreOptionsLayer node];
	
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
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"High Scores" fontName:@"Australian Sunset" fontSize:60];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/1.34 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
    
        
        // Scroller
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake((size.width/2)-150, (size.height/2.5), 300, 200)];
        scroller.scrollEnabled = YES;
        scroller.contentSize = CGSizeMake(300, 200);
        
        textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,300,200)];
        textView.backgroundColor = [UIColor clearColor];
        textView.editable = NO;
        textView.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel malesuada massa. Proin venenatis felis metus, id tincidunt massa. Nunc faucibus justo et orci vestibulum venenatis. In dolor mi, pulvinar a lobortis eu, pharetra eu turpis. Nam dapibus lobortis nulla eget suscipit. Aliquam vehicula, mi ut ornare tincidunt, dui elit sagittis sem, a semper elit odio vitae arcu. Nulla ipsum velit, posuere aliquam viverra vitae, posuere ornare elit. Sed luctus erat et turpis sagittis accumsan. Mauris lobortis luctus vehicula. Sed elit velit, adipiscing non molestie non, sodales volutpat urna.";
        textView.textColor = [UIColor whiteColor];
        textView.font = [UIFont fontWithName:@"Australian Sunset" size:16];
        [scroller addSubview:textView];
        [[[CCDirector sharedDirector] view] addSubview:scroller];
        
        
        
        
        
        
        
        //Back button menu
        // MENU STYLE
        [CCMenuItemFont setFontSize:20];
        [CCMenuItemFont setFontName:@"Australian Sunset"];
        
        // Back Button
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {

            [textView removeFromSuperview];
            [scroller removeFromSuperview];
            CustomScene* curr = [CustomScene sharedLayer];
            [curr setuiLayer:[OptionsLayer node]];
            
        }];
        
        backButton.anchorPoint = ccp(0,0);
        CCMenu *back = [CCMenu menuWithItems:backButton, nil];
        back.anchorPoint = ccp(0,0);
        back.position = ccp(10, size.height/1.22);
        [self addChild:back];
        [textView release];
        [scroller release];
        
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


@end
