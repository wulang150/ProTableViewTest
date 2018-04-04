//
//  ViewController.m
//  ProTableViewTest
//
//  Created by  Tmac on 2018/4/4.
//  Copyright © 2018年 Tmac. All rights reserved.
//

#import "ViewController.h"
#import "FriendCircleCell.h"
#import "YYFPSLabel.h"
#import "FriendCircleNewCell.h"

//#define FLAG              //去掉注释，就是开启了优化的代码，注释就是使用非优化代码

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
}

@property(nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataArr = [NSMutableArray new];
    
    NSArray *commentArr = @[@"今天是我的生日，大家祝福我吧！",@"我境内第三方上午是的是非得失杀死对方我都是佛挡杀佛是水电费色顺丰到付",@"的复古风格刚刚发更大幅度是额，对方答复",@"广告的对方答复地方地方地方地方地方地方少时诵诗书",@"苟富贵对方答复是似懂非懂是否杀死对方额似懂非懂是否"];
    
    for(int i=0;i<60;i++)
    {
        NSString *name = [NSString stringWithFormat:@"好的名字%d",i];
        NSString *content = [NSString stringWithFormat:@"万科曾向监管部门举报宝能，材料中提及：自2015年11月至2016年7月间，钜盛华九大资管计划累计持有约11.42亿股万科A股股份。九大资管计划买入均价约18.89元/股，累计持有总额约215.7亿元--%d",i];
        
        FriendMode *model = [[FriendMode alloc] init];
        model.name = name;
        model.content = content;
        model.commentArr = commentArr;
        if(i>=10&&i<40)
        {
            model.content = @"Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫";
        }
#ifdef FLAG
        FriendLayout *layout = [[FriendLayout alloc] initWithModel:model];
        [dataArr addObject:layout];
#else
        [dataArr addObject:model];
#endif
        
    }
    
    [self.view addSubview:self.tableView];
    
    //加入fps测试工具
    YYFPSLabel *FpsLab = [[YYFPSLabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-60, 0, 0)];
    [self.view addSubview:FpsLab];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

#pragma -mark UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#ifdef FLAG
    FriendCircleNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[FriendCircleNewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    FriendLayout *layout = [dataArr objectAtIndex:indexPath.row];
    cell.layout = layout;
    return cell;
#else
    
    FriendCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[FriendCircleCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    FriendMode *model = [dataArr objectAtIndex:indexPath.row];
    
    cell.model = model;
    
    return cell;
#endif
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
#ifdef FLAG
    FriendLayout *layout = [dataArr objectAtIndex:indexPath.row];
    return layout.height;
#else
    FriendMode *model = [dataArr objectAtIndex:indexPath.row];
    return [FriendCircleCell gainHeight:model];
#endif
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}


@end
