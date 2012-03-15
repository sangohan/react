//
// React - a library for functional-reactive-like programming
// Copyright (c) 2011, Three Rings Design, Inc. - All rights reserved.
// http://github.com/threerings/react/blob/master/LICENSE

#import "RADoubleValue.h"
#import "RADoubleReactor+Protected.h"

@implementation RADoubleValue {
    double _value;
}

- (double)value { return _value; }

- (void)setValue:(double)value {
    if (value == _value) return;
    _value = value;
    [self dispatchEvent:_value];
}

@end