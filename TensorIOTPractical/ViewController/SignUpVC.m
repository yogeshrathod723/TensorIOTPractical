//
//  SignUpVC.m
//  TensorIOTPractical
//
//  Created by yogesh rathod on 9/22/23.
//

#import "SignUpVC.h"
#import "ProfileVC.h"

@interface SignUpVC ()


@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height/2;
}


#pragma mark - Button Tap
- (IBAction)btnSignUpTap:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    ProfileVC *profileVC = (ProfileVC *)[storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
    
    profileVC.img = self.imgProfile.image;
    profileVC.strBio = self.txtSortBio.text;

    [self.navigationController pushViewController:profileVC animated:YES];
}
- (IBAction)btnProfileTap:(id)sender {
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"" message:@"Change Profile image" preferredStyle:UIAlertControllerStyleActionSheet];

     UIAlertAction *takePhoto=[UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

         UIImagePickerController *picker = [[UIImagePickerController alloc] init];

         picker.delegate = self;

         picker.allowsEditing = YES;

         picker.sourceType = UIImagePickerControllerSourceTypeCamera;

         [self presentViewController:picker animated:YES completion:NULL];

         [alertController dismissViewControllerAnimated:YES completion:nil];
     }];
     [alertController addAction:takePhoto];

     UIAlertAction *choosePhoto=[UIAlertAction actionWithTitle:@"Select From Photos" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

         UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];

         pickerView.allowsEditing = YES;

         pickerView.delegate = self;

         [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];

         [self presentModalViewController:pickerView animated:YES];

         [alertController dismissViewControllerAnimated:YES completion:nil];
     }];

     [alertController addAction:choosePhoto];

     UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        [alertController dismissViewControllerAnimated:YES completion:nil];
     }];

     [alertController addAction:actionCancel];

     [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - Image Picker Method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];

    self.imgProfile.image = chosenImage;

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
