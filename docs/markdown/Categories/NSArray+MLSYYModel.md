# NSArray(MLSYYModel) Category Reference

&nbsp;&nbsp;**Declared in** NSObject+MLSYYModel.h  

## Overview

Provide some data-model method for NSArray.

## Tasks

### 

[+&nbsp;mls_modelArrayWithClass:json:](#//api/name/mls_modelArrayWithClass:json:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/mls_modelArrayWithClass:json:" title="mls_modelArrayWithClass:json:"></a>
### mls_modelArrayWithClass:json:

Creates and returns an array from a json-array.
This method is thread-safe.

`+ (nullable NSArray *)mls_modelArrayWithClass:(Class)*cls* json:(id)*json*`

#### Parameters

*cls*  
&nbsp;&nbsp;&nbsp;The instance&rsquo;s class in array.  

*json*  
&nbsp;&nbsp;&nbsp;A json array of <code>NSArray</code>, <code>NSString</code> or <code>NSData</code>.
              Example: [{&ldquo;name&rdquo;:&ldquo;Mary&rdquo;},{name:&ldquo;Joe&rdquo;}]  

#### Return Value
A array, or nil if an error occurs.

#### Declared In
* `NSObject+MLSYYModel.h`

