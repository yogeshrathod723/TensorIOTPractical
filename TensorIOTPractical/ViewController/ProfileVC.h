//
//  ProfileVC.h
//  TensorIOTPractical
//
//  Created by yogesh rathod on 9/22/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *mutArrWeather;

}
@property (weak, nonatomic) IBOutlet UIImageView *imgProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblSortBio;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;
@property (weak, nonatomic) IBOutlet UITableView *tblWeatherData;
@property (nonatomic,retain) NSString *strLocation;
@property (nonatomic,retain) UIImage *img;
@property (nonatomic,retain) NSString *strBio;


@end

NS_ASSUME_NONNULL_END
