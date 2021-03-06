//
// React - a library for functional-reactive-like programming
// Copyright (c) 2011, Three Rings Design, Inc. - All rights reserved.
// http://github.com/threerings/react/blob/master/LICENSE

#import "RAIntSignal.h"
#import "RAIntReactor+Protected.h"

@implementation RAIntSignal
- (void)emitEvent:(int)event {
    [self dispatchEvent:event];
}
@end
