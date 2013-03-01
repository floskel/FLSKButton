//
//  KKExpandingSegmentedControl.h
//  animationTest
//
//  Created by Karlo Kristensen on 16/02/13.
//  Copyright (c) 2013 Floskel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LEFT = -1,
    RIGHT = 1
} Horizontal;

typedef enum {
    UP = -1,
    DOWN = 1
} Vertical;

@protocol FLSKExpandingButtonDelegate
@required
- (void) segmentedControl:(id)sender didSelectIndex:(NSInteger)index;
@end

@interface FLSKExpandingButton : UIView

- (id) initWithTitles:(NSArray*)titles;

@property (nonatomic) Horizontal horiValue;
@property (nonatomic) Vertical vertValue;
@property (nonatomic, strong) id <FLSKExpandingButtonDelegate> delegate;

@end