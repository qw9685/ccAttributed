//
//  NSString+attributed.m
//  链式编程-富文本
//
//  Created by upex on 2020/10/14.
//  Copyright © 2020 upex. All rights reserved.
//

#import "NSString+attributed.h"

@implementation NSString (attributed)

- (NSMutableAttributedString *)cc_Attributed:(void(^)(ccAttributed *make))attributed{
    ccAttributed *make = [ccAttributed cc_string:self];
    attributed(make);
    return make.attributedStringArr;
}

@end
