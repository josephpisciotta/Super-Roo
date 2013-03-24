//
//  CustomScene.h
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "Background.h"
#import "MainScreenLayer.h"

@interface CustomScene : CCScene {
    CCLayer* uiLayer;
    Background* bglayer;
}
-(Background*) getbglayer;
-(CCLayer*) getuiLayer;
-(void) setuiLayer:(CCNode*)inpl;

+(CustomScene*) sharedLayer;

+(CustomScene*) multiLayerSceneInstance;
@end
