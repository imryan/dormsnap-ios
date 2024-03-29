//
//  DormsnapTests.m
//  DormsnapTests
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <Specta/Specta.h>
#import "DSFeedViewController.h"

SpecBegin(DSFeedViewController)

describe(@"Thing", ^{
    sharedExamplesFor(@"another shared behavior", ^(NSDictionary *data) {
        // Locally defined shared examples can override global shared examples within its scope.
    });
    
    beforeAll(^{
        // This is run once and only once before all of the examples
        // in this group and before any beforeEach blocks.
    });
    
    beforeEach(^{
        // This is run before each example.
    });
    
    it(@"should do stuff", ^{
        // This is an example block. Place your assertions here.
    });
    
    it(@"should do some stuff asynchronously", ^{
        waitUntil(^(DoneCallback done) {
            // Async example blocks need to invoke done() callback.
            done();
        });
    });
    
    itShouldBehaveLike(@"another shared behavior", ^{
        // Use a block that returns a dictionary if you need the context to be evaluated lazily,
        // e.g. to use an object prepared in a beforeEach block.
        return @{@"key" : @"obj"};
    });
    
    describe(@"Nested examples", ^{
        it(@"should do even more stuff", ^{
            // ...
        });
    });
    
    pending(@"pending example");
    
    pending(@"another pending example", ^{
        // ...
    });
    
    afterEach(^{
        // This is run after each example.
    });
    
    afterAll(^{
        // This is run once and only once after all of the examples
        // in this group and after any afterEach blocks.
    });
});

SpecEnd
