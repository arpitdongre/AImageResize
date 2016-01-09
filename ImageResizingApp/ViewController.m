

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)selectImage:(id)sender {
    [self pickImages];
}

-(void)pickImages{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
//    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    picker.navigationBar.tintColor = [UIColor blueColor];
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    
    
    _imageView.image=[self resizeImage:selectedImage convertToSize: CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-60)];

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)resizeImage:(UIImage *)image convertToSize:(CGSize)desiredSize {
    UIGraphicsBeginImageContext(desiredSize);
    [image drawInRect:CGRectMake(0, 0, desiredSize.width, desiredSize.height)];
    UIImage *convertedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return convertedImage;
}


@end
