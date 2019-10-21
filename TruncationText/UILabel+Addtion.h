//
//  UILabel+Addtion.h
//  TruncationText
//
//  Created by huangjian on 2019/10/18.
//  Copyright © 2019 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TapAction)(void);
@interface UILabel (Addtion)
- (void)changeLineSpaceForLabelByTruncatingTail:(UIFont *)tailFont withTail:(NSString *)tailText tailTextColor:(UIColor*)tailTextColor showLine:(NSInteger)line labelWidth:(CGFloat)width;

//获取每行文字
- (NSArray *)getSeparatedLinesWithWidth:(CGFloat)width;

@property(nonatomic,copy)NSString *tailText;

@property(nonatomic,copy)TapAction tapAction;
@end

NS_ASSUME_NONNULL_END
