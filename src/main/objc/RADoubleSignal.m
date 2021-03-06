//
// React - a library for functional-reactive-like programming
// Copyright (c) 2011, Three Rings Design, Inc. - All rights reserved.
// http://github.com/threerings/react/blob/master/LICENSE

#import "RADoubleSignal.h"
#import "RADoubleReactor+Protected.h"

@implementation RADoubleSignal
- (void)emitEvent:(double)event {
    [self dispatchEvent:event];
}
@end
