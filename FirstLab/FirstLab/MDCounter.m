//
//  MDCounter.m
//  FirstLab
//
//  Created by Alessandro Vascelli on 01/04/22.
//

#import "MDCounter.h"

@implementation MDCounter

-(instancetype)initWithValue:(NSNumber *)value{
    if(self = [super init]){
        _counter=@(value.intValue);
    }
    return self;
}

-(instancetype)init{
    return [self initWithValue:@(0)];
}

-(void)increment{
    self.counter = @(self.counter.intValue + 1);
}
-(int) asInt{
    return self.counter.intValue;
}

@end
