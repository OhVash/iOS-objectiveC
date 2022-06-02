//
//  FriendList.m
//  MyFriendList
//
//  Created by Alessandro Vascelli on 22/04/22.
//

#import "FriendList.h"

@interface FriendList() //all'interno ho metodi privati

@property (nonatomic, strong)NSMutableArray *list;

@end

@implementation FriendList

- (instancetype)init{ //definizione list
    if(self = [super init]){
        _list = [[NSMutableArray alloc ] init];
    }
    return self;
}

- (long)size{
    return self.list.count;
}

- (NSArray *)getAll{ //implementazione get all
    return self.list; //ritorno semplicemente l'intera lista in lettura.
}

- (void)add:(Friend *)f{
    [self.list addObject:f];
}

- (Friend *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}



@end
