//
//  RootViewController.h
//  KKSimpleCamera_Basic
//
//  Created by keke on 14-9-16.
//  Copyright (c) 2014年 keke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#include <AssetsLibrary/AssetsLibrary.h>


@interface RootViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageShow;

-(IBAction)show;
@end
