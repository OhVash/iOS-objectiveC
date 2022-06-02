//
//  GeoFriend.h
//  MyFriendList
//
//  Created by Alessandro Vascelli on 02/05/22.
//

#import "Friend.h"
#import "Poi.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeoFriend : Friend

@property (nonatomic, strong) Poi *location;

@end

NS_ASSUME_NONNULL_END
