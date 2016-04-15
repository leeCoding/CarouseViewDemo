# LTCarouseView
1.一个简单轮播控件，支持本地图片和网络图片
2.使用方法

    /* 设置本地图片方法 */
    LTCarouseView *carouseView = [[LTCarouseView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    //设置本地图片
    carouseView.imageAry = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"]];
    
    //设置PageControl颜色
    carouseView.pageColor = [UIColor whiteColor];
    [self.view addSubview:carouseView];
    
    /* 设置网络图片 */
    carouseView.imageURLAry = @[url,url1];
