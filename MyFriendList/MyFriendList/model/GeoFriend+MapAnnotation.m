//
//  GeoFriend+MapAnnotation.m
//  MyFriendList
//
//  Created by Alessandro Vascelli on 04/05/22.
//

#import "GeoFriend+MapAnnotation.h"

@implementation GeoFriend (MapAnnotation)

-(CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.location.latitude;
    coordinate.longitude = self.location.longitude;
    return coordinate;
    
}

-(NSString *)title{
    return self.displayName;
}

@end
