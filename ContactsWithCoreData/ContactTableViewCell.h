//
//  ContactCellObject.h
//  NimbusExample
//
//  Created by Doan Van Vu on 7/5/17.
//  Copyright © 2017 Vu Doan. All rights reserved.
//

#import "ContactCellObject.h"
#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell <NICell>

@property (nonatomic) id<ContactModelProtocol>model;
@property (nonatomic) UIImageView* profileImageView;
@property (nonatomic) NSString* identifier;
@property (nonatomic) UILabel* nameLabel;

@end

