//
//  MapViewController.m
//  MyFriendList
//
//  Created by Alessandro Vascelli on 02/05/22.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "GeoFriend+MapAnnotation.h"
#import "FriendTableDetailTableViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
-(void) centerMapToLocation:(CLLocationCoordinate2D)location
                       zoom:(double)zoom;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"%s: Got %ld friends", __FUNCTION__, self.friends.count); check per vedere se la segue ha passato i dati
    self.mapView.delegate = self;
    [self centerMapToLocation:CLLocationCoordinate2DMake(44.801700, 10.328012) zoom:0.1]; //centrata rispetto al centro di parma e livello di zoom
    [self.friends enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[GeoFriend class]]){
            GeoFriend *gf = (GeoFriend *) obj;
            [self.mapView addAnnotation:gf];
        }
    }];
}

-(void) centerMapToLocation:(CLLocationCoordinate2D)location
                       zoom:(double)zoom{
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span.latitudeDelta = zoom;
    mapRegion.span.longitudeDelta = zoom;
    [self.mapView setRegion:mapRegion];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *AnnotationIdentifier = @"MapAnnotationView";
    
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    
    if(!view){
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:AnnotationIdentifier];
        view.canShowCallout = YES;
    }
    view.annotation = annotation;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    imageView.image = [UIImage imageNamed:@"userInfo"];
    view.leftCalloutAccessoryView = imageView;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    return view;
}

-(void) mapView:(MKMapView *)mapView didSelectAnnotationView:(nonnull MKAnnotationView *)view{
    if ([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]){
        UIImageView *imageView = (UIImageView *) view.leftCalloutAccessoryView;
        id<MKAnnotation> annotation = view.annotation;
        if([annotation isKindOfClass:[GeoFriend class]]){
            GeoFriend *gf = (GeoFriend *) annotation;
            if(gf.thumbnail != nil){ //se il nostro oggetto ha una thumbnail -> download
                dispatch_queue_t queue = dispatch_queue_create("imageDownload", NULL); //coda di background
                dispatch_async(queue, ^{
                    NSURL *url = [NSURL URLWithString:gf.thumbnail];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data]; //creo immagine con i dati scaricati
                    dispatch_queue_t mainQueue = dispatch_get_main_queue();
                    dispatch_async(mainQueue, ^{
                        imageView.image = image;
                    });
                });
        }
    }
}
}

-(void) mapView:(MKMapView *)mapView
 annotationView:(nonnull MKAnnotationView *)view
calloutAccessoryControlTapped:(nonnull UIControl *)control{
    if([control isEqual:view.rightCalloutAccessoryView]){
        [self performSegueWithIdentifier:@"ShowFriendFromMap" sender:view];
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowFriendFromMap"]){
        if([segue.destinationViewController isKindOfClass:[FriendTableDetailTableViewController class]]){
            FriendTableDetailTableViewController *vc = (FriendTableDetailTableViewController *) segue.destinationViewController;
            if([sender isKindOfClass:[MKAnnotationView class]]){
                MKAnnotationView *view = (MKAnnotationView *)sender;
                id<MKAnnotation> annotation = view.annotation;
                if([annotation isKindOfClass:[Friend class]]){
                    Friend *f = (Friend *)annotation;
                    vc.theFriend = f;
                }
                
            }
        }
    }
}

@end
