//
//  WeatherDetailVC.h
//  TensorIOTPractical
//
//  Created by yogesh rathod on 9/23/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblHuminity;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather;
@property (weak, nonatomic) IBOutlet UILabel *lblWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *lblVisibility;
@property (nonatomic,retain) NSMutableDictionary *mutDictWeather;

@end

NS_ASSUME_NONNULL_END
