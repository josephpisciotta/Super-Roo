//
//  CustomScene.m
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomScene.h"
#import "Background.h"
#import "MainScreenLayer.h"


@implementation CustomScene


-(id) init
{
    if ((self = [super init]))
    {
        multiLayerSceneInstance = self;
        
        // The GameLayer will be moved, rotated and scaled independently
        bglayer = [Background node];
        bglayer.isTouchEnabled = NO;
        [self addChild:bglayer z:1 tag:5];
        
        // The UserInterfaceLayer remains static and relative to the screenarea.
        uiLayer = [MainScreenLayer node];
        uiLayer.isTouchEnabled = YES;
        [self addChild:uiLayer z:2 tag:7];
    }
    
    return self;
}

static CustomScene* multiLayerSceneInstance;
+(CustomScene*) multiLayerSceneInstance{return multiLayerSceneInstance;}

+(CustomScene*) sharedLayer
{
    NSAssert(multiLayerSceneInstance != nil, @"MultiLayerScene not available!");
    return multiLayerSceneInstance;
}

-(void) dealloc
{
    // MultiLayerScene will be deallocated now, you must set it to nil
    multiLayerSceneInstance = nil;
    [bglayer release];
    [uiLayer release];
    // don't forget to call "super dealloc"
    [super dealloc];
}
-(Background*) getbglayer
{
    CCNode* layer = [self getChildByTag:5];
    NSAssert([layer isKindOfClass:[Background class]], @"%@: not a GameLayer!",
             NSStringFromSelector(_cmd));
    return (Background*)layer;
}

-(CCLayer*) getuiLayer
{
    CCNode* layer = [[CustomScene sharedLayer] getChildByTag:7];
    NSAssert([layer isKindOfClass:[CCLayer class]],@"%@: not a UILayer!",
             NSStringFromSelector(_cmd));
    return (id)layer;
}
-(void) setuiLayer:(CCNode*)inpl{
    CCNode* layer = inpl;
    NSAssert([layer isKindOfClass:[CCLayer class]],@"%@: not a UILayer!",
             NSStringFromSelector(_cmd));
    [self removeChildByTag:7 cleanup:YES ];
    uiLayer = (id)layer;
    uiLayer.isTouchEnabled = YES;
    [self addChild:(id)layer z:2 tag:7];
    
    
}

@end
