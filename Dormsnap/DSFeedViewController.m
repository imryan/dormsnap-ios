//
//  DSFeedViewController.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DormsnapAPI.h"
#import "DSConstants.h"

#import "Masonry.h"
#import <pop/POP.h>

#import "DSFeedHotCell.h"
#import "DSFeedResidenceCell.h"
#import "DSFeedUniversityCell.h"
#import "DSSegmentedControl.h"
#import "DSTabBarItem.h"

#import "DSFeedViewController.h"
#import "DSPostViewController.h"

@interface DSFeedViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) DSSegmentedControl *segmentedControl;
@property (nonatomic, assign) DSSegmentedButtonType selectedSegment;

@end

@implementation DSFeedViewController

#pragma mark - Functions

- (void)openSettings {
    [self performSegueWithIdentifier:@"ToSettings" sender:nil];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    
    switch (self.selectedSegment) {
        case DSSegmentedButtonTypeHot:
            rows = 2;
            break;
        case DSSegmentedButtonTypeResidences:
            rows = 3;
            break;
        case DSSegmentedButtonTypeUniversities:
            rows = 3;
            break;
        default:
            break;
    }
    
    return rows;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.duration = 0.25;
    
    switch (self.selectedSegment) {
        case DSSegmentedButtonTypeResidences:
            transition.subtype = kCATransitionFromLeft;
            break;
        case DSSegmentedButtonTypeHot:
            transition.subtype = kCATransitionFromBottom; // TODO: Do this on launch and bounce when cells land
            break;
        case DSSegmentedButtonTypeUniversities:
            transition.subtype = kCATransitionFromRight;
            break;
        default:
            break;
    }
    
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [cell.layer addAnimation:transition forKey:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 312.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdHot = @"CellIdHot";
    static NSString *cellIdResidences = @"CellIdResidences";
    static NSString *cellIdUniversities = @"CellIdUniversities";
    
    if (self.selectedSegment == DSSegmentedButtonTypeHot) {
        DSFeedHotCell *cell = (DSFeedHotCell *)[tableView dequeueReusableCellWithIdentifier:cellIdHot forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[DSFeedHotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdHot];
        }
        
        cell.postTitleLabel.text = @"55 John Street";
        cell.postDetailLabel.attributedText = [DSConstants postLocationString:@"Pace University"];
        cell.postLikesLabel.attributedText = [DSConstants postLikesString:32];
        
        if (indexPath.row == 1) {
            cell.postImageView.image = [UIImage imageNamed:@"beekman"];
            cell.postTitleLabel.text = @"33 Beekman Street";
            cell.postDetailLabel.attributedText = [DSConstants postLocationString:@"Pace University"];
            cell.postLikesLabel.attributedText = [DSConstants postLikesString:54];
        }
        
        return cell;
    }
    
    else if (self.selectedSegment == DSSegmentedButtonTypeResidences) {
        DSFeedResidenceCell *cell = (DSFeedResidenceCell *)[tableView dequeueReusableCellWithIdentifier:cellIdResidences forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[DSFeedResidenceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdResidences];
        }
        
        // Customize cell
        
        return cell;
    }
    
    DSFeedUniversityCell *cell = (DSFeedUniversityCell *)[tableView dequeueReusableCellWithIdentifier:cellIdUniversities forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[DSFeedUniversityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdUniversities];
    }
    
    // Customize cell
    
    return cell;
}

- (void)setupTableView {
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.segmentedControl.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)setupBarButtonItem {
    UIBarButtonItem *settingsBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[DSConstants barButtonSettingsImage]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(openSettings)];
    self.navigationItem.rightBarButtonItem = settingsBarButtonItem;
}

#pragma mark - DSFeedFilterBar

- (void)setupSegmentedControl {
    CGRect frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 45.f);
    
    self.segmentedControl = [[DSSegmentedControl alloc] initWithFrame:frame];
    self.segmentedControl.delegate = self;
    
    [self.view addSubview:self.segmentedControl];
    [self.segmentedControl setupConstraints];
    
    self.selectedSegment = DSSegmentedButtonTypeHot;
}

- (void)segmentedControl:(DSSegmentedControl *)filterBar didChangeSegment:(DSSegmentedButtonType)segment {
    self.selectedSegment = segment;
    
    // Animate slide
    
    
    [self.tableView reloadData];
}

#pragma mark - Layout

- (void)layoutView {
    [self.view removeConstraints:self.view.constraints];
    [self setupSegmentedControl];
    [self setupTableView];
    [self setupBarButtonItem];

    // Setup more controls
}

#pragma mark - View

- (void)viewWillAppear:(BOOL)animated {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DSTabBarItem *feedItem = [[DSTabBarItem alloc] initWithImage:[DSConstants tabBarFeedImage] index:0];
        [[self navigationController] setTabBarItem:feedItem];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutView];
    
//    DSUniversity *university = [[DSUniversity alloc] initWithName:@"NYU" address:@"W 4th St New York, NY" colorHex:@"57078d"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (![segue.identifier isEqualToString:@"ToSettings"]) {
        
    }
}

@end
