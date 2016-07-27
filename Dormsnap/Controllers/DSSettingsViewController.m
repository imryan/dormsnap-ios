//
//  DSSettingsViewController.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/24/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSConstants.h"

#import "DSSettingsViewController.h"

@interface DSSettingsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation DSSettingsViewController

#pragma mark - Functions

- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? 2 : 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *header = @"Account";
    
    if (section == 1) {
        header = @"Support";
    }
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return (section == 1) ? 50.f : 0.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        NSString *footer = [NSString stringWithFormat:@"\nDormsnap %@\n", DS_APP_VERSION];
        NSMutableAttributedString *dormsnapFooter = [[NSMutableAttributedString alloc] initWithString:footer];
        
        NSMutableAttributedString *madeWithLoveFooter = [[NSMutableAttributedString alloc] initWithString:@"Made with "];
        [madeWithLoveFooter appendAttributedString:[DSConstants heartIconString]];
        [madeWithLoveFooter appendAttributedString:[[NSAttributedString alloc] initWithString:@" in Hoboken"]];
        [dormsnapFooter appendAttributedString:madeWithLoveFooter];
        
        UILabel *footerLabel = [[UILabel alloc] initWithFrame:self.tableView.tableFooterView.frame];
        footerLabel.font = [UIFont systemFontOfSize:13.f];
        footerLabel.textColor = [UIColor grayColor];
        footerLabel.textAlignment = NSTextAlignmentCenter;
        footerLabel.attributedText = dormsnapFooter;
        footerLabel.lineBreakMode = NSLineBreakByWordWrapping;
        footerLabel.numberOfLines = 0;
        
        return footerLabel;
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    UIImage *image = [UIImage new];
    NSString *title = [NSString string];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            image = [DSConstants myPostsCellImage];
            title = @"My Posts";
        } else {
            image = [DSConstants myLikesCellImage];
            title = @"Liked Posts";
        }
        
    } else {
        if (indexPath.row == 0) {
            image = [DSConstants bugCellImage];
            title = @"Bug Report";
        } else if (indexPath.row == 1) {
            image = [DSConstants emailCellImage];
            title = @"Feedback";
        } else {
            image = [DSConstants openSourceImage];
            title = @"Open Source";
        }
    }
    
    cell.imageView.image = image;
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *closeBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[DSConstants barButtonCancelImage]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(close)];
    self.navigationItem.leftBarButtonItem = closeBarButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
