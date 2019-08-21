# MLSYYModel Protocol Reference

&nbsp;&nbsp;**Conforms to** NSObject  
&nbsp;&nbsp;**Declared in** NSObject+MLSYYModel.h  

## Overview

If the default model transform does not fit to your model class, implement one or
more method in this protocol to change the default key-value transform process.
There&rsquo;s no need to add &lsquo;<MLSYYModel>&rsquo; to your class header.

## Tasks

### 

[+&nbsp;modelCustomPropertyMapper](#//api/name/modelCustomPropertyMapper)  

[+&nbsp;modelContainerPropertyGenericClass](#//api/name/modelContainerPropertyGenericClass)  

[+&nbsp;modelCustomClassForDictionary:](#//api/name/modelCustomClassForDictionary:)  

[+&nbsp;modelPropertyBlacklist](#//api/name/modelPropertyBlacklist)  

[+&nbsp;modelPropertyWhitelist](#//api/name/modelPropertyWhitelist)  

[&ndash;&nbsp;modelCustomWillTransformFromDictionary:](#//api/name/modelCustomWillTransformFromDictionary:)  

[&ndash;&nbsp;modelCustomTransformFromDictionary:](#//api/name/modelCustomTransformFromDictionary:)  

[&ndash;&nbsp;modelCustomTransformToDictionary:](#//api/name/modelCustomTransformToDictionary:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/modelContainerPropertyGenericClass" title="modelContainerPropertyGenericClass"></a>
### modelContainerPropertyGenericClass

The generic class mapper for container properties.

`+ (nullable NSDictionary&lt;NSString*,id&gt; *)modelContainerPropertyGenericClass`

#### Return Value
A class mapper.

#### Discussion
If the property is a container object, such as NSArray/NSSet/NSDictionary,
implements this method and returns a property->class mapper, tells which kind of
object will be add to the array/set/dictionary.

  Example:
  @code
        @class MLSYYShadow, MLSYYBorder, MLSYYAttachment;

<pre><code>    @interface MLSYYAttributes
    @property NSString *name;
    @property NSArray *shadows;
    @property NSSet *borders;
    @property NSDictionary *attachments;
    @end

    @implementation MLSYYAttributes
    + (NSDictionary *)modelContainerPropertyGenericClass {
        return @{@"shadows" : [MLSYYShadow class],
                 @"borders" : MLSYYBorder.class,
                 @"attachments" : @"MLSYYAttachment" };
    }
    @end
</code></pre>

  @endcode

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/modelCustomClassForDictionary:" title="modelCustomClassForDictionary:"></a>
### modelCustomClassForDictionary:

If you need to create instances of different classes during json->object transform,
use the method to choose custom class based on dictionary data.

`+ (nullable Class)modelCustomClassForDictionary:(NSDictionary *)*dictionary*`

#### Parameters

*dictionary*  
&nbsp;&nbsp;&nbsp;The json/kv dictionary.  

#### Return Value
Class to create from this dictionary, <code>nil</code> to use current class.

#### Discussion
If the model implements this method, it will be called to determine resulting class
during <code>+modelWithJSON:</code>, <code>+modelWithDictionary:</code>, conveting object of properties of parent objects
(both singular and containers via <a href="#//api/name/modelContainerPropertyGenericClass"><code>modelContainerPropertyGenericClass</code></a>).

Example:
@code
        @class MLSYYCircle, MLSYYRectangle, MLSYYLine;

<pre><code>    @implementation MLSYYShape

    + (Class)modelCustomClassForDictionary:(NSDictionary*)dictionary {
        if (dictionary[@"radius"] != nil) {
            return [MLSYYCircle class];
        } else if (dictionary[@"width"] != nil) {
            return [MLSYYRectangle class];
        } else if (dictionary[@"y2"] != nil) {
            return [MLSYYLine class];
        } else {
            return [self class];
        }
    }

    @end
</code></pre>

@endcode

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/modelCustomPropertyMapper" title="modelCustomPropertyMapper"></a>
### modelCustomPropertyMapper

Custom property mapper.

`+ (nullable NSDictionary&lt;NSString*,id&gt; *)modelCustomPropertyMapper`

#### Return Value
A custom mapper for properties.

#### Discussion
If the key in JSON/Dictionary does not match to the model&rsquo;s property name,
implements this method and returns the additional mapper.

Example:

<pre><code>json: 
    {
        "n":"Harry Pottery",
        "p": 256,
        "ext" : {
            "desc" : "A book written by J.K.Rowling."
        },
        "ID" : 100010
    }

model:
@code
    @interface MLSYYBook : NSObject
    @property NSString *name;
    @property NSInteger page;
    @property NSString *desc;
    @property NSString *bookID;
    @end

    @implementation MLSYYBook
    + (NSDictionary *)modelCustomPropertyMapper {
        return @{@"name"  : @"n",
                 @"page"  : @"p",
                 @"desc"  : @"ext.desc",
                 @"bookID": @[@"id", @"ID", @"book_id"]};
    }
    @end
 @endcode
</code></pre>

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/modelPropertyBlacklist" title="modelPropertyBlacklist"></a>
### modelPropertyBlacklist

All the properties in blacklist will be ignored in model transform process.
Returns nil to ignore this feature.

`+ (nullable NSArray&lt;NSString*&gt; *)modelPropertyBlacklist`

#### Return Value
An array of property&rsquo;s name.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/modelPropertyWhitelist" title="modelPropertyWhitelist"></a>
### modelPropertyWhitelist

If a property is not in the whitelist, it will be ignored in model transform process.
Returns nil to ignore this feature.

`+ (nullable NSArray&lt;NSString*&gt; *)modelPropertyWhitelist`

#### Return Value
An array of property&rsquo;s name.

#### Declared In
* `NSObject+MLSYYModel.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/modelCustomTransformFromDictionary:" title="modelCustomTransformFromDictionary:"></a>
### modelCustomTransformFromDictionary:

If the default json-to-model transform does not fit to your model object, implement
this method to do additional process. You can also use this method to validate the
model&rsquo;s properties.

`- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)*dic*`

#### Parameters

*dic*  
&nbsp;&nbsp;&nbsp;The json/kv dictionary.  

#### Return Value
Returns YES if the model is valid, or NO to ignore this model.

#### Discussion
If the model implements this method, it will be called at the end of
<code>+modelWithJSON:</code>, <code>+modelWithDictionary:</code>, <code>-modelSetWithJSON:</code> and <code>-modelSetWithDictionary:</code>.
If this method returns NO, the transform process will ignore this model.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/modelCustomTransformToDictionary:" title="modelCustomTransformToDictionary:"></a>
### modelCustomTransformToDictionary:

If the default model-to-json transform does not fit to your model class, implement
this method to do additional process. You can also use this method to validate the
json dictionary.

`- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)*dic*`

#### Parameters

*dic*  
&nbsp;&nbsp;&nbsp;The json dictionary.  

#### Return Value
Returns YES if the model is valid, or NO to ignore this model.

#### Discussion
If the model implements this method, it will be called at the end of
<code>-modelToJSONObject</code> and <code>-modelToJSONString</code>.
If this method returns NO, the transform process will ignore this json dictionary.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/modelCustomWillTransformFromDictionary:" title="modelCustomWillTransformFromDictionary:"></a>
### modelCustomWillTransformFromDictionary:

This method&rsquo;s behavior is similar to <code>- (BOOL)</code>modelCustomTransformFromDictionary:<code>(NSDictionary *)dic;</code>,
but be called before the model transform.

`- (NSDictionary *)modelCustomWillTransformFromDictionary:(NSDictionary *)*dic*`

#### Parameters

*dic*  
&nbsp;&nbsp;&nbsp;The json/kv dictionary.  

#### Return Value
Returns the modified dictionary, or nil to ignore this model.

#### Discussion
If the model implements this method, it will be called before
<code>+modelWithJSON:</code>, <code>+modelWithDictionary:</code>, <code>-modelSetWithJSON:</code> and <code>-modelSetWithDictionary:</code>.
If this method returns nil, the transform process will ignore this model.

#### Declared In
* `NSObject+MLSYYModel.h`

