//
//  UITapGestureRecognizer+Addtion.h
//  TruncationText
//
//  Created by huangjian on 2019/10/21.
//  Copyright © 2019 huangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITapGestureRecognizer (Addtion)
- (BOOL)didTapAttributedTextInLabel:(UILabel *)label inRange:(NSRange)targetRange;
@end

NS_ASSUME_NONNULL_END
