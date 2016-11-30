//
//  NSString+AttributeNumbers.h
//  TakenFreeCell
//
//  Created by 陈文经 on 11/29/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(AttributeNumbers)

- (NSAttributedString *)xy_attributeStringWithDigitsAttributes:(NSDictionary<NSString *,id> *)numberAttrs andOthersAttributes:(NSDictionary<NSString *,id> *)otherAttrs;

@end
