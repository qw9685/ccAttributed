//
//  ccRichText.h
//  链式编程-富文本
//
//  Created by upex on 2020/10/14.
//  Copyright © 2020 upex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ccAttributed : NSObject

@property (nonatomic, strong) NSMutableAttributedString *attributedStringArr;

+(instancetype)cc_string:(NSString*)string;//初始化

- (ccAttributed *)cc_merge:(ccAttributed*)attributed;//合并富文本

- (ccAttributed *(^)(UIFont *value))cc_font;//字体
- (ccAttributed *(^)(NSNumber *number))cc_kern;//字符间隔
- (ccAttributed *(^)(float value))cc_expansion;//字体扁平化
- (ccAttributed *(^)(float value))cc_obliqueness;//字体倾斜
- (ccAttributed *(^)(NSNumber *number))cc_ligature;//字符连体
- (ccAttributed *(^)(NSString *value))cc_textEffect;//文字效果
- (ccAttributed *(^)(UIColor *color))cc_strokeColor;//描绘边颜色
- (ccAttributed *(^)(UIColor *color))cc_foregroundColor;//文字颜色

- (ccAttributed *(^)(NSNumber *number))cc_underline;//下划线
- (ccAttributed *(^)(UIColor *color))cc_underlineColor;//下划线颜色

- (ccAttributed *(^)(NSNumber *number))cc_strikethrough;//删除线
- (ccAttributed *(^)(UIColor *color))cc_strikethroughColor;//删除线颜色

- (ccAttributed *(^)(NSString *value))cc_link;//链接

- (ccAttributed *(^)(NSShadow *shadow))cc_shadow;//阴影

- (ccAttributed *(^)(UIColor *color))cc_backgroundColor;//背景色

- (ccAttributed *(^)(NSNumber *number))cc_baselineOffset;//基础偏移量

- (ccAttributed *(^)(NSTextAttachment *textAttachment))cc_attachment;//附属

- (ccAttributed *(^)(NSNumber *number))cc_verticalGlyphForm;//垂直或者水平，0表示水平，1垂直

- (ccAttributed *(^)(NSParagraphStyle *value))cc_paragraphStyle;//绘图的风格（居中，换行模式，间距等诸多风格）

//插入图片(图片，尺寸，位置)
- (ccAttributed *(^)(UIImage *image,CGRect bounds,NSInteger index))cc_insertImage;

- (ccAttributed *(^)(float value))cc_lineSpacing;//行间距
- (ccAttributed *(^)(NSTextAlignment value))cc_textAlignment;//对齐方式
- (ccAttributed *(^)(NSLineBreakMode value))cc_lineBreakMode;//字符类型

@end

NS_ASSUME_NONNULL_END
