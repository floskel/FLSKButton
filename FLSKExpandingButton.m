//
//  KKExpandingSegmentedControl.m
//  animationTest
//
//  Created by Karlo Kristensen on 16/02/13.
//  Copyright (c) 2013 Floskel. All rights reserved.
//


#import "FLSKExpandingButton.h"
#import "FLSKButton.h"

@interface FLSKExpandingButton()
{
    
}
@property (nonatomic) BOOL isExpanded;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) FLSKButton *mainButton;

@end

@implementation FLSKExpandingButton

- (id) initWithTitles:(NSArray *)titles {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.frame = CGRectMake(0, 0, 100, 40);
    
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
    
    self.mainButton = [FLSKButton buttonWithFrame:CGRectMake(0, 0, 100, 40)];
    self.mainButton.textLabel.text = @"title";
    self.mainButton.textLabel.font = [UIFont systemFontOfSize:16];
    [self.mainButton addTarget:self action:@selector(mainButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.mainButton];
    
    _titles = titles;
    _buttons = [NSMutableArray array];
    
    int i = 0;
    for (NSString *name in self.titles) {
        FLSKButton *button = [FLSKButton buttonWithFrame:CGRectMake(0, 0, 80, 20)];

        [button addTarget:self action:@selector(segmentedButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        button.alpha = 0.0;
        
        button.textLabel.text = [name uppercaseString];
        
        [self addSubview:button];
        [self.buttons addObject:button];
        i++;
    }
    
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL pointInside = NO;
    
    // step through our subviews' frames
    for (UIView *subview in self.subviews)
    {
        // see if the point is inside their frame
        if([subview pointInside:[self convertPoint:point toView:subview] withEvent:event])
        {
            pointInside = YES;
            break;
        }
    }
    
    return pointInside;
}

- (void) mainButtonTapped:(UIButton*)sender {
    //NSLog(@"main button tapped");
    
    if (self.isExpanded) {
        [self subtractWithEndTitle:self.mainButton.textLabel.text];
    }
    else {
        [self expand];
    }
}

- (void) expand {
    //NSLog(@"expand");
    int index = 0;
    for (FLSKButton *button in self.buttons) {
        if (![self.subviews containsObject:button]) {
            [self addSubview:button];
        }

        [UIView animateWithDuration:0.5
                              delay:index * 0.005
                            options:UIViewAnimationCurveEaseOut
                         animations:^{
                             if (self.horiValue == LEFT) button.textLabel.textAlignment = NSTextAlignmentLeft;
                             else button.textLabel.textAlignment = NSTextAlignmentRight;

                             button.center = CGPointMake(button.center.x + 70*self.horiValue, (button.center.y + (index*CGRectGetHeight(button.frame))*self.vertValue));
                             button.alpha = 1.0;
                         } completion:^(BOOL finished) {}];
        index++;
    }
    self.isExpanded = YES;
}

- (void) subtractWithEndTitle:(NSString*)title {
    //NSLog(@"subtract");
    for (UIButton *button in self.buttons) {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             button.center = self.mainButton.center;
                             button.alpha = 0.0;
                             self.mainButton.textLabel.text = [title uppercaseString];
                         } completion:^(BOOL finished) {}];
    }
    
    self.isExpanded = NO;
}

- (void) segmentedButtonTapped:(FLSKButton *)sender {
    NSLog(@"segButton tapped with tag %i", sender.tag);
    sender.textLabel.font = [UIFont boldSystemFontOfSize:14.0];
    for (FLSKButton *button in self.buttons) {
        if (![button isEqual:sender]) {
            button.textLabel.font = [UIFont systemFontOfSize:12];
        }
    }
    
    [self subtractWithEndTitle:sender.textLabel.text];
    [self.delegate segmentedControl:self didSelectIndex:sender.tag];
}


@end
