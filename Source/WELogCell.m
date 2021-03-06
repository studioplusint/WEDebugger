//
//  WELogCell.m
//  WEDebugger
//
//  Created by Lucas Ortis on 18/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "WELogCell.h"
#import "Masonry.h"

@interface WELogCell ()

@property(nonatomic, strong, readwrite) WELog *log;
@property(nonatomic, strong, readonly) UILabel *logLabel;
@property(nonatomic, assign, readwrite) BOOL didSetupConstraints;

@end

@implementation WELogCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _didSetupConstraints = NO;
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        _logLabel = [UILabel new];
        _logLabel.numberOfLines = 0;
        _logLabel.font = [UIFont systemFontOfSize:14.0f];
        _logLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self.contentView addSubview:_logLabel];
    }
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    if (!_didSetupConstraints) {
        _didSetupConstraints = YES;
        
        [_logLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    
    [super updateConstraints];
}

- (void)setLog:(WELog *)log {
    _log = log;
    
    switch (log.type) {
        case WELogDefaultType:
            _logLabel.textColor = [UIColor whiteColor];
            break;
        case WELogSuccessType:
            _logLabel.textColor = [UIColor colorWithRed:46.0f / 255.0f green:204.0f / 255.0f blue:113.0f / 255.0f alpha:1.0f];
            break;
        case WELogErrorType:
            _logLabel.textColor = [UIColor colorWithRed:247.0f / 255.0f green:71.0f / 255.0f blue:133.0f / 255.0f alpha:1.0f];
            break;
        case WELogInfosType:
            _logLabel.textColor = [UIColor colorWithRed:104.0f / 255.0f green:217.0f / 255.0f blue:241.0f / 255.0f alpha:1.0f];
            break;
            
        default:
            break;
    }
    
    _logLabel.text = _log.log;
}

@end
