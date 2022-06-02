//
//  FriendTableDetailTableViewController.m
//  MyFriendList
//
//  Created by Alessandro Vascelli on 02/05/22.
//

#import "FriendTableDetailTableViewController.h"

@interface FriendTableDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstnameLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastnameLabel;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;



@end

@implementation FriendTableDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.theFriend.displayName;
    self.firstnameLabel.text = self.theFriend.firstname;
    self.lastnameLabel.text = self.theFriend.lastname;
    self.emailLabel.text = self.theFriend.email;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch(section){
        case 0: return @"Dati Anagrafici";
        case 1: return @"Contatti";
        default: return nil;
    }
}

@end
