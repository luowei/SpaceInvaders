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
int monsterKilled;
BOOL monster1Hit;
BOOL monster2Hit;
BOOL monster3Hit;
BOOL monster4Hit;
BOOL monster5Hit;
BOOL monster6Hit;
BOOL monster7Hit;
BOOL monster8Hit;
BOOL monster9Hit;
BOOL monster10Hit;

@interface Game (){
    NSTimer *movementTimer;
}
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *exit;
@property (weak, nonatomic) IBOutlet UIButton *shoot;

@property (weak, nonatomic) IBOutlet UIImageView *bullet;
@property (weak, nonatomic) IBOutlet UIImageView *hero;


@property (weak, nonatomic) IBOutlet UIImageView *monster1;
@property (weak, nonatomic) IBOutlet UIImageView *monster2;
@property (weak, nonatomic) IBOutlet UIImageView *monster3;
@property (weak, nonatomic) IBOutlet UIImageView *monster4;
@property (weak, nonatomic) IBOutlet UIImageView *monster5;
@property (weak, nonatomic) IBOutlet UIImageView *monster6;
@property (weak, nonatomic) IBOutlet UIImageView *monster7;
@property (weak, nonatomic) IBOutlet UIImageView *monster8;
@property (weak, nonatomic) IBOutlet UIImageView *monster9;
@property (weak, nonatomic) IBOutlet UIImageView *monster10;

@end

@implementation Game

-(void)monsterKilled{
    monsterKilled += 1;
    bulletOnScreen = 0;
    _bullet.hidden = YES;
    bulletMovement = 0;
    _bullet.center = CGPointMake(200, 560);
}

-(void)collision{
    if(CGRectIntersectsRect(_bullet.frame, _monster1.frame) && monster1Hit == NO){
        monster1Hit = YES;
        _monster1.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster2.frame) && monster1Hit == NO){
        monster2Hit = YES;
        _monster2.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster3.frame) && monster3Hit == NO){
        monster3Hit = YES;
        _monster3.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster4.frame) && monster4Hit == NO){
        monster4Hit = YES;
        _monster4.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster5.frame) && monster5Hit == NO){
        monster5Hit = YES;
        _monster5.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster5.frame) && monster5Hit == NO){
        monster5Hit = YES;
        _monster5.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster6.frame) && monster6Hit == NO){
        monster6Hit = YES;
        _monster6.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster7.frame) && monster7Hit == NO){
        monster7Hit = YES;
        _monster7.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster8.frame) && monster8Hit == NO){
        monster8Hit = YES;
        _monster8.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster9.frame) && monster9Hit == NO){
        monster9Hit = YES;
        _monster9.hidden = YES;
        [self monsterKilled];
    }
    if(CGRectIntersectsRect(_bullet.frame, _monster10.frame) && monster10Hit == NO){
        monster10Hit = YES;
        _monster10.hidden = YES;
        [self monsterKilled];
    }
}

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
    [self collision];
    
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
    
    _monster1.hidden = NO;
    _monster2.hidden = NO;
    _monster3.hidden = NO;
    _monster4.hidden = NO;
    _monster5.hidden = NO;
    _monster6.hidden = NO;
    _monster7.hidden = NO;
    _monster8.hidden = NO;
    _monster9.hidden = NO;
    _monster10.hidden = NO	;
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
    
    monster1Hit = NO;
    monster2Hit = NO;
    monster3Hit = NO;
    monster4Hit = NO;
    monster5Hit = NO;
    monster6Hit = NO;
    monster7Hit = NO;
    monster8Hit = NO;
    monster9Hit = NO;
    monster10Hit = NO;
    
    _monster1.hidden = YES;
    _monster2.hidden = YES;
    _monster3.hidden = YES;
    _monster4.hidden = YES;
    _monster5.hidden = YES;
    _monster6.hidden = YES;
    _monster7.hidden = YES;
    _monster8.hidden = YES;
    _monster9.hidden = YES;
    _monster10.hidden = YES;
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
