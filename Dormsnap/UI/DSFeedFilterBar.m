//
//  DSFeedFilterBar.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/1/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <pop/POP.h>
#import "DSConstants.h"

#import "DSFeedFilterBar.h"

@interface DSFeedFilterBar ()

@property (nonatomic, readwrite) NSUInteger currentViewIndex;

@end

@implementation DSFeedFilterBar

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor flatWhiteColor];
        [self populateView];
    }
    
    return self;
}

#pragma mark - Elements

- (UIButton *)filterBarButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont fontWithName:DSFontNameSemiBold size:13.f];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor flatWhiteColorDark] forState:UIControlStateNormal];
    [button setTitleColor:[DSConstants defaultGrayColor] forState:UIControlStateSelected];
    
    return button;
}

#pragma mark - Delegate

- (void)filterBar:(DSFeedFilterBar *)filterBar didChangeIndex:(NSUInteger)index {
    UIView *indicatorView = (UIView *)[self viewWithTag:3];
    CGPoint center = CGPointZero;
    
    if (index == 0) {
        center = CGPointMake(self.center.x - 130, self.center.y);
    } else {
        center = [(UIButton *)[self viewWithTag:index] center];
    }
    
    center = CGPointMake(center.x, center.y + 18.f);
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = [NSValue valueWithCGPoint:indicatorView.center];
    positionAnimation.toValue = [NSValue valueWithCGPoint:center];
    
    if (index != self.currentViewIndex) {
        [indicatorView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
    
    self.currentViewIndex = index;

    [self.delegate filterBar:self didChangeIndex:index];
}

- (void)selectedButton:(UIButton *)button {
    [self filterBar:self didChangeIndex:button.tag];
}

#pragma mark - View

- (void)populateView {
    UIButton *residencesButton = [self filterBarButton:@"RESIDENCES"];
    residencesButton.tag = 0;
    residencesButton.frame = CGRectMake(0, 0, 100.f, 20.f);
    residencesButton.center = CGPointMake(self.center.x - 130, self.center.y);
    
    [residencesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:residencesButton];
    
    UIButton *hotButton = [self filterBarButton:@"HOT"];
    hotButton.tag = 1;
    hotButton.frame = CGRectMake(0, 0, 100.f, 20.f);
    hotButton.center = self.center;
    
    [hotButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:hotButton];
    
    UIButton *universitiesButton = [self filterBarButton:@"UNIVERSITIES"];
    universitiesButton.tag = 2;
    universitiesButton.frame = CGRectMake(0, 0, 100.f, 20.f);
    universitiesButton.center = CGPointMake(self.center.x + 130, self.center.y);
    
    [universitiesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:universitiesButton];
    
    UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100.f, 3.f)];
    indicatorView.tag = 3;
    indicatorView.center = CGPointMake(self.center.x, self.center.y + 18.f);
    indicatorView.backgroundColor = [DSConstants defaultGrayColor];
    
    [self addSubview:indicatorView];
}

@end
