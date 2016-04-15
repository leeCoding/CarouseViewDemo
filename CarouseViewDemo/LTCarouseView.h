//
//  LTCarouseView.h
//  LTCarouselView
//
//  Created by Jonny on 16/3/14.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LTCarouseViewDelegate;

/* 静态轮播图 */
@interface LTCarouseView : UIView

@property (nonatomic,strong)NSArray *imageAry;      ///< 轮播图片 -> 外界传入图片
@property (nonatomic,strong)NSArray *imageURLAry;   ///< 传入图片地址
@property (nonatomic,strong)UIColor *pageColor;     ///< 页数圆圈颜色 -> 默认黑色

@property (nonatomic,weak)id<LTCarouseViewDelegate>delegate;

@end

@protocol LTCarouseViewDelegate <NSObject>

@optional

/**
 *  点击轮播图
 *
 *  @param carouseView 本类
 *  @param index       点击返回index
 */
-(void)clickWithImageView:(LTCarouseView *)carouseView index:(NSInteger)index;

@end