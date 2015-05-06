//
//  ViewController.m
//  AttributedTextTest
//
//  Created by ssdd on 15/4/7.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "ViewController.h"


static NSString *const contentStr = @"首行缩进根据用户昵称自动调整 间隔可自定根据需求随意改变。。。。。。。";

@interface ViewController()
{
    UILabel *titleLabel;
    UILabel *contentLabel;
}
@property ( weak , nonatomic ) IBOutlet UILabel *usernameLabel;

@property ( weak , nonatomic ) IBOutlet UILabel *contentLabel;

@end

//视图展示层
@implementation ViewController

-(void)viewDidLoad {
    
    
    
    self . usernameLabel . text  =  @"傻德进行了修改Jordan CZ: " ;
    
    self . usernameLabel . adjustsFontSizeToFitWidth  =  YES ;
    
    [ self . usernameLabel   sizeToFit ];
    
    self . contentLabel . text  =  @"首行缩进根据用户昵称自动调整 间隔可自定根据需求随意改变。。。。。。。" ;
    
    self . contentLabel . adjustsFontSizeToFitWidth  =  YES ;
    
//    self . contentLabel . adjustsLetterSpacingToFitWidth  =  YES ;
    self.contentLabel.numberOfLines = 0;
    [ self   resetContent ];
    
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 25)];
    titleLabel.text = @"用户名Jordan CZ: 用户名Jordan CZ:   ";
    titleLabel.font= [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor greenColor];
    [titleLabel sizeToFit];
    [self.view addSubview:titleLabel];
    
    
    contentLabel  = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 10)];
//    contentLabel.text = @"首行缩进根据用户昵称自动调整 间隔可自定根据需求随意改变。。。。。。。";
    contentLabel.numberOfLines = 0;
    contentLabel.font= [UIFont systemFontOfSize:17];
    contentLabel.textColor = [UIColor redColor];
    [self resetMyContent];
    [self.view addSubview:contentLabel];

}

-(void)resetMyContent{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraphStytle = [[NSMutableParagraphStyle alloc]init];
    paragraphStytle.alignment = NSTextAlignmentLeft;
    paragraphStytle.maximumLineHeight = 60;
    paragraphStytle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStytle.lineSpacing = 5;
    if (titleLabel.frame.size.width >290) {
        contentLabel.frame = CGRectMake(10, titleLabel.frame.origin.y+25, self.view.frame.size.width-20, 10);
    }
    else{
    [paragraphStytle setFirstLineHeadIndent:titleLabel.frame.size.width];
    }
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStytle range:NSMakeRange(0, contentStr.length)];
    contentLabel.attributedText = attributedStr;
    [contentLabel sizeToFit];
}
//自适应计算间距

- ( void )resetContent{
    
    NSMutableAttributedString *attributedString = [[ NSMutableAttributedString alloc ] initWithString : self . contentLabel . text ];
    
    NSMutableParagraphStyle *paragraphStyle = [[ NSMutableParagraphStyle alloc ] init ];
    
    paragraphStyle. alignment = NSTextAlignmentLeft ;
    
    paragraphStyle. maximumLineHeight = 60 ;  //最大的行高
    
    paragraphStyle. lineSpacing = 5 ;  //行自定义行高度
    
    [paragraphStyle setFirstLineHeadIndent : self . usernameLabel . frame . size . width + 5 ]; //首行缩进 根据用户昵称宽度在加5个像素
    
    [attributedString addAttribute : NSParagraphStyleAttributeName value :paragraphStyle range : NSMakeRange ( 0 , [ self . contentLabel . text length ])];
    
    self . contentLabel . attributedText = attributedString;
    
    [ self . contentLabel sizeToFit ];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
