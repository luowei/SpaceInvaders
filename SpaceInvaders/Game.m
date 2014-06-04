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
int monsterMovement;
int monsterShootStart;

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


@property (weak, nonatomic) IBOutlet UIImageView *monsterBullet;
@property (weak, nonatomic) IBOutlet UIImageView *monsterBullet2;
@property (weak, nonatomic) IBOutlet UIImageView *monsterBullet3;

@end

@implementation Game

-(void)monsterMoveDown{
    _monster1.center = CGPointMake(_monster1.center.x, _monster1.center.y+5);
    _monster2.center = CGPointMake(_monster2.center.x, _monster2.center.y+5);
    _monster3.center = CGPointMake(_monster3.center.x, _monster3.center.y+5);
    _monster4.center = CGPointMake(_monster4.center.x, _monster4.center.y+5);
    _monster5.center = CGPointMake(_monster5.center.x, _monster5.center.y+5);
    _monster6.center = CGPointMake(_monster6.center.x, _monster6.center.y+5);
    _monster7.center = CGPointMake(_monster7.center.x, _monster7.center.y+5);
    _monster8.center = CGPointMake(_monster8.center.x, _monster8.center.y+5);
    _monster9.center = CGPointMake(_monster9.center.x, _monster9.center.y+5);
    _monster10.center = CGPointMake(_monster10.center.x, _monster10.center.y+5);
    
    
}

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
    _monster1.center = CGPointMake(_monster1.center.x+monsterMovement, _monster1.center.y);
    _monster2.center = CGPointMake(_monster2.center.x+monsterMovement, _monster2.center.y);
    _monster3.center = CGPointMake(_monster3.center.x+monsterMovement, _monster3.center.y);
    _monster4.center = CGPointMake(_monster4.center.x+monsterMovement, _monster4.center.y);
    _monster5.center = CGPointMake(_monster5.center.x+monsterMovement, _monster5.center.y);
    _monster6.center = CGPointMake(_monster6.center.x+monsterMovement, _monster6.center.y);
    _monster7.center = CGPointMake(_monster7.center.x+monsterMovement, _monster7.center.y);
    _monster8.center = CGPointMake(_monster8.center.x+monsterMovement, _monster8.center.y);
    _monster9.center = CGPointMake(_monster9.center.x+monsterMovement, _monster9.center.y);
    _monster10.center = CGPointMake(_monster10.center.x+monsterMovement, _monster10.center.y);
    _monsterBullet.center = CGPointMake(_monsterBullet.center.x, _monsterBullet.center.y+10);
    _monsterBullet2.center = CGPointMake(_monsterBullet2.center.x, _monsterBullet2.center.y+10);
    _monsterBullet3.center = CGPointMake(_monsterBullet3.center.x, _monsterBullet3.center.y+10);
    
    if(_monsterBullet.center.y > 570){
        monsterShootStart = arc4random() % 300;
        _monsterBullet.center = CGPointMake(monsterShootStart, -10);
    }
    if(_monsterBullet2.center.y > 570){
        monsterShootStart = arc4random() % 300;
        _monsterBullet2.center = CGPointMake(monsterShootStart, -10);
    }
    if(_monsterBullet3.center.y > 570){
        monsterShootStart = arc4random() % 300;
        _monsterBullet2.center = CGPointMake(monsterShootStart, -10);
    }
    
    if(_bullet.center.y < 0){
        _bullet.hidden = YES;
        bulletOnScreen = 0;
        bulletMovement = 0;
    }
    
    if((_monster1.center.x < -5 && monster1Hit == NO)
       || (_monster2.center.x < 15 && monster2Hit == NO)
       || (_monster3.center.x < 15 && monster3Hit == NO)
       || (_monster4.center.x < 15 && monster4Hit == NO)
       || (_monster5.center.x < 15 && monster5Hit == NO)
       || (_monster6.center.x < 15 && monster6Hit == NO)
       || (_monster7.center.x < 15 && monster7Hit == NO)
       || (_monster8.center.x < 15 && monster8Hit == NO)
       || (_monster9.center.x < 15 && monster9Hit == NO)
       || (_monster10.center.x < 15 && monster10Hit == NO)){
        monsterMovement = 5;
        [self monsterMoveDown];
    }else if((_monster1.center.x > 280 && monster1Hit == NO)
             || (_monster2.center.x > 300 && monster2Hit == NO)
             || (_monster3.center.x > 300 && monster3Hit == NO)
             || (_monster4.center.x > 300 && monster4Hit == NO)
             || (_monster5.center.x > 300 && monster5Hit == NO)
             || (_monster6.center.x > 300 && monster6Hit == NO)
             || (_monster7.center.x > 300 && monster7Hit == NO)
             || (_monster8.center.x > 300 && monster8Hit == NO)
             || (_monster9.center.x > 300 && monster9Hit == NO)
             || (_monster10.center.x > 300 && monster10Hit == NO)){
        monsterMovement = -5;
        [self monsterMoveDown];
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
    
    _monsterBullet.hidden = NO;
    _monsterBullet2.hidden = NO;
    _monsterBullet3.hidden = NO;
    
    monsterShootStart = arc4random() % 300;
    _monsterBullet.center = CGPointMake(monsterShootStart, 0);
    monsterShootStart = arc4random() % 300;
    _monsterBullet2.center = CGPointMake(monsterShootStart, -150);
    monsterShootStart = arc4random() % 300;
    _monsterBullet3.center = CGPointMake(monsterShootStart, -300);
    
    
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
    
    _monsterBullet.hidden = YES;
    _monsterBullet2.hidden = YES;
    _monsterBullet3.hidden = YES;
    
    monsterMovement = 5;
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
