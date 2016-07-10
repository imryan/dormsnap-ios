//
//  DSSegmentedControl.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/1/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <pop/POP.h>
#import "Masonry.h"
#import "DSConstants.h"

#import "DSSegmentedControl.h"

@interface DSSegmentedControl ()

@property (nonatomic, strong) UIButton *residencesButton;
@property (nonatomic, strong) UIButton *hotButton;
@property (nonatomic, strong) UIButton *universitiesButton;
@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, assign) NSUInteger currentViewIndex;

@end

@implementation DSSegmentedControl

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.currentViewIndex = 2;
        self.backgroundColor = [UIColor whiteColor];
        
        [self populateView];
    }
    
    return self;
}

#pragma mark - Constraints

- (void)setupConstraints {
    [self.residencesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(7);
        make.centerYWithinMargins.equalTo(self.hotButton.mas_centerYWithinMargins);
        make.height.equalTo(self.hotButton.mas_height);
        make.width.equalTo(self.hotButton.mas_width);
    }];
    
    [self.universitiesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-7);
        make.centerYWithinMargins.equalTo(self.hotButton.mas_centerYWithinMargins);
        make.height.equalTo(self.hotButton.mas_height);
        make.width.equalTo(self.hotButton.mas_width);
    }];
}

#pragma mark - Elements

- (UIButton *)filterBarButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont fontWithName:DSFontNameSemiBold size:13.5f];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor flatWhiteColorDark] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    return button;
}

#pragma mark - Delegate

- (void)segmentedControl:(DSSegmentedControl *)filterBar didChangeIndex:(NSUInteger)index {
    UIView *indicatorView = (UIView *)[self viewWithTag:4];
    UIButton *button = (UIButton *)[self viewWithTag:index];
    CGPoint center = CGPointMake(button.center.x, button.center.y + 24.f);
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = [NSValue valueWithCGPoint:indicatorView.center];
    positionAnimation.toValue = [NSValue valueWithCGPoint:center];
    
    if (index != self.currentViewIndex) {
        [indicatorView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
    
    self.currentViewIndex = index;
    [self.delegate segmentedControl:self didChangeIndex:index];
}

- (void)selectedButton:(UIButton *)button {
    [self segmentedControl:self didChangeIndex:button.tag];
}

#pragma mark - View

- (void)populateView {
    self.residencesButton = [self filterBarButton:@"RESIDENCES"];
    self.residencesButton.tag = 1;
    
    [self.residencesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.residencesButton];
    
    self.hotButton = [self filterBarButton:@"HOT"];
    self.hotButton.tag = 2;
    self.hotButton.frame = CGRectMake(0, 0, 100.f, 45.f);
    self.hotButton.center = self.center;
    
    [self.hotButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.hotButton];
    
    self.universitiesButton = [self filterBarButton:@"UNIVERSITIES"];
    self.universitiesButton.tag = 3;
    
    [self.universitiesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.universitiesButton];
    
    self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100.f, 3.f)];
    self.indicatorView.tag = 4;
    self.indicatorView.center = CGPointMake(self.center.x, self.center.y + 21.5f);
    self.indicatorView.backgroundColor = [DSConstants defaultGrayColor];
    
    [self addSubview:self.indicatorView];
}

@end
