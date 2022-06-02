//
//  FriendList.h
//  MyFriendList
//
//  Created by Alessandro Vascelli on 22/04/22.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendList : NSObject

- (long)size;
- (NSArray *)getAll;
- (void)add:(Friend *)f;
- (Friend *)getAtIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
