#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSObject (YYModelMock)

/**
 创建 Mock 数据模型

 @return Mock 模型数据
 */
+ (instancetype)mls_mockModel;

/**
 根据JSON 创建 Mock 数据

 @param json json 数据
 @return Mock 模型数据
 */
+ (instancetype)mls_mockModelWithJSON:(nullable id)json;

/**
 根据字典创建 Mock 数据

 @param dictionary 字典
 @return  Mock 模型数据
 */
+ (instancetype)mls_mockModelWithDictionary:(nullable NSDictionary *)dictionary;

/**
 重置数据

 @param dic dictionary 字典
 @return Mock 模型数据
 */
- (BOOL)mls_mockModelSetWithDictionary:(nullable NSDictionary *)dic;
@end


NS_ASSUME_NONNULL_END
