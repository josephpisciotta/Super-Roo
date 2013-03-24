//
//  MainScreenLayer.h
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import "super_roo_headers.h"



// MainScreenLayer
@interface MainScreenLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCMenu *menu;
}

// returns a CCScene that contains the MainScreenLayer as the only child
+(CCScene *) scene;
+(UIImageView *) background;

//+(void) addLayerToScene:(CCLayer*)newl withOld:(CCLayer*)old;


@end
