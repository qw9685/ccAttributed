//
//  NSString+attributed.h
//  链式编程-富文本
//
//  Created by upex on 2020/10/14.
//  Copyright © 2020 upex. All rights reserved.

#import <Foundation/Foundation.h>
#import "ccAttributed.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (attributed)

- (NSMutableAttributedString *)cc_Attributed:(void(^)(ccAttributed *make))attributed;

@end

NS_ASSUME_NONNULL_END
