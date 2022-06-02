//
//  FriendList_TableViewController.m
//  MyFriendList
//
//  Created by Alessandro Vascelli on 22/04/22.
//

#import "FriendList_TableViewController.h"
#import "FriendList.h"
#import "FriendTableDetailTableViewController.h"
#import "GeoFriend.h"
#import "MapViewController.h"

@interface FriendList_TableViewController ()

@property(nonatomic, strong) FriendList *friends;

-(void) setupData; //metodo per inizializzazione oggetti

@end

@implementation FriendList_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"My Friends";
    
    self.friends = [[FriendList alloc]init];
    
    [self setupData];
}

-(void)setupData{
        [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Lanna" lastname:@"MacKegg" email:@"lmackegg0@nasa.gov" avatar:@"https://robohash.org/dictateneturin.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/dictateneturin.png?size=36x36&set=set1"]];
        [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Georgina" lastname:@"Escala" email:@"gescala1@reference.com" avatar:@"https://robohash.org/porroquiaet.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/porroquiaet.png?size=36x36&set=set1"]];
        [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Rennie" lastname:@"Barthram" email:@"rbarthram2@yolasite.com" avatar:@"https://robohash.org/autdignissimosdolorem.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/autdignissimosdolorem.png?size=36x36&set=set1"]];
        [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Jenilee" lastname:@"Franscioni" email:@"jfranscioni3@cmu.edu" avatar:@"https://robohash.org/sitrepudiandaemollitia.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/sitrepudiandaemollitia.png?size=36x36&set=set1"]];

    
    NSArray *pois = [NSArray arrayWithObjects:
            [[Poi alloc] initWithName:@"Campus" latitude:44.7668024 longitude:10.3155069],
            [[Poi alloc] initWithName:@"Parco Ducale" latitude:44.8033536 longitude:10.3180389],
            [[Poi alloc] initWithName:@"Cittadella" latitude:44.794157 longitude:10.3228454],
            [[Poi alloc] initWithName:@"Stazione" latitude:44.803993 longitude:10.3222875],
            nil];
    
    for(int i=0; i<self.friends.size; i++){
        Friend *f = [self.friends getAtIndex:i];
        if([f isKindOfClass:[GeoFriend class]]){
            GeoFriend *gf = (GeoFriend *)f;
            gf.location = [pois objectAtIndex:i];
        }
        
    }
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.friends getAll].count;
    return self.friends.size;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    
    Friend *f = [self.friends getAtIndex:indexPath.row]; //ins
    // Configure the cell...
    
    cell.textLabel.text = f.displayName;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"ShowFriendDetail"]){
        if([segue.destinationViewController isKindOfClass:[FriendTableDetailTableViewController class]]){
            FriendTableDetailTableViewController *vc = (FriendTableDetailTableViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Friend *f = [self.friends getAtIndex:indexPath.row];
            vc.theFriend = f; //dato passato dal view controller di partenza a quello di arrivo.
        }
    }
    if([segue.identifier isEqualToString:@"ShowMap"]){
        if([segue.destinationViewController isKindOfClass:[MapViewController class]]){
            MapViewController *vc = (MapViewController *) segue.destinationViewController;
            
            //vc.friends = [self.friends getAll]; QUI INSERIAMO TUTTI I FRIEND
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            [[self.friends getAll] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            if([obj isKindOfClass:[GeoFriend class]]){
                               [mArray addObject:obj];
                            }
            }];
            vc.friends = mArray; //QUI INSERIAMO OGGETTI SOLO DI CLASSE GEOFRIEND
        }
    }
}

@end
