//
//  Game.m
//  SpaceInvaders
//
//  Created by luowei on 14-6-4.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "Game.h"

int heroMovement;
int bulletMovement;
int bulletOnScreen;

@interface Game (){
    NSTimer *movementTimer;
}
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *exit;
@property (weak, nonatomic) IBOutlet UIButton *shoot;

@property (weak, nonatomic) IBOutlet UIImageView *bullet;
@property (weak, nonatomic) IBOutlet UIImageView *hero;
@end

@implementation Game

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{\
    
    //获得touch的焦点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if(point.x < 160){
        heroMovement = -7;
    }else{
        heroMovement = 7;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    heroMovement = 0;
    
}

-(void)movement{
    _hero.center = CGPointMake(_hero.center.x+heroMovement, _hero.center.y);
    _bullet.center = CGPointMake(_bullet.center.x, _bullet.center.y-bulletMovement);
    
    if(_bullet.center.y < 0){
        _bullet.hidden = YES;
        bulletOnScreen = 0;
        bulletMovement = 0;
    }
}

- (IBAction)start:(id)sender {
    _start.hidden = YES;
    _exit.hidden = YES;
    _shoot.hidden = NO;
    
    movementTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(movement) userInfo:nil repeats:YES];
    
}

- (IBAction)shoot:(id)sender {
    if(bulletOnScreen == 0){
        _bullet.hidden = NO;
        _bullet.center = CGPointMake(_hero.center.x, 482);
        bulletOnScreen += 1;
        bulletMovement = 7;
    }
}

- (IBAction)exit:(id)sender {
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _bullet.hidden = YES;
    _shoot.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
