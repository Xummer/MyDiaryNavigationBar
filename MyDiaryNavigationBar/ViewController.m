//
//  ViewController.m
//  MyDiaryNavigationBar
//
//  Created by Xummer on 2016/12/28.
//  Copyright © 2016年 Xummer. All rights reserved.
//

#import "ViewController.h"
#import "MyDiaryUIAppearance.h"
#import "AnotherViewController.h"

@interface _UINavigationControllerPalette : UIView

- (id)_initWithNavigationController:(UINavigationController *)navigationCtrl forEdge:(unsigned int)edge;

- (void)_setPinningBar:(UINavigationBar *)navigationBar;

@end

@interface UINavigationController ()

- (void)attachPalette:(_UINavigationControllerPalette *)palette isPinned:(BOOL)isPinned;

- (void)_detachPalette:(_UINavigationControllerPalette *)palette;

@end

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTopPalette];
    
    UISegmentedControl *segCtrl = (id)self.navigationItem.titleView;
    segCtrl.selectedSegmentIndex = 1;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    id palette = [self.navigationController valueForKey:@"_topPalette"];
    
    [self.navigationController attachPalette:palette isPinned:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    id palette = [self.navigationController valueForKey:@"_topPalette"];
    
    [self.navigationController _detachPalette:palette];
}

#pragma mark - Private Method

- (void)setupTopPalette {
    _UINavigationControllerPalette *palette = [[_UINavigationControllerPalette alloc] _initWithNavigationController:self.navigationController forEdge:0];
    [palette _setPinningBar:self.navigationController.navigationBar];
    
    palette.frame = (CGRect){
        .origin.x = 0,
        .origin.y = 64,
        .size.width = CGRectGetWidth(self.navigationController.view.frame),
        .size.height = 38
    };
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:palette.bounds];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Diary";
    titleLabel.textColor = MAIN_TINTCOLOR;
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [palette addSubview:titleLabel];
    
    [self.navigationController setValue:palette forKey:@"_topPalette"];
    
    self.navigationItem.titleView = [[UISegmentedControl alloc] initWithItems:@[@"Entries", @"Calendar", @"Dairy"]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 26;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnotherViewController *vCtrl = [[AnotherViewController alloc] init];
    vCtrl.title = @"Diary";
    [self.navigationController pushViewController:vCtrl animated:YES];
}


@end
