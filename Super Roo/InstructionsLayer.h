//
//  InstructionsLayer.h
//  Super Roo
//
//  Created by Joseph Pisciotta on 3/3/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import "super_roo_headers.h"


// AudioSettingsLayer
@interface InstructionsLayer : CCLayer
{
    UIScrollView *scroller;
    UITextView *textView;
}

// returns a CCScene that contains the AudioSettingsLayer as the only child
+(CCScene *) scene;

@end
