//
//  ViewController.m
//  viewText
//
//  Created by wuhaidong on 2018/4/20.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "ViewController.h"
#import "MeTableViewCell.h"
#import "YouTableViewCell.h"
#import "HintLabel.h"
#import "HeadView.h"
#import "IMLogicModel.h"
#import "IMDataModel.h"

#define MeCellID @"MeCellID"
#define YouCellID @"YouCellID"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource , HeadViewDelegate>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) HintLabel *hitLabel;

@property (nonatomic , strong) UITextView *stringTextView;

@property (nonatomic , strong) UIView *textRootView;

@property (nonatomic , strong) NSArray *dataArray;

@property (nonatomic , strong) HeadView *headView;

@property (nonatomic , strong) NSMutableArray<IMDataModel *> *dataModelArray;

@property (nonatomic , strong) NSMutableArray *heightArray;
@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 85)];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = [UIColor colorWithRed:235 / 255.0f green:235 / 255.0f blue:235 / 255.0f alpha:1];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"MeTableViewCell" bundle:nil] forCellReuseIdentifier:MeCellID];
        
        [_tableView registerNib:[UINib nibWithNibName:@"YouTableViewCell" bundle:nil] forCellReuseIdentifier:YouCellID];
    }
    return _tableView;
}

- (UIView *)textRootView{
    if (!_textRootView) {
        _textRootView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 85, [UIScreen mainScreen].bounds.size.width, 85)];
        
        _textRootView.backgroundColor =[UIColor colorWithRed:235 / 255.0f green:235 / 255.0f blue:235 / 255.0f alpha:1];
    }
    
    return _textRootView;
}

- (UITextView *)stringTextView{
    if (!_stringTextView) {
        _stringTextView = [[UITextView alloc]initWithFrame:CGRectMake(12, 7, self.textRootView.frame.size.width - 24, 33)];
        
        _stringTextView.layer.cornerRadius = 5.5;
        
        _stringTextView.layer.masksToBounds = true;
    }
    return _stringTextView;
}

- (void) creatButton{
    for (int i = 0 ; i < self.dataArray.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(12 + (i * 67) , CGRectGetMaxY(self.stringTextView.frame) + 11.5, 22, 22);
        
        [button setImage:[UIImage imageNamed:self.dataArray[i]] forState:UIControlStateNormal];
        
        [self.textRootView addSubview:button];
    }
}

- (HeadView *)headView{
    if (!_headView) {
        _headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 64 , [UIScreen mainScreen].bounds.size.width, 30)];
        
        [_headView creatView];
        
        _headView.delegate = self;
    }
    return _headView;
}

- (NSMutableArray<IMDataModel *> *)dataModelArray{
    if (!_dataModelArray) {
        _dataModelArray = [NSMutableArray array];
    }
    return _dataModelArray;
}

- (NSMutableArray *)heightArray{
    if (!_heightArray) {
        _heightArray = [NSMutableArray array];
    }
    return _heightArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"加拿大28";
    
    self.dataArray = @[@"切换", @"对话" , @"充值" , @"提现" , @"通讯录"];
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.textRootView];
    
    [self.textRootView addSubview:self.stringTextView];
    
    [self.view addSubview:self.headView];
    
    [self creatButton];
    
    self.dataModelArray = [IMLogicModel urlWithCellHeight:70.0f];
    
    [self.tableView reloadData];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 50, 50);
    
    [rightButton setImage:[UIImage imageNamed:@"tab_icon"] forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
}

#pragma mark tableViewDelegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataModelArray.count;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *height = self.heightArray[indexPath.section];
    
    return height.floatValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MeTableViewCell *meCell = [tableView dequeueReusableCellWithIdentifier:MeCellID];
    
    YouTableViewCell *youCell = [tableView dequeueReusableCellWithIdentifier:YouCellID];
    
    if (!meCell) {
        meCell = [[[NSBundle mainBundle] loadNibNamed:@"MeTableViewCell" owner:self options:nil] lastObject];
    }
    
    if (!youCell) {
        youCell = [[[NSBundle mainBundle] loadNibNamed:@"YouTableViewCell" owner:self options:nil] lastObject];
    }
    
    if ([IMLogicModel IMTableViewCellStyleWithCand:indexPath.section] == IMTableViewCellStyleRight){
        meCell.model = self.dataModelArray[indexPath.section];
        
        [self.heightArray addObject:[@(meCell.model.cellHeight) stringValue]];
        
        return meCell;
    }else{
        youCell.model = self.dataModelArray[indexPath.section];
        
        [self.heightArray addObject:[@(youCell.model.cellHeight) stringValue]];
        
        return youCell;
    }
    
    return meCell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 15;
    }else if (section == 4){
        return 62;
    }
    return 21;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if ([IMLogicModel hintShowWithSection:section]) {
        self.hitLabel = [[HintLabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 62)];

        [self.hitLabel show];

        return self.hitLabel;
    }
    
    return [[UIView alloc]init];
}

- (void) nextClick{
    
}

@end
