//
//  LTCarouseView.m
//  LTCarouselView
//
//  Created by Jonny on 16/3/14.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTCarouseView.h"

/** 获取屏幕高宽 **/
#define __kScreenHeight                 [UIScreen mainScreen].bounds.size.height
#define __kScreenWidth                  [UIScreen mainScreen].bounds.size.width

@interface LTCarouseView()
<
    UIScrollViewDelegate
>

{
    UIPageControl   *_page;              ///< 显示页
    UIScrollView    *_bottomScrView;      ///< 底部滑动View
}

@end

@implementation LTCarouseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //底部滑动
        _bottomScrView = [[UIScrollView alloc]initWithFrame:frame];
        _bottomScrView.contentSize = CGSizeMake(__kScreenWidth, frame.size.height);
        _bottomScrView.pagingEnabled = YES;
        _bottomScrView.showsHorizontalScrollIndicator = NO;
        _bottomScrView.showsVerticalScrollIndicator = NO;
        _bottomScrView.delegate = self;
        _bottomScrView.backgroundColor = [UIColor colorWithRed:240 green:240 blue:250 alpha:1];
        [self addSubview:_bottomScrView];
        
        //显示页数
         _page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-30, self.bounds.size.width, 30)];
        _page.pageIndicatorTintColor = [UIColor grayColor];
        _page.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:_page];

    }
        return self;
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_page setCurrentPage:offset.x / bounds.size.width];
}

/** 重写set方法 */
- (void)setImageAry:(NSArray *)imageAry {
    if (_imageAry == nil) {
        _imageAry = imageAry;
        [self setImage:_imageAry];
    }
}

/** 重写setURL方法 */
- (void)setImageURLAry:(NSArray *)imageURLAry {
    if (_imageURLAry == nil) {
        _imageURLAry = imageURLAry;
        [self setImage:imageURLAry];
    }
}

/** 设置原点颜色 */
- (void)setPageColor:(UIColor *)pageColor {
    if (self.pageColor==nil) {
        _pageColor = pageColor;
        _page.currentPageIndicatorTintColor = _pageColor;
    }
}

/** 配置image */
- (void)setImage:(NSArray *)imageAry {
    
    _bottomScrView.contentSize = CGSizeMake(imageAry.count*self.bounds.size.width, 0);
    _page.numberOfPages = imageAry.count;
    
    //图片
    for (int i = 0;i<imageAry.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width*i, 0, self.bounds.size.width, self.bounds.size.height)];
        id objc = imageAry[i];
        
        if ([self isURL:objc]) {
            [self setImageViewImages:imageView url:imageAry[i]];
            
        } else {
            
            imageView.image = imageAry[i];
        }
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
        [imageView addGestureRecognizer:tap];
        [_bottomScrView addSubview:imageView];
    }
}

/** 是否为url 返回no为 image 否则为 string */
-(BOOL)isURL:(id)objc {
    
     NSLog(@"objc class is %@",objc);
    if ([objc isKindOfClass:[NSString class]]) {
        return YES;
    }else{
        return NO;
    }
}

/** 设置imageView 图片 */
- (void)setImageViewImages:(UIImageView *)imageView url:(NSString *)url {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = [UIImage imageWithData:imageData];
        });
    });
}

/** 点击图片 */
- (void)tapImage:(UITapGestureRecognizer *)tap {
    
    UIImageView *imageView = (UIImageView*) tap.view;
     NSLog(@" imageView tag %ld",imageView.tag);
    if ([self.delegate respondsToSelector:@selector(clickWithImageView:index:)]) {
        [self.delegate clickWithImageView:self index:imageView.tag];
    }
}
@end
