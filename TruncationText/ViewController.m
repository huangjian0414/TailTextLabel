//
//  ViewController.m
//  TruncationText
//
//  Created by huangjian on 2019/10/18.
//  Copyright © 2019 huangjian. All rights reserved.
//

#import "ViewController.h"
#import <YYText.h>
#import <Masonry.h>
#import "UILabel+Addtion.h"
@interface ViewController ()
@property(nonatomic,strong)YYLabel *yyLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //1.YYLabel 实现
    [self yyText];
    //2.自己截断 (如果产品的需求是点击查看放在当行最后，就尼玛很烦了，因为有可能截断的那行后面一堆空格或者一个换行)
    //[self customDeal];

}


-(void)customDeal{
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.backgroundColor = [UIColor lightGrayColor];
    contentLabel.textColor = [UIColor orangeColor];
    //用系统字体 内部获取每行内容与label显示有点不准
    contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    contentLabel.text = @"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右，引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。是日也，天朗气清，惠风和畅。仰观宇宙之大，俯察品类之盛，所以游目骋怀，足以极视听之娱，信可乐也。";
    
    contentLabel.numberOfLines = 2;
    [self.view addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(50);
        make.right.mas_offset(-50);
        make.top.mas_offset(100);
    }];
    [contentLabel changeLineSpaceForLabelByTruncatingTail:[UIFont fontWithName:@"PingFangSC-Regular" size:16] withTail:@"点击查看" tailTextColor:[UIColor blueColor] showLine:2 labelWidth:self.view.frame.size.width-100];
    contentLabel.tapAction = ^{
        
    };
    
}
//MARK: - YYLabel 产生截断 尾部显示高亮可点击字
-(void)yyText{
    YYLabel *label =[[YYLabel alloc]init];
    label.text = @"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右，引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。是日也，天朗气清，惠风和畅。仰观宇宙之大，俯察品类之盛，所以游目骋怀，足以极视听之娱，信可乐也";
    label.numberOfLines = 0;
    label.textColor = [UIColor redColor];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [self.view addSubview: label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(50);
        make.right.mas_offset(-50);
        make.top.mas_offset(100);
        make.height.mas_equalTo(50);
    }];
    self.yyLabel = label;
    
    NSString *moreString = @"点击详情";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:moreString];
    NSRange expandRange = NSMakeRange(0, text.string.length);
    
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:expandRange];
    
    //添加点击事件
    YYTextHighlight *hi = [YYTextHighlight new];
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:moreString]];
    
    __weak typeof(self) weakSelf = self;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //点击展开
        [weakSelf.yyLabel sizeToFit];
    };
    text.yy_font = label.font;
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentTop];
    
    label.truncationToken = truncationToken;
    
}

@end
