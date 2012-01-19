//
// React - a library for functional-reactive-like programming
// Copyright (c) 2011, Three Rings Design, Inc. - All rights reserved.
// http://github.com/threerings/react/blob/master/LICENSE

#import "RAIntSignal.h"
#import "RAReactor+Protected.h"
#import "RAConnection+Package.h"

@implementation RAIntSignal
- (void) emitEvent:(int)event {
    for (RAConnection *cur = [self prepareForEmission]; cur != nil; cur = cur->next) {
        ((RAIntSlot)cur->block)(event);
        if (cur->oneShot) [cur disconnect];
    }
    [self finishEmission];
}

- (RAConnection*) connectSlot:(RAIntSlot)block {
    return [self withPriority:RA_DEFAULT_PRIORITY connectSlot:block];
}

- (RAConnection*) withPriority:(int)priority connectSlot:(RAIntSlot)block {
    return [self connectConnection:[[RAConnection alloc] initWithBlock:[block copy] atPriority:priority onReactor:self]];
}

- (RAConnection*) connectUnit:(RAUnitBlock)block {
    return [self withPriority:RA_DEFAULT_PRIORITY connectUnit:block];
}

- (RAConnection*) withPriority:(int)priority connectUnit:(RAUnitBlock)block {
    return [self withPriority:priority connectSlot:^(int event) { block(); }];
}
@end
