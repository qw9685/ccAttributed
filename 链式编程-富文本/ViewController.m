//
//  ViewController.m
//  链式编程-富文本
//
//  Created by upex on 2020/10/14.
//  Copyright © 2020 upex. All rights reserved.
//

#import "ViewController.h"
#import "attributedHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(70, 100, 200, 500)];
    label.text = @"1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890";
    label.numberOfLines = 0;
    [self.view addSubview:label];
        
    label.attributedText = [label.text cc_Attributed:^(ccAttributed * _Nonnull make) {
        make.cc_lineSpacing(20).cc_textAlignment(NSTextAlignmentLeft).cc_lineBreakMode(NSLineBreakByCharWrapping);
    }];
}
@end
