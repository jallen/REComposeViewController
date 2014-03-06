//
//  PlayButton.m
//  PicVid
//
//  Created by Jared Allen on 10/15/13.
//  Copyright (c) 2013 Red Cactus LLC. All rights reserved.
//

#import "PlayButton.h"

@interface PlayButton()

@property (nonatomic, strong) UIImageView *icon;

- (UIImage *)_buttonImageFromColor:(UIColor *)color;

@end

@implementation PlayButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = CGRectGetWidth(frame) * 0.5f;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1.f;
        
        self.icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-play"]];
        self.icon.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        [self addSubview:self.icon];
    }
    return self;
}

#pragma mark - Public Methods

- (void)hideWithAnimation:(BOOL)animation {
    if (animation) {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
            self.alpha = 0.f;
        }];
    }
    else {
        self.alpha = 0.f;
    }
}

- (void)show {
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformMakeScale(1.f, 1.f);
        self.alpha = 1.f;
    }];
}

#pragma mark - Private Methods

- (UIImage *)_buttonImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
}

@end
