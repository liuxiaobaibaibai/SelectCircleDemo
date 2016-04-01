SelectCircleDemo
================
类似大转盘的选择视图

主要代码
    CircleSelectView * view =[[CircleSelectView alloc]initWithFrame:CGRectMake(100, 50, 300, 300)];
    [view setViewDelegate:self];
    [self.view addSubview:view];

数据都用代理传递，可以根据数据和方法划分dataSource,和delegate。demo只使用delegate，没有区分，请自行区分!



