//
//  AddContactViewController.m
//  ContactsWithCoreData
//
//  Created by Doan Van Vu on 9/13/17.
//  Copyright © 2017 Doan Van Vu. All rights reserved.
//

#import "AddContactViewController.h"
#import "Constants.h"
#import "Masonry.h"

@interface AddContactViewController ()

@property (nonatomic) UITextField* companyNameTextField;
@property (nonatomic) UITextField* phoneNumberTextField;
@property (nonatomic) UITextField* firstNameTextField;
@property (nonatomic) UITextField* lastNameTextField;
@property (nonatomic) UIImageView* profileImageView;
@property (nonatomic) UIImageView* phoneImageView;
@property (nonatomic) UILabel* phoneLabel;

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupLayout];
    [self setupBarButton];
    self.title = @"Add Contacts";
}

#pragma mark - singleton

+ (instancetype)sharedInstance {
    
    static AddContactViewController* sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^ {
        
        sharedInstance = [[AddContactViewController alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - setupLayout

- (void)setupLayout {
    
    CGFloat scale = FONTSIZE_SCALE;
    
    _profileImageView = [[UIImageView alloc] init];
    _profileImageView.image = [UIImage imageNamed:@"ic_user"];
    [self.view addSubview:_profileImageView];
    
    _firstNameTextField = [[UITextField alloc] init];
    [_firstNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [_firstNameTextField setPlaceholder:@"first Name"];
    [self.view addSubview:_firstNameTextField];
    
    _lastNameTextField = [[UITextField alloc] init];
    [_lastNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [_lastNameTextField setPlaceholder:@"Last Name"];
    [self.view addSubview:_lastNameTextField];
    
    _companyNameTextField = [[UITextField alloc] init];
    [_companyNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [_companyNameTextField setPlaceholder:@"Company Name"];
    [self.view addSubview:_companyNameTextField];
    
    _phoneNumberTextField = [[UITextField alloc] init];
    [_phoneNumberTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [_phoneNumberTextField setPlaceholder:@"phone Number"];
    [self.view addSubview:_phoneNumberTextField];
    
    _phoneImageView = [[UIImageView alloc] init];
    _phoneImageView.image = [UIImage imageNamed:@"ic_phone"];
    [self.view addSubview:_phoneImageView];
    
    _phoneLabel = [[UILabel alloc] init];
    [_phoneLabel setFont:[UIFont boldSystemFontOfSize:10 * scale]];
    [_phoneLabel setText:@"Phone number"];
    [self.view addSubview:_phoneLabel];
    
    [_profileImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(20);
        make.width.and.height.mas_equalTo(40);
    }];
    
    [_firstNameTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_profileImageView.mas_right).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.height.mas_equalTo(30);
    }];
    
    [_lastNameTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_firstNameTextField.mas_bottom).offset(8);
        make.left.equalTo(_profileImageView.mas_right).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.height.mas_equalTo(30);
    }];
    
    [_companyNameTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_lastNameTextField.mas_bottom).offset(8);
        make.left.equalTo(_profileImageView.mas_right).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.height.mas_equalTo(30);
    }];
    
    [_phoneImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_companyNameTextField.mas_bottom).offset(12);
        make.left.equalTo(self.view).offset(20);
        make.height.and.width.mas_equalTo(20);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_companyNameTextField.mas_bottom).offset(8);
        make.left.equalTo(_phoneImageView.mas_right).offset(5);
        make.height.mas_equalTo(30);
    }];
    
    [_phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        
        make.top.equalTo(_companyNameTextField.mas_bottom).offset(8);
        make.left.equalTo(_phoneLabel.mas_right).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark - setupBarButton

- (void)setupBarButton {
    
    UIButton* doneButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [doneButton setShowsTouchWhenHighlighted:YES];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    UIBarButtonItem* doneBarButton = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    self.navigationItem.rightBarButtonItem = doneBarButton;
    
    UIButton* cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    [cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setShowsTouchWhenHighlighted:YES];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    UIBarButtonItem* cancelBarButton = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem = cancelBarButton;
}

#pragma mark - direction

- (IBAction)done:(id)sender {    
   
}

#pragma mark - search

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
