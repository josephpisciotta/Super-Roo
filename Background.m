//
//  Background.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Background.h"


@implementation Background
-(id) init {
    
    // always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {// ask director for the window size
        self.isTouchEnabled = YES;
        CCSprite *background;
        CCSprite *roo;
        if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
            background = [CCSprite spriteWithFile:@"kangarooBackground.png"];
            //background.rotation = 90;
        } else {
            background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
        }
        roo = [CCSprite spriteWithFile:@"kangaroo.png"];
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        background.position = ccp(size.width/2, size.height/2);
        roo.position = ccp(size.width/4,size.height/4);
        [self addChild: background];
        [self addChild:roo];
        
    }
    return self;
}
-(void) dealloc{
    [super dealloc];
}
@end
