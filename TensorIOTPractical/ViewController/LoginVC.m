//
//  ViewController.m
//  TensorIOTPractical
//
//  Created by yogesh rathod on 9/22/23.
//

#import "LoginVC.h"
#import "ProfileVC.h"
#import "SignUpVC.h"
@import GoogleSignIn;
@import FirebaseAuth;
@import FirebaseCore;

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Button Tap
- (IBAction)btnLogInTap:(id)sender {
    
    if ([self googleIsSetup]) {
        [self googleLogin];
    }
}

- (IBAction)btnSignUpTap:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    SignUpVC *signUpVC = (SignUpVC *)[storyboard instantiateViewControllerWithIdentifier:@"SignUpVC"];

    [self.navigationController pushViewController:signUpVC animated:YES];
}

- (void)googleLogin
{
    GIDSignIn *googleSignIn = [GIDSignIn sharedInstance];
    [googleSignIn signInWithPresentingViewController:self completion:nil];
}

- (BOOL)googleIsSetup
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"GoogleService-Info" ofType:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *reversedClientId =[plist objectForKey:@"REVERSED_CLIENT_ID"];
    BOOL clientIdExists = [plist objectForKey:@"CLIENT_ID"] != nil;
    BOOL reversedClientIdExists = reversedClientId != nil;
    BOOL canOpenGoogle =[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://", reversedClientId]]];

    if (!(clientIdExists && reversedClientIdExists && canOpenGoogle)) {
        [self showErrorAlertWithMessage:@"Please add `GoogleService-Info.plist` to `Supporting Files` and\nURL types > Url Schemes in `Supporting Files/Info.plist`"];
        return NO;
    } else {
        return YES;
    }
}



- (void)showErrorAlertWithMessage:(NSString *)message
{
    // display an alert with the error message
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {

  }

- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
//user signed in
//get user data in "user" (GIDGoogleUser object)
    
    NSLog(user);
    
}

@end
