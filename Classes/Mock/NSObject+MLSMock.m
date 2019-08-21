//
//  NSObject+YYModel.m
//  YYModel <https://github.com/ibireme/YYModel>
//
//  Created by ibireme on 15/5/10.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSObject+MLSMock.h"
#import "NSObject+MLSYYModel.h"
#import "MLSYYClassInfo.h"
#import <objc/message.h>
#import "MLSYYModelModifyPrivate.h"


#define MLS_MOCK_DEFAULT_LENGTH  8

@interface NSString (MLSMockRandom)
+ (NSString *)defaultAlphabet;
+ (id)randomizedString;
+ (id)randomizedStringLength:(NSUInteger)len;
+ (id)randomizedStringWithAlphabet:(NSString *)alphabet;
+ (id)randomizedStringWithAlphabet:(NSString *)alphabet length:(NSUInteger)len;
- (id)initWithDefaultAlphabet;
- (id)initWithAlphabet:(NSString *)alphabet;
- (id)initWithAlphabet:(NSString *)alphabet length:(NSUInteger)len;
@end
@implementation NSString (MLSMockRandom)
+ (NSString *)defaultAlphabet {
    return @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
}

+ (id)randomizedString {
    return [self randomizedStringWithAlphabet:[self defaultAlphabet] length:arc4random_uniform(50)];
}
+ (id)randomizedStringLength:(NSUInteger)len {
    return [self randomizedStringWithAlphabet:[self defaultAlphabet] length:len];
}
+ (id)randomizedStringWithAlphabet:(NSString*)alphabet {
    return [self randomizedStringWithAlphabet:alphabet length:MLS_MOCK_DEFAULT_LENGTH];
}

+ (id)randomizedStringWithAlphabet:(NSString*)alphabet
                            length:(NSUInteger)len {
    return [[self alloc] initWithAlphabet:alphabet length:len];
}

- (id)initWithDefaultAlphabet {
    return [self initWithAlphabet:[NSString defaultAlphabet]];
}

- (id)initWithAlphabet:(NSString*)alphabet {
    return [self initWithAlphabet:alphabet length:MLS_MOCK_DEFAULT_LENGTH];
}

- (id)initWithAlphabet:(NSString*)alphabet
                length:(NSUInteger)len {
    NSMutableString *s = [NSMutableString stringWithCapacity:len];
    for (NSUInteger i = 0U; i < len; i++)
    {
        u_int32_t r = arc4random() % [alphabet length];
        unichar   c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return [self initWithString:s];
}
@end

@implementation NSObject (YYModelMock)
+ (NSDictionary *)_mls_add_dictionaryWithJSON:(id)json {
    if (!json || json == (id)kCFNull) return nil;
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    } else if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding : NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]]) dic = nil;
    }
    return dic;
}
+ (instancetype)mls_mockModel {
    return [self mls_mockModelWithJSON:nil];
}
+ (instancetype)mls_mockModelWithJSON:(id)json {
    NSDictionary *dic = [self _mls_add_dictionaryWithJSON:json];
    return [self mls_mockModelWithDictionary:dic];
}
+ (instancetype)mls_mockModelWithDictionary:(NSDictionary *)dictionary {
    
    Class cls = [self class];
    _MLSYYModelMeta *modelMeta = [_MLSYYModelMeta metaWithClass:cls];
    if (modelMeta->_hasCustomClassFromDictionary) {
        cls = [cls modelCustomClassForDictionary:dictionary] ?: cls;
    }
    
    NSObject *one = [cls new];
    if ([one mls_mockModelSetWithDictionary:dictionary]) return one;
    return nil;
}
- (BOOL)mls_mockModelSetWithDictionary:(NSDictionary *)dic {
    if (dic == nil) {
        dic = @{};
    }
    _MLSYYModelMeta *modelMeta = [_MLSYYModelMeta metaWithClass:object_getClass(self)];
    if (modelMeta->_keyMappedCount == 0) return NO;
    
    if (modelMeta->_hasCustomWillTransformFromDictionary) {
        dic = [((id<MLSYYModel>)self) modelCustomWillTransformFromDictionary:dic];
    }
    
    MLModelSetContext context = {0};
    context.modelMeta = (__bridge void *)(modelMeta);
    context.model = (__bridge void *)(self);
    context.dictionary = (__bridge void *)(dic);
    
//    if (modelMeta->_keyMappedCount >= CFDictionaryGetCount((CFDictionaryRef)dic)) {
//        CFDictionaryApplyFunction((CFDictionaryRef)dic, ModelSetMockWithDictionaryFunction, &context);
//        if (modelMeta->_keyPathPropertyMetas) {
//            CFArrayApplyFunction((CFArrayRef)modelMeta->_keyPathPropertyMetas,
//                                 CFRangeMake(0, CFArrayGetCount((CFArrayRef)modelMeta->_keyPathPropertyMetas)),
//                                 ModelSetMockWithPropertyMetaArrayFunction,
//                                 &context);
//        }
//        if (modelMeta->_multiKeysPropertyMetas) {
//            CFArrayApplyFunction((CFArrayRef)modelMeta->_multiKeysPropertyMetas,
//                                 CFRangeMake(0, CFArrayGetCount((CFArrayRef)modelMeta->_multiKeysPropertyMetas)),
//                                 ModelSetMockWithPropertyMetaArrayFunction,
//                                 &context);
//        }
//    } else {
        CFArrayApplyFunction((CFArrayRef)modelMeta->_allPropertyMetas,
                             CFRangeMake(0, modelMeta->_keyMappedCount),
                             MLModelSetWithPropertyMetaArrayFunction,
                             &context);
//    }
    
    if (modelMeta->_hasCustomTransformFromDictionary) {
        return [((id<MLSYYModel>)self) modelCustomTransformFromDictionary:dic];
    }
    return YES;
}
@end
