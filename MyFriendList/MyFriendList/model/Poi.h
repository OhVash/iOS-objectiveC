//
//  Poi.h
//  MyFriendList
//
//  Created by Alessandro Vascelli on 02/05/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Poi : NSObject

- (instancetype) initWithName:(NSString *)name
                     latitude:(double) latitude
                    longitude:(double) longitude;


@property (nonatomic, strong) NSString *name;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

@end

NS_ASSUME_NONNULL_END
