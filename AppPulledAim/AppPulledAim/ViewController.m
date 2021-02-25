//
//  ViewController.m
//  AppPulledAim
//
//  Created by DJX on 2021/2/23.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic,strong) UILabel *showLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAppMailingMethod:) name:@"showAppMailingCanShu" object:nil];
    
    float viewWidth = [UIScreen mainScreen].bounds.size.width;
    float labelX = (viewWidth-300)*0.5;
    float viewHeight = [UIScreen mainScreen].bounds.size.height;
    float labelY = (viewHeight-50)*0.5;
    
    self.showLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, 300, 50)];
    self.showLabel.text = @"初始值";
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.showLabel];
    // Do any additional setup after loading the view.
}

-(void)showAppMailingMethod:(NSNotification *)noti{
    NSString *str = noti.userInfo[@"canshu"];
    NSLog(@"%@",str);
    self.showLabel.text = str;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}
@end
