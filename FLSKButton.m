//
//  KKExpandButton.m
//  animationTest
//
//  Created by Karlo Kristensen on 01/03/13.
//  Copyright (c) 2013 Floskel. All rights reserved.
//

#import "FLSKButton.h"

@implementation FLSKButton

+ (id) buttonWithFrame:(CGRect)frame {
    FLSKButton *button = [super buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    
    button.textLabel = [[UILabel alloc] initWithFrame:button.frame];
    button.textLabel.textAlignment = NSTextAlignmentCenter;
    button.textLabel.font = [UIFont systemFontOfSize:12];
    button.textLabel.backgroundColor = [UIColor clearColor];
    [button addSubview:button.textLabel];

    return button;
}

@end
