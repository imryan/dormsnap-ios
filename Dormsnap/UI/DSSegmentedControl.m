//
//  DSSegmentedControl.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/1/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <ChameleonFramework/Chameleon.h>
#import <pop/POP.h>

#import "Masonry.h"
#import "DSConstants.h"

#import "DSSegmentedControl.h"

@interface DSSegmentedControl ()

@property (nonatomic, strong) UIButton *residencesButton;
@property (nonatomic, strong) UIButton *hotButton;
@property (nonatomic, strong) UIButton *universitiesButton;
@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, assign) DSSegmentedButtonType selectedSegment;

@end

@implementation DSSegmentedControl

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.selectedSegment = DSSegmentedButtonTypeHot;
        self.backgroundColor = [UIColor whiteColor];
        
        [self populateView];
        [self highlightIndex:self.selectedSegment];
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

- (UIButton *)segmentedControlButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont fontWithName:DSFontNameSemiBold size:13.5f];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor flatWhiteColorDark] forState:UIControlStateNormal];
    
    return button;
}

- (void)highlightIndex:(NSUInteger)index {
    for (UIButton *button in self.buttons) {
        if (self.buttons[index] == button) {
            [button setTitleColor:[UIColor flatGrayColor] forState:UIControlStateNormal];
        } else {
            [button setTitleColor:[UIColor flatWhiteColorDark] forState:UIControlStateNormal];
        }
    }
}

#pragma mark - Delegate

- (void)segmentedControl:(DSSegmentedControl *)segmentedControl didChangeSegment:(DSSegmentedButtonType)segment {
    UIView *indicatorView = (UIView *)[self viewWithTag:1];
    UIButton *button = self.buttons[segment];
    CGPoint center = CGPointMake(button.center.x, button.center.y + 24.f);
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = [NSValue valueWithCGPoint:indicatorView.center];
    positionAnimation.toValue = [NSValue valueWithCGPoint:center];
    
    if (segment != self.selectedSegment) {
        [indicatorView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
        [self highlightIndex:segment];
        
        self.selectedSegment = segment;
    }
    
    [self.delegate segmentedControl:segmentedControl didChangeSegment:segment];
}

- (void)selectedButton:(UIButton *)button {
    [self segmentedControl:self didChangeSegment:[self.buttons indexOfObject:button]];
}

#pragma mark - View

- (void)populateView {
    self.residencesButton = [self segmentedControlButton:@"RESIDENCES"];
    [self.residencesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.residencesButton];
    
    self.hotButton = [self segmentedControlButton:@"HOT"];
    self.hotButton.frame = CGRectMake(0, 0, 100.f, 45.f);
    self.hotButton.center = self.center;
    
    [self.hotButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.hotButton];
    
    self.universitiesButton = [self segmentedControlButton:@"UNIVERSITIES"];
    [self.universitiesButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.universitiesButton];
    
    self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100.f, 3.f)];
    self.indicatorView.tag = 1;
    self.indicatorView.center = CGPointMake(self.center.x, self.center.y + 21.f);
    self.indicatorView.backgroundColor = [DSConstants defaultGrayColor];
    [self addSubview:self.indicatorView];
    
    self.buttons = @[self.residencesButton, self.hotButton, self.universitiesButton];
}

@end
