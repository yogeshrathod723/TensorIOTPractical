//
//  WeatherDetailVC.m
//  TensorIOTPractical
//
//  Created by yogesh rathod on 9/23/23.
//

#import "WeatherDetailVC.h"

@interface WeatherDetailVC ()

@end

@implementation WeatherDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lblTemp.text = [NSString stringWithFormat:@"%@",[[_mutDictWeather objectForKey:@"main"] objectForKey:@"temp"]];
    
    _lblHuminity.text = [NSString stringWithFormat:@"%@",[[_mutDictWeather objectForKey:@"main"] objectForKey:@"humidity"]];
    
   _lblWeather.text = [NSString stringWithFormat:@"%@",[[_mutDictWeather objectForKey:@"weather"][0] objectForKey:@"main"]];

    _lblVisibility.text = [NSString stringWithFormat:@"%@",[_mutDictWeather objectForKey:@"visibility"]];
    
    _lblWindSpeed.text = [NSString stringWithFormat:@"%@",[[_mutDictWeather objectForKey:@"wind"] objectForKey:@"speed"]];
    
}
@end
