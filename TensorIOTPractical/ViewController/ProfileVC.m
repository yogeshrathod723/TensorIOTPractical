//
//  ProfileVC.m
//  TensorIOTPractical
//
//  Created by yogesh rathod on 9/22/23.
//

#import "ProfileVC.h"
#import "WeatherDetailVC.h"

@interface ProfileVC ()

@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mutArrWeather = [[NSMutableArray alloc] init];
    self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height/2;
    
    self.imgProfile.image = _img;
    self.lblSortBio.text = _strBio;
    
   _tblWeatherData.delegate = self;
   _tblWeatherData.dataSource = self;
   _strLocation = @"India,kolkata";
    

}

#pragma mark- button Tap
- (IBAction)btnGoTap:(id)sender {
    [self apiCalling];
}


#pragma mark- apiCalling
- (void)apiCalling
{
    
    NSString *deviceRequestString = [NSString stringWithFormat:@"https://api.openweathermap.org/data/2.5/forecast?q=%@,uk&APPID=83a2b369686efa5bdee0aecabe838b1e",_strLocation];
    NSURL *JSONURL = [NSURL URLWithString:deviceRequestString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:JSONURL];
    NSURLSessionDataTask * dataTask = [
          [NSURLSession sharedSession]
          dataTaskWithRequest:request
          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
              if(data == nil) {
                  //completion(nil,error);
                  return;
              }
              
              id jsonResponseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
              
              NSDictionary *jsonResponseDict;
              if ([jsonResponseData isKindOfClass:[NSDictionary class]]) {
                  jsonResponseDict = jsonResponseData;
              } else {
                  // Error-handling code
              }
              jsonResponseData = [jsonResponseDict objectForKey:@"d"];
              if (jsonResponseData == nil) {
                  // Server may have returned a response containing an error
                  // The "ExceptionType" value is returned from my .NET server used in sample
                  id jsonExceptioTypeData = [jsonResponseDict objectForKey:@"ExceptionType"];
                  if (jsonExceptioTypeData != nil) {
                      NSLog(@"%s ERROR : Server returned an exception", __func__);
                      NSLog(@"%s ERROR : Server error details = %@", __func__, jsonResponseDict);
                  }
              }
              self->mutArrWeather = [jsonResponseDict objectForKey:@"list"];
              dispatch_async(dispatch_get_main_queue(), ^{
              // code to post to UI
                  [self->_tblWeatherData reloadData];
              });
          }
    ];
    [dataTask resume];
    
}



#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutArrWeather.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
        UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [mutArrWeather[indexPath.row] objectForKey:@"dt_txt"];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    WeatherDetailVC *weatheDetailVC = (WeatherDetailVC *)[storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailVC"];
    
    weatheDetailVC.mutDictWeather = mutArrWeather[indexPath.row];
   
    [self.navigationController pushViewController:weatheDetailVC animated:YES];
}

@end
