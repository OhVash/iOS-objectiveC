//
//  Friend.h
//  MyFriendList
//
//  Created by Alessandro Vascelli on 22/04/22.
//

#import <Foundation/Foundation.h>


@interface Friend : NSObject
- (instancetype) initWithFirstname:(NSString *)firstname
                          lastname:(NSString *)lastname
                             email:(NSString *)email
                            avatar:(NSString *)avatar
                         thumbnail:(NSString *)thumbnail;

- (instancetype) initWithFirstname:(NSString *)firstname
                          lastname:(NSString *)lastname
                             email:(NSString *)email
                            avatar:(NSString *)avatar;

- (instancetype) initWithFirstname:(NSString *)firstname
                          lastname:(NSString *)lastname
                             email:(NSString *)email;

- (instancetype) initWithFirstname:(NSString *)firstname
                          lastname:(NSString *)lastname;

@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, readonly) NSString *displayName;

@end

