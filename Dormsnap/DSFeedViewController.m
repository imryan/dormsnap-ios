//
//  DSFeedViewController.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSSegmentedControl.h"
#import "DSPostCell.h"
#import "DSConstants.h"
#import "Masonry.h"

#import "DSFeedViewController.h"

@interface DSFeedViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) DSSegmentedControl *filterBar;

@end

@implementation DSFeedViewController

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 312.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CellId";
    DSPostCell *cell = (DSPostCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[DSPostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.postTitleLabel.text = @"55 John Street";
    cell.postDetailLabel.attributedText = [DSConstants postLocationString:@"Pace University"];
    
    return cell;
}

- (void)setupTableView {
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.filterBar.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - DSFeedFilterBar

- (void)setupSegmentedControl {
    CGRect frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 45.f);
    
    self.filterBar = [[DSSegmentedControl alloc] initWithFrame:frame];
    self.filterBar.delegate = self;
    
    [self.view addSubview:self.filterBar];
    
//    [self.filterBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//    }];
    
    [self.filterBar setupConstraints];
}

- (void)segmentedControl:(DSSegmentedControl *)filterBar didChangeIndex:(NSUInteger)index {
    // Slide table view for new index
}

#pragma mark - Layout

- (void)layoutView {
    [self.view removeConstraints:self.view.constraints];
    [self setupSegmentedControl];
    [self setupTableView];

    // Setup more controls
}

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
