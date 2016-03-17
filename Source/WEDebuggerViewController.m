//
//  WEDebuggerViewController.m
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "WEDebuggerViewController.h"
#import "Masonry.h"
#import "WEDebugger.h"

@interface WEDebuggerViewController ()

@property(nonatomic, strong, readonly) UITextView *terminal;
@property(nonatomic, strong, readonly) UITextField *search;
@property(nonatomic, strong, readonly) UIButton *validate;
@property(nonatomic, assign, readwrite) BOOL didSetupConstraints;

@end

@implementation WEDebuggerViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _didSetupConstraints = NO;
    }
    
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    _search = [UITextField new];
    _search.layer.borderColor = [UIColor whiteColor].CGColor;
    _search.layer.borderWidth = 1.0f;
    _search.placeholder = @"Rechercher";
    _search.textAlignment = NSTextAlignmentCenter;
    _search.textColor = [UIColor whiteColor];
    _search.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Rechercher" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    _search.autocorrectionType = UITextAutocorrectionTypeNo;
    _search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _search.returnKeyType = UIReturnKeyDone;
    _search.delegate = self;
    _search.tintColor = [UIColor whiteColor];
    [_search addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    _terminal = [UITextView new];
    _terminal.editable = NO;
    _terminal.backgroundColor = [UIColor blackColor];
    _terminal.textColor = [UIColor whiteColor];
    _terminal.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:_search];
    [self.view addSubview:_terminal];
    
    [self fillTerminal];
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(closeDebugger)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:gesture];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapView)];
    singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTap];
}

- (void)updateViewConstraints {
    if (!_didSetupConstraints) {
        _didSetupConstraints = YES;
        
        [_search mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).with.offset(24.0f);
            make.left.mas_equalTo(self.view).with.offset(16.0f);
            make.right.mas_equalTo(self.view).with.offset(-16.0f);
            make.height.mas_equalTo(40.0f);
            
            _search.layer.cornerRadius = 20.0f;
        }];
        
        [_terminal mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_search.mas_bottom).with.offset(16.0f);
            make.left.mas_equalTo(self.view).with.offset(16.0f);
            make.right.mas_equalTo(self.view).with.offset(-16.0f);
            make.bottom.mas_equalTo(self.view).with.offset(-16.0f);
        }];
    }
    
    [super updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)fillTerminal {
    for (NSString *log in [WEDebugger sharedInstance].logs) {
        _terminal.text = [NSString stringWithFormat:@"%@\n%@", _terminal.text, log];
    }
}

- (void)closeDebugger {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)handleTapView {
    [_search resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField {
    _terminal.text = @"";
    
    if (textField.text && textField.text.length > 0) {
        for (NSString *log in [WEDebugger sharedInstance].logs) {
            if ([log rangeOfString:textField.text].location != NSNotFound) {
                _terminal.text = [NSString stringWithFormat:@"%@\n%@", _terminal.text, log];
            }
        }
    } else {
        [self fillTerminal];
    }
}

@end
