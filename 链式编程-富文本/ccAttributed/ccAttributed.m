//
//  ccRichText.m
//  链式编程-富文本
//
//  Created by upex on 2020/10/14.
//  Copyright © 2020 upex. All rights reserved.
//

#import "ccAttributed.h"

@interface ccAttributed ()

@property (nonatomic, strong) NSString *string;

@property (nonatomic, assign) float lineSpacing;
@property (nonatomic, assign) NSLineBreakMode lineBreakMode;
@property (nonatomic, assign) NSTextAlignment alignment;

@end

@implementation ccAttributed

+(instancetype)cc_string:(NSString*)string{
    ccAttributed* attr = [[ccAttributed alloc] init];
    attr.string = string;
    attr.attributedStringArr = [[NSMutableAttributedString alloc] initWithString:string];
    return attr;
}

- (ccAttributed *)cc_merge:(ccAttributed*)attributed{
    [self.attributedStringArr appendAttributedString:attributed.attributedStringArr];
    return self;
}

- (ccAttributed *(^)(UIFont *value))cc_font{
    return [self returnAttributedWithAttributeKey:NSFontAttributeName string:self.string];
}
- (ccAttributed *(^)(NSNumber *number))cc_kern{
    return [self returnAttributedWithAttributeKey:NSKernAttributeName string:self.string];
}
- (ccAttributed *(^)(float value))cc_expansion{
    return [self returnNumberAttributedWithAttributeKey:NSExpansionAttributeName string:self.string];
}
- (ccAttributed *(^)(float value))cc_obliqueness{
    return [self returnNumberAttributedWithAttributeKey:NSObliquenessAttributeName string:self.string];
}
- (ccAttributed *(^)(NSNumber *number))cc_ligature{
    return [self returnAttributedWithAttributeKey:NSLigatureAttributeName string:self.string];
}
- (ccAttributed *(^)(NSString *value))cc_textEffect{
    return [self returnAttributedWithAttributeKey:NSTextEffectAttributeName string:self.string];
}
- (ccAttributed *(^)(UIColor *color))cc_strokeColor{
    return [self returnAttributedWithAttributeKey:NSStrokeColorAttributeName string:self.string];
}
- (ccAttributed *(^)(UIColor *color))cc_foregroundColor{
    return [self returnAttributedWithAttributeKey:NSForegroundColorAttributeName string:self.string];
}

- (ccAttributed *(^)(NSNumber *number))cc_underline{
    return [self returnAttributedWithAttributeKey:NSUnderlineStyleAttributeName string:self.string];
}
- (ccAttributed *(^)(UIColor *color))cc_underlineColor{
    return [self returnAttributedWithAttributeKey:NSUnderlineColorAttributeName string:self.string];
}

- (ccAttributed *(^)(NSNumber *number))cc_strikethrough{
    return [self returnAttributedWithAttributeKey:NSStrikethroughColorAttributeName string:self.string];
}
- (ccAttributed *(^)(UIColor *color))cc_strikethroughColor{
    return [self returnAttributedWithAttributeKey:NSStrikethroughColorAttributeName string:self.string];
}

- (ccAttributed *(^)(NSString *value))cc_link{
    return [self returnAttributedWithAttributeKey:NSLinkAttributeName string:self.string];
}

- (ccAttributed *(^)(NSShadow *shadow))cc_shadow{
    return [self returnAttributedWithAttributeKey:NSShadowAttributeName string:self.string];
}

- (ccAttributed *(^)(UIColor *color))cc_backgroundColor{
    return [self returnAttributedWithAttributeKey:NSBackgroundColorAttributeName string:self.string];
}

- (ccAttributed *(^)(NSNumber *number))cc_baselineOffset{
    return [self returnAttributedWithAttributeKey:NSBaselineOffsetAttributeName string:self.string];
}

- (ccAttributed *(^)(NSTextAttachment *textAttachment))cc_attachment{
    return [self returnAttributedWithAttributeKey:NSAttachmentAttributeName string:self.string];
}

- (ccAttributed *(^)(NSNumber *number))cc_verticalGlyphForm{
    return [self returnAttributedWithAttributeKey:NSVerticalGlyphFormAttributeName string:self.string];
}

- (ccAttributed *(^)(NSParagraphStyle *value))cc_paragraphStyle{
    return [self returnAttributedWithAttributeKey:NSParagraphStyleAttributeName string:self.string];
}

//插入图片(图片，尺寸，位置)
- (ccAttributed *(^)(UIImage *image,CGRect bounds,NSInteger index))cc_insertImage{
    __weak typeof (self) weakSelf = self;
    return ^(UIImage *image,CGRect bounds,NSInteger index)
    {
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        textAttachment.image = image;  //设置图片源
        textAttachment.bounds = bounds; //设置图片位置和大小
        NSAttributedString *coreText2 = [NSAttributedString attributedStringWithAttachment: textAttachment];
        
        [self.attributedStringArr insertAttributedString:coreText2 atIndex:index];
        return weakSelf;
    };
}

- (ccAttributed *(^)(float value))cc_lineSpacing {
    __weak typeof (self) weakSelf = self;
    return ^(float value)
    {
        weakSelf.lineSpacing = value;
        [weakSelf addParagraphStyle];
        return weakSelf;
    };
}
- (ccAttributed *(^)(NSTextAlignment value))cc_textAlignment {
    __weak typeof (self) weakSelf = self;
    return ^(NSTextAlignment value)
    {
        weakSelf.alignment = value;
        [weakSelf addParagraphStyle];
        return weakSelf;
    };
}
- (ccAttributed *(^)(NSLineBreakMode value))cc_lineBreakMode {
    __weak typeof (self) weakSelf = self;
    return ^(NSLineBreakMode value)
    {
        weakSelf.lineBreakMode = value;
        [weakSelf addParagraphStyle];
        return weakSelf;
    };
}

- (void)addParagraphStyle{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = self.lineBreakMode;
    if (self.lineSpacing) {
        style.lineSpacing = self.lineSpacing;
    }
    if (self.alignment) {
        style.alignment = self.alignment;
    }
    [self.attributedStringArr addAttribute: NSParagraphStyleAttributeName
                             value:style
                             range:NSMakeRange(0, self.string.length)];
}

- (ccAttributed *(^)(id value))returnAttributedWithAttributeKey:(NSAttributedStringKey)attributeKey string:(NSString*)string{
    __weak typeof (self) weakSelf = self;
    return ^(id value )
    {
        [self.attributedStringArr addAttribute:attributeKey
                                         value:value
                                         range:NSMakeRange(0, string.length)];
        return weakSelf;
    };
}
- (ccAttributed *(^)(float value))returnNumberAttributedWithAttributeKey:(NSAttributedStringKey)attributeKey string:(NSString*)string{
    __weak typeof (self) weakSelf = self;
    return ^(float value )
    {
        [self.attributedStringArr addAttribute:attributeKey
                                         value:@(value)
                                         range:NSMakeRange(0, string.length)];
        return weakSelf;
    };
}
@end
