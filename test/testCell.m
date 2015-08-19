//
//  testCell.m
//  test
//
//  Created by Charlie on 15/7/29.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "testCell.h"
#import <Masonry.h>

@interface testCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * descriptionLabel;
@property (nonatomic, strong) UIButton * touchButton;
@end

@implementation testCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.descriptionLabel];
        [self.contentView addSubview:self.touchButton];
        
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-15);
            make.top.equalTo(self.mas_top).offset(12);
            make.size.equalTo(@[@(20),@(20)]);
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.top.equalTo(_iconImageView.mas_top);
        }];
        
        [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel.mas_left);
            make.right.equalTo(_iconImageView.mas_left);
            make.top.equalTo(_nameLabel.mas_bottom).offset(3);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark -
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor blackColor];
        _iconImageView.layer.cornerRadius = 10;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor darkGrayColor];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"卞卡 关注了该问题";
        
    }
    return _nameLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.textColor = [UIColor blackColor];
        _descriptionLabel.font = [UIFont boldSystemFontOfSize:14];
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _descriptionLabel.text = @"发生拥挤踩踏事故时，可以做心肺复苏吗?发生拥挤踩踏事故时，可以做心肺复苏吗?发生拥挤踩踏事故时，可以做心肺复苏吗?";
        [_descriptionLabel sizeToFit];
    }
    return _descriptionLabel;
}

- (UIButton *)touchButton {
    if (!_touchButton) {
        
    }
    return _touchButton;
}

@end
