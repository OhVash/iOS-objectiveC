//
//  MDCounter.h
//  FirstLab
//
//  Created by Alessandro Vascelli on 01/04/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDCounter : NSObject

-(instancetype)init;
-(instancetype)initWithValue:(NSNumber *)value;

@property (strong, nonatomic) NSNumber *counter;
@property (readonly) int asInt;

-(void)increment;
-(int) asInt;
@end

NS_ASSUME_NONNULL_END
