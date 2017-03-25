//
//  APIModel.h
//  Veteran
//
//  Created by Techin Park on 2016. 12. 31..
//  Copyright © 2016년 Story&Brothers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"


@interface APIModel : NSObject

-(NSDictionary *)request:(NSString *)api params:(NSDictionary *)params;

@end
