//
//  ViewController.m
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "DemoViewController.h"
#import "WEDebugger.h"
#import "Masonry.h"
#import "WEDebuggerViewController.h"

@interface DemoViewController ()

@property(nonatomic, strong, readonly) UIButton *button01;
@property(nonatomic, strong, readonly) UIButton *button02;
@property(nonatomic, strong, readonly) UIButton *button03;
@property(nonatomic, strong, readonly) UIButton *button04;
@property(nonatomic, strong, readonly) UIButton *button05;
@property(nonatomic, strong, readonly) UIButton *logsButton;
@property(nonatomic, assign, readwrite) BOOL didSetupConstraints;

@end

@implementation DemoViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _didSetupConstraints = NO;
    }
    
    return self;
}

- (void)loadView {
    [super loadView];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.topItem.title = @"WEDebugger";
    
    _button01 = [self buttonWithText:@"Default" logsButton:NO];
    _button02 = [self buttonWithText:@"Success" logsButton:NO];
    _button03 = [self buttonWithText:@"Infos" logsButton:NO];
    _button04 = [self buttonWithText:@"Error" logsButton:NO];
    _button05 = [self buttonWithText:@"Big log" logsButton:NO];
    _logsButton = [self buttonWithText:@"See logs" logsButton:YES];
    
    [self.view addSubview:_button01];
    [self.view addSubview:_button02];
    [self.view addSubview:_button03];
    [self.view addSubview:_button04];
    [self.view addSubview:_button05];
    [self.view addSubview:_logsButton];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)updateViewConstraints {
    if (!_didSetupConstraints) {
        _didSetupConstraints = YES;
        
        [_button01 mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize size = CGSizeMake([_button01 intrinsicContentSize].width + 40.0f, [_button01 intrinsicContentSize].height);
            
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.view);
            make.baseline.mas_equalTo(self.view.mas_centerY).with.offset(-16.0f);
            
            _button01.layer.cornerRadius = size.height / 2.0f;
        }];
        
        [_button02 mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize size = CGSizeMake([_button02 intrinsicContentSize].width + 40.0f, [_button02 intrinsicContentSize].height);
            
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view.mas_centerY).with.offset(16.0f);
            
            _button02.layer.cornerRadius = size.height / 2.0f;
        }];
        
        [_button03 mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize size = CGSizeMake([_button03 intrinsicContentSize].width + 40.0f, [_button03 intrinsicContentSize].height);
            
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(_button02.mas_bottom).with.offset(16.0f);
            
            _button03.layer.cornerRadius = size.height / 2.0f;
        }];
        
        [_button04 mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize size = CGSizeMake([_button04 intrinsicContentSize].width + 40.0f, [_button04 intrinsicContentSize].height);
            
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(_button01.mas_top).with.offset(-16.0f);
            
            _button04.layer.cornerRadius = size.height / 2.0f;
        }];
        
        [_button05 mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize size = CGSizeMake([_button05 intrinsicContentSize].width + 40.0f, [_button05 intrinsicContentSize].height);
            
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(_button04.mas_top).with.offset(-16.0f);
            
            _button05.layer.cornerRadius = size.height / 2.0f;
        }];
        
        [_logsButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize size = CGSizeMake([_logsButton intrinsicContentSize].width + 40.0f, [_logsButton intrinsicContentSize].height);
            
            make.size.mas_equalTo(size);
            make.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view).with.offset(-16.0f);
            
            _logsButton.layer.cornerRadius = size.height / 2.0f;
        }];
    }
    
    [super updateViewConstraints];
}

- (void)buttonSelected:(UIButton *)sender {
    if (sender == _button01) {
        WELog(sender.titleLabel.text);
    } else if (sender == _button02) {
        WESuccessLog(sender.titleLabel.text);
    } else if (sender == _button03) {
        WEInfosLog(sender.titleLabel.text);
    } else if (sender == _button04) {
        WEErrorLog(sender.titleLabel.text);
    } else if (sender == _button05) {
        WELog(@"Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.\n\nIllud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.\n\nIllud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.");
    }
}

- (void)displayLogs {
    [self.navigationController pushViewController:[WEDebuggerViewController new] animated:YES];
}

- (UIButton *)buttonWithText:(NSString *)text logsButton:(BOOL)logsButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1.0f;
    button.clipsToBounds = YES;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateHighlighted];
    [button setBackgroundImage:nil forState:UIControlStateNormal];
    
    if (logsButton) {
        [button addTarget:self action:@selector(displayLogs) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [button addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 10.0f, 10.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
