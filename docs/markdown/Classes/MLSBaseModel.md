# MLSBaseModel Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Conforms to** <a href="../Protocols/MLSModelValidProtocol.html">MLSModelValidProtocol</a><br />  
<a href="../Protocols/MLSYYModel.html">MLSYYModel</a>  
&nbsp;&nbsp;**Declared in** MLSBaseModel.h  

## Overview

Model 基类，所有继承置该基类的模型，均可自动归解档

## Tasks

### AutoCoding Methods

[+&nbsp;mls_codableProperties](#//api/name/mls_codableProperties)  

[&ndash;&nbsp;mls_codableProperties](#//api/name/mls_codableProperties)  

[&ndash;&nbsp;mls_setWithCoder:](#//api/name/mls_setWithCoder:)  

[&ndash;&nbsp;mls_dictionaryRepresentation](#//api/name/mls_dictionaryRepresentation)  

[+&nbsp;mls_objectWithContentsOfFile:](#//api/name/mls_objectWithContentsOfFile:)  

[&ndash;&nbsp;mls_writeToFile:atomically:](#//api/name/mls_writeToFile:atomically:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/mls_codableProperties" title="mls_codableProperties"></a>
### mls_codableProperties

可归解档属性字典
key 为属性名
value 为属性 Class

`+ (NSDictionary *)mls_codableProperties`

#### Return Value
属性字典

#### Declared In
* `MLSBaseModel.h`

<a name="//api/name/mls_objectWithContentsOfFile:" title="mls_objectWithContentsOfFile:"></a>
### mls_objectWithContentsOfFile:

通过 plist文件创建对象

`+ (nullable instancetype)mls_objectWithContentsOfFile:(NSString *)*path*`

#### Parameters

*path*  
&nbsp;&nbsp;&nbsp;文件路径  

#### Return Value
创建好并赋值后的对象

#### Declared In
* `MLSBaseModel.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/mls_codableProperties" title="mls_codableProperties"></a>
### mls_codableProperties

`- (NSDictionary *)mls_codableProperties`

<a name="//api/name/mls_dictionaryRepresentation" title="mls_dictionaryRepresentation"></a>
### mls_dictionaryRepresentation

对象序列化为字典

`- (NSDictionary *)mls_dictionaryRepresentation`

#### Return Value
对象字典

#### Declared In
* `MLSBaseModel.h`

<a name="//api/name/mls_setWithCoder:" title="mls_setWithCoder:"></a>
### mls_setWithCoder:

根据归档数据解档并赋值

`- (void)mls_setWithCoder:(NSCoder *)*aDecoder*`

#### Parameters

*aDecoder*  
&nbsp;&nbsp;&nbsp;解档数据  

#### Declared In
* `MLSBaseModel.h`

<a name="//api/name/mls_writeToFile:atomically:" title="mls_writeToFile:atomically:"></a>
### mls_writeToFile:atomically:

写入到本地文件系统中

`- (BOOL)mls_writeToFile:(NSString *)*filePath* atomically:(BOOL)*useAuxiliaryFile*`

#### Parameters

*filePath*  
&nbsp;&nbsp;&nbsp;文件路径  

*useAuxiliaryFile*  
&nbsp;&nbsp;&nbsp;是否是原子性  

#### Return Value
是否写入成功

#### Declared In
* `MLSBaseModel.h`

