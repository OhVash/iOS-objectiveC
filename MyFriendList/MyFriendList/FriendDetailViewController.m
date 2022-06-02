//
//  FriendDetailViewController.m
//  MyFriendList
//
//  Created by Alessandro Vascelli on 29/04/22.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;


@end

@implementation FriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //associamo i valori nome,cognome e email del contatto alla Label
    self.title = self.theFriend.displayName;
    self.firstnameLabel.text = self.theFriend.firstname;
    self.lastnameLabel.text = self.theFriend.lastname;
    self.emailLabel.text = self.theFriend.email;

}
    
    
    
    
@end
