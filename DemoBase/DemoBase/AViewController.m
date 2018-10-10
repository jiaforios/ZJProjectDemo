//
//  AViewController.m
//  DemoBase
//
//  Created by admin on 2018/9/30.
//  Copyright © 2018年 com. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHue:arc4random()%256/255. saturation:arc4random()%256/255. brightness:arc4random()%256/255. alpha:1];
    
    self.title = [NSString stringWithFormat:@"viewController_%d",arc4random()%10];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UITableView *tabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 375, 667)];
    tabview.delegate = self;
    tabview.dataSource = self;
    
    [self.view addSubview:tabview];
    
    
    UIButton *edit = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    edit.backgroundColor = [UIColor blueColor];
    [edit setTitle:@"edit" forState:UIControlStateNormal];
    
    [edit addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *edit2 = [[UIButton alloc] initWithFrame:CGRectMake(54, 0, 44, 44)];
    edit2.backgroundColor = [UIColor blueColor];
    [edit2 setTitle:@"edit2" forState:UIControlStateNormal];
    
    [edit2 addTarget:self action:@selector(edit2Action) forControlEvents:UIControlEventTouchUpInside];
    
//    [self zj_setLeftBarView:edit];
    
//    [self zj_setLeftBarViews:@[edit,edit2]];

    
}

- (void)edit2Action{
    NSLog(@"edit2 -----");
}

- (void)editAction{
    NSLog(@"edit -----");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"asdasd";
    return cell;
}


- (void)pushAction{
    [self.navigationController showViewController:[AViewController new] sender:nil];
}

- (void)dealloc{
    NSLog(@"释放");
}

@end
