# NSObject(MLSYYModel) Category Reference

&nbsp;&nbsp;**Declared in** NSObject+MLSYYModel.h  

## Overview

Provide some data-model method:

<ul>
<li>Convert json to any object, or convert any object to json.</li>
<li>Set object properties with a key-value dictionary (like KVC).</li>
<li>Implementations of <code>NSCoding</code>, <code>NSCopying</code>, <code>-hash</code> and <code>-isEqual:</code>.</li>
</ul>

See <code>MLSYYModel</code> protocol for custom methods.

Sample Code:

<pre><code> ********************** json convertor *********************
</code></pre>

```
     @interface MLSYYAuthor : NSObject
     @property (nonatomic, strong) NSString <em>name;
     @property (nonatomic, assign) NSDate </em>birthday;
     @end
     @implementation MLSYYAuthor
     @end

<pre><code> @interface MLSYYBook : NSObject
 @property (nonatomic, copy) NSString *name;
 @property (nonatomic, assign) NSUInteger pages;
 @property (nonatomic, strong) MLSYYAuthor *author;
 @end
 @implementation MLSYYBook
 @end

 int main() {
     // create model from json
     MLSYYBook *book = [MLSYYBook mls_modelWithJSON:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];

     // convert model to json
     NSString *json = [book mls_modelToJSONString];
     // {"author":{"name":"J.K.Rowling","birthday":"1965-07-31T00:00:00+0000"},"name":"Harry Potter","pages":256}
 }
</code></pre>

```

<pre><code> ********************** Coding/Copying/hash/equal *********************
</code></pre>

@code
     @interface MLSYYShadow :NSObject &lt;NSCoding, NSCopying>
     @property (nonatomic, copy) NSString *name;
     @property (nonatomic, assign) CGSize size;
     @end

<pre><code> @implementation MLSYYShadow
 - (void)encodeWithCoder:(NSCoder *)aCoder { [self mls_modelEncodeWithCoder:aCoder]; }
 - (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self mls_modelInitWithCoder:aDecoder]; }
 - (id)copyWithZone:(NSZone *)zone { return [self mls_modelCopy]; }
 - (NSUInteger)hash { return [self mls_modelHash]; }
 - (BOOL)isEqual:(id)object { return [self mls_modelIsEqual:object]; }
 @end
</code></pre>

@endcode

## Tasks

### 

[+&nbsp;mls_modelWithJSON:](#//api/name/mls_modelWithJSON:)  

[+&nbsp;mls_modelWithDictionary:](#//api/name/mls_modelWithDictionary:)  

[&ndash;&nbsp;mls_modelSetWithJSON:](#//api/name/mls_modelSetWithJSON:)  

[&ndash;&nbsp;mls_modelSetWithDictionary:](#//api/name/mls_modelSetWithDictionary:)  

[&ndash;&nbsp;mls_modelToJSONObject](#//api/name/mls_modelToJSONObject)  

[&ndash;&nbsp;mls_modelToJSONData](#//api/name/mls_modelToJSONData)  

[&ndash;&nbsp;mls_modelToJSONString](#//api/name/mls_modelToJSONString)  

[&ndash;&nbsp;mls_modelCopy](#//api/name/mls_modelCopy)  

[&ndash;&nbsp;mls_modelEncodeWithCoder:](#//api/name/mls_modelEncodeWithCoder:)  

[&ndash;&nbsp;mls_modelInitWithCoder:](#//api/name/mls_modelInitWithCoder:)  

[&ndash;&nbsp;mls_modelHash](#//api/name/mls_modelHash)  

[&ndash;&nbsp;mls_modelIsEqual:](#//api/name/mls_modelIsEqual:)  

[&ndash;&nbsp;mls_modelDescription](#//api/name/mls_modelDescription)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/mls_modelWithDictionary:" title="mls_modelWithDictionary:"></a>
### mls_modelWithDictionary:

Creates and returns a new instance of the receiver from a key-value dictionary.
This method is thread-safe.

`+ (nullable instancetype)mls_modelWithDictionary:(NSDictionary *)*dictionary*`

#### Parameters

*dictionary*  
&nbsp;&nbsp;&nbsp;A key-value dictionary mapped to the instance&rsquo;s properties.
Any invalid key-value pair in dictionary will be ignored.  

#### Return Value
A new instance created from the dictionary, or nil if an error occurs.

#### Discussion
The key in <code>dictionary</code> will mapped to the reciever&rsquo;s property name,
and the value will set to the property. If the value&rsquo;s type does not match the
property, this method will try to convert the value based on these rules:

<pre><code> `NSString` or `NSNumber` -&gt; c number, such as BOOL, int, long, float, NSUInteger...
 `NSString` -&gt; NSDate, parsed with format "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd".
 `NSString` -&gt; NSURL.
 `NSValue` -&gt; struct or union, such as CGRect, CGSize, ...
 `NSString` -&gt; SEL, Class.
</code></pre>

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelWithJSON:" title="mls_modelWithJSON:"></a>
### mls_modelWithJSON:

Creates and returns a new instance of the receiver from a json.
This method is thread-safe.

`+ (nullable instancetype)mls_modelWithJSON:(id)*json*`

#### Parameters

*json*  
&nbsp;&nbsp;&nbsp;A json object in <code>NSDictionary</code>, <code>NSString</code> or <code>NSData</code>.  

#### Return Value
A new instance created from the json, or nil if an error occurs.

#### Declared In
* `NSObject+MLSYYModel.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/mls_modelCopy" title="mls_modelCopy"></a>
### mls_modelCopy

Copy a instance with the receiver&rsquo;s properties.

`- (nullable id)mls_modelCopy`

#### Return Value
A copied instance, or nil if an error occurs.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelDescription" title="mls_modelDescription"></a>
### mls_modelDescription

Description method for debugging purposes based on properties.

`- (NSString *)mls_modelDescription`

#### Return Value
A string that describes the contents of the receiver.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelEncodeWithCoder:" title="mls_modelEncodeWithCoder:"></a>
### mls_modelEncodeWithCoder:

Encode the receiver&rsquo;s properties to a coder.

`- (void)mls_modelEncodeWithCoder:(NSCoder *)*aCoder*`

#### Parameters

*aCoder*  
&nbsp;&nbsp;&nbsp;An archiver object.  

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelHash" title="mls_modelHash"></a>
### mls_modelHash

Get a hash code with the receiver&rsquo;s properties.

`- (NSUInteger)mls_modelHash`

#### Return Value
Hash code.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelInitWithCoder:" title="mls_modelInitWithCoder:"></a>
### mls_modelInitWithCoder:

Decode the receiver&rsquo;s properties from a decoder.

`- (id)mls_modelInitWithCoder:(NSCoder *)*aDecoder*`

#### Parameters

*aDecoder*  
&nbsp;&nbsp;&nbsp;An archiver object.  

#### Return Value
self

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelIsEqual:" title="mls_modelIsEqual:"></a>
### mls_modelIsEqual:

Compares the receiver with another object for equality, based on properties.

`- (BOOL)mls_modelIsEqual:(id)*model*`

#### Parameters

*model*  
&nbsp;&nbsp;&nbsp;Another object.  

#### Return Value
<code>YES</code> if the reciever is equal to the object, otherwise <code>NO</code>.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelSetWithDictionary:" title="mls_modelSetWithDictionary:"></a>
### mls_modelSetWithDictionary:

Set the receiver&rsquo;s properties with a key-value dictionary.

`- (BOOL)mls_modelSetWithDictionary:(NSDictionary *)*dic*`

#### Parameters

*dic*  
&nbsp;&nbsp;&nbsp;A key-value dictionary mapped to the receiver&rsquo;s properties.
Any invalid key-value pair in dictionary will be ignored.  

#### Return Value
Whether succeed.

#### Discussion
The key in <code>dictionary</code> will mapped to the reciever&rsquo;s property name,
and the value will set to the property. If the value&rsquo;s type doesn&rsquo;t match the
property, this method will try to convert the value based on these rules:

<pre><code> `NSString`, `NSNumber` -&gt; c number, such as BOOL, int, long, float, NSUInteger...
 `NSString` -&gt; NSDate, parsed with format "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd".
 `NSString` -&gt; NSURL.
 `NSValue` -&gt; struct or union, such as CGRect, CGSize, ...
 `NSString` -&gt; SEL, Class.
</code></pre>

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelSetWithJSON:" title="mls_modelSetWithJSON:"></a>
### mls_modelSetWithJSON:

Set the receiver&rsquo;s properties with a json object.

`- (BOOL)mls_modelSetWithJSON:(id)*json*`

#### Parameters

*json*  
&nbsp;&nbsp;&nbsp;A json object of <code>NSDictionary</code>, <code>NSString</code> or <code>NSData</code>, mapped to the
receiver&rsquo;s properties.  

#### Return Value
Whether succeed.

#### Discussion
Any invalid data in json will be ignored.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelToJSONData" title="mls_modelToJSONData"></a>
### mls_modelToJSONData

Generate a json string&rsquo;s data from the receiver&rsquo;s properties.

`- (nullable NSData *)mls_modelToJSONData`

#### Return Value
A json string&rsquo;s data, or nil if an error occurs.

#### Discussion
Any of the invalid property is ignored.
If the reciver is <code>NSArray</code>, <code>NSDictionary</code> or <code>NSSet</code>, it will also convert the
inner object to json string.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelToJSONObject" title="mls_modelToJSONObject"></a>
### mls_modelToJSONObject

Generate a json object from the receiver&rsquo;s properties.

`- (nullable id)mls_modelToJSONObject`

#### Return Value
A json object in <code>NSDictionary</code> or <code>NSArray</code>, or nil if an error occurs.
See [NSJSONSerialization isValidJSONObject] for more information.

#### Discussion
Any of the invalid property is ignored.
If the reciver is <code>NSArray</code>, <code>NSDictionary</code> or <code>NSSet</code>, it just convert
the inner object to json object.

#### Declared In
* `NSObject+MLSYYModel.h`

<a name="//api/name/mls_modelToJSONString" title="mls_modelToJSONString"></a>
### mls_modelToJSONString

Generate a json string from the receiver&rsquo;s properties.

`- (nullable NSString *)mls_modelToJSONString`

#### Return Value
A json string, or nil if an error occurs.

#### Discussion
Any of the invalid property is ignored.
If the reciver is <code>NSArray</code>, <code>NSDictionary</code> or <code>NSSet</code>, it will also convert the
inner object to json string.

#### Declared In
* `NSObject+MLSYYModel.h`

