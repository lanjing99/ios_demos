//
//  NSString+AttributeNumbers.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/29/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "NSString+AttributeNumbers.h"

@implementation NSString(AttributeNumbers)

//- (instancetype)initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs;
- (NSAttributedString *)xy_attributeStringWithDigitsAttributes:(NSDictionary<NSString *,id> *)numberAttrs andOthersAttributes:(NSDictionary<NSString *,id> *)otherAttrs{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:otherAttrs];
    NSScanner *scaner = [NSScanner scannerWithString:self];
    NSString *digitString = nil;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    while([scaner isAtEnd] == NO){
        //跳转跳转到数字部分，非数字部分不要
        [scaner scanUpToCharactersFromSet:set intoString:NULL];
        //数字部分放入digitString
        [scaner scanCharactersFromSet:set intoString:&digitString];
        
        if(digitString){
            NSAttributedString *digitAttributeString = [[NSAttributedString alloc] initWithString:digitString attributes:numberAttrs];
            NSRange numbersRange = [self rangeOfString:digitString];
            [attributedString replaceCharactersInRange:numbersRange withAttributedString:digitAttributeString];
        }
    }
    
    return attributedString;
}

@end
