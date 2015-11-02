//
//  RootViewController.m
//  KKSimpleCamera_Basic
//
//  Created by keke on 14-9-16.
//  Copyright (c) 2014年 keke. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    // Do any additional setup after loading the view from its nib.
    
    _backgroundView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_backgroundView];
    
}

//button 触发事件
-(IBAction)show{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [sheet showInView:self.view];
}

//UIActionsheet 触发
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"亲，找不到相机哦~" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
            [alertView show];
        }
        //创建图像选取控制器
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        //设置图像选取控制器的来源为相机
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        //设置图像选取控制器的类型为静态图像
        imagePickerController.mediaTypes = [[NSArray alloc]initWithObjects:(NSString*)kUTTypeImage, nil];
        //允许用户进行编辑
        imagePickerController.allowsEditing = YES;
        //设置委托对象
        imagePickerController.delegate = self;
        //以模视图控制器的形式显示
        //[self presentModalViewController:imagePickerController animated:YES];
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
    }else if (buttonIndex == 1){
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            NSLog(@"sorry,no camera or camera is unavailable.");
            return;
        }
        //获得相片模式下支持的媒体类型
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        BOOL canTakePhotoLibrary = NO;
        for (NSString *mediaType in availableMediaTypes) {
            if ([mediaType isEqualToString:(NSString*)kUTTypeImage]) {
                //支持
                canTakePhotoLibrary = YES;
                break;
            }
        }
        if (!canTakePhotoLibrary) {
            NSLog(@"sorry,taking photo from library is not supported.");
            return;
        }
        //创建图像选取控制器
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        //设置图像选取控制器的来源为相册
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //设置图像选取控制器的类型为静态图像
        imagePickerController.mediaTypes = [[NSArray alloc]initWithObjects:(NSString*)kUTTypeImage, nil];
        //不允许用户进行编辑
        imagePickerController.allowsEditing = NO;
        //设置委托对象
        imagePickerController.delegate = self;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
    }

    
}

//
-(void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
    if (!error) {
        NSLog(@"picture saved with no error.");
    }
    else{
        NSLog(@"error occured while saving the picture%@",error);
    }
}

#pragma mark - 流媒体处理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    //判断控制器来源
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        //保存图片
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        
    }
    [_imageShow setImage:image];

    [picker dismissViewControllerAnimated:YES completion:^{}];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
