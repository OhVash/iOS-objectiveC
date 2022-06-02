//
//  ViewController.m
//  FirstLab
//
//  Created by Alessandro Vascelli on 01/04/22.
//

#import "ViewController.h"
#import "MDCounter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property(strong, nonatomic) MDCounter *counter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.counterLabel.text = @"-";
    self.counter = [[MDCounter alloc]init];
}
- (IBAction)buttonPressed {
    //NSLog(@"Tapped Event!");
    [self.counter increment];
    self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.asInt];
    //self.counter.counter.intValue];
    //self.counter = @(self.counter.intValue + 1);
    //equivalente a [self setCounter:@(self.counter.intValue + 1)];
    //self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.intValue];
}

/*-(void)setCounter:(NSNumber *)counter{
    _counter=@(_counter.intValue + 1);
    self.counterLabel.text = [NSString stringWithFormat:@"%d", _counter.intValue];
}*/


@end
