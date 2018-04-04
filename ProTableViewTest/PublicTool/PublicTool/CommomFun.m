//
//  CommomFun.m
//  ProTableViewTest
//
//  Created by  Tmac on 2018/4/4.
//  Copyright © 2018年 Tmac. All rights reserved.
//

#import "CommomFun.h"

@implementation CommomFun

+ (CGSize)getTextFixRect:(NSString *)text maxWidth:(CGFloat)maxWidth fontSize:(int)fontSize
{
    NSString *tmpStr = text;
    
    CGRect rect = [tmpStr boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    float h = ceilf(rect.size.height);
    if(text==nil||text.length==0)
        h = 0;
    
    return CGSizeMake(ceilf(rect.size.width), h);
}
@end
