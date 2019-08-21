# MLSModelValidProtocol Protocol Reference

&nbsp;&nbsp;**Conforms to** NSObject  
&nbsp;&nbsp;**Declared in** MLSBaseModel.h  

## Overview

校验该模型本身是否可用

## Tasks

### 

[&ndash;&nbsp;isValid](#//api/name/isValid)  *required method*

[&ndash;&nbsp;validError](#//api/name/validError)  *required method*

[&ndash;&nbsp;nonnullDefaultValueProperties](#//api/name/nonnullDefaultValueProperties)  *required method*

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/isValid" title="isValid"></a>
### isValid

是否有效

`- (BOOL)isValid`

#### Return Value
是否有效

#### Declared In
* `MLSBaseModel.h`

<a name="//api/name/nonnullDefaultValueProperties" title="nonnullDefaultValueProperties"></a>
### nonnullDefaultValueProperties

不允许为空的属性

`- (nullable NSDictionary&lt;NSString*,id&gt; *)nonnullDefaultValueProperties`

#### Return Value
如果 key 为空，则取对应 key 的默认 value 赋值

#### Declared In
* `MLSBaseModel.h`

<a name="//api/name/validError" title="validError"></a>
### validError

错误信息

`- (nullable NSError *)validError`

#### Declared In
* `MLSBaseModel.h`

