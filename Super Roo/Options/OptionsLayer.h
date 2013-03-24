//
//  OptionsLayer.h
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import "super_roo_headers.h"




// OptionsLayer
@interface OptionsLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCMenu *back;
    CCMenu *typeOfSettings;
}

// returns a CCScene that contains the OptionsLayer as the only child
+(CCScene *) scene;


@end
