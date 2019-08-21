# NSDictionary(MLSYYModel) Category Reference

&nbsp;&nbsp;**Declared in** NSObject+MLSYYModel.h  

## Overview

Provide some data-model method for NSDictionary.

## Tasks

### 

[+&nbsp;mls_modelDictionaryWithClass:json:](#//api/name/mls_modelDictionaryWithClass:json:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/mls_modelDictionaryWithClass:json:" title="mls_modelDictionaryWithClass:json:"></a>
### mls_modelDictionaryWithClass:json:

Creates and returns a dictionary from a json.
This method is thread-safe.

`+ (nullable NSDictionary *)mls_modelDictionaryWithClass:(Class)*cls* json:(id)*json*`

#### Parameters

*cls*  
&nbsp;&nbsp;&nbsp;The value instance&rsquo;s class in dictionary.  

*json*  
&nbsp;&nbsp;&nbsp;A json dictionary of <code>NSDictionary</code>, <code>NSString</code> or <code>NSData</code>.
              Example: {&ldquo;user1&rdquo;:{&ldquo;name&rdquo;,&ldquo;Mary&rdquo;}, &ldquo;user2&rdquo;: {name:&ldquo;Joe&rdquo;}}  

#### Return Value
A dictionary, or nil if an error occurs.

#### Declared In
* `NSObject+MLSYYModel.h`

