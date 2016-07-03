//
//  DSFeedViewController.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSFeedFilterBar.h"
#import "DSPostCell.h"

#import "DSFeedViewController.h"

@interface DSFeedViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) DSFeedFilterBar *filterBar;

@end

@implementation DSFeedViewController

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CellId";
    DSPostCell *cell = (DSPostCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[DSPostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

- (void)setupTableView {
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.tableView.topAnchor constraintEqualToAnchor:self.filterBar.bottomAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

#pragma mark - DSFeedFilterBar

- (void)setupSegmentedControl {
    CGRect frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 40.f);
    
    self.filterBar = [[DSFeedFilterBar alloc] initWithFrame:frame];
    self.filterBar.delegate = self;
    
    [self.view addSubview:self.filterBar];
    
    [self.filterBar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.filterBar.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
}

- (void)filterBar:(DSFeedFilterBar *)filterBar didChangeIndex:(NSUInteger)index {
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
