//
//  APIModel.m
//  Veteran
//
//  Created by Techin Park on 2016. 12. 31..
//  Copyright © 2016년 Story&Brothers. All rights reserved.
//

#import "APIModel.h"

@implementation APIModel

#pragma mark -
#pragma mark 기본 요청 API


-(NSDictionary *)moneyTransfer:(NSString *)me toUserid:(NSString *)toUserid money:(NSString *)money {
    
    NSString *reqURL = [NSString stringWithFormat:@"/user/%@/transfer",me];
    return [self request:reqURL params:@{@"toUserid":toUserid,
                                  @"money":money}];
    
}

-(NSDictionary *)moneyBalance:(NSString *)userId {
    NSString *reqURL = [NSString stringWithFormat:@"/user/%@/balance",userId];
    return [self request:reqURL params:nil];
}


-(NSDictionary *)moneyReceived:(NSString *)userId {
    NSString *reqURL = [NSString stringWithFormat:@"/user/%@/from/received",userId];
    return [self request:reqURL params:nil];
    
}
-(NSDictionary *)moneyFromPending:(NSString *)userId {
    NSString *reqURL = [NSString stringWithFormat:@"/user/%@/from/pending",userId];
    return [self request:reqURL params:nil];
}

-(NSDictionary *)moneySentTo:(NSString *)userId {
    NSString *reqURL = [NSString stringWithFormat:@"/user/%@/to/sent",userId];
    return [self request:reqURL params:nil];
}

-(NSDictionary *)moneyPendingTo:(NSString *)userId {
    NSString *reqURL = [NSString stringWithFormat:@"/user/%@/to/pending",userId];
    return [self request:reqURL params:nil];
}



-(NSDictionary *)request:(NSString *)api params:(NSDictionary *)params {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",BASE_API_URL,api];
    
    NSMutableDictionary *json = [[NSMutableDictionary alloc] init];
    
    NSLog(@"[+] request URL : %@",url);
    
    if (params == nil) {
        params = @{};
    }
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"application/x-www-form-urlencoded" value:@"Content-Type"];
    
    NSArray *allkeys = [params allKeys];
    for (int i= 0; i < [params count]; i ++) {
        
        
        NSString *key = [allkeys objectAtIndex:i];
        NSString *value = [params objectForKey:key];
        
        NSLog(@"key : %@",key);
        NSLog(@"value : %@",value);
        
        [request setPostValue:value forKey:key];
    }
    
    [request setDelegate:self];
    [request startSynchronous];
    
    
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        NSData *jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        [json setDictionary:jsonInfo];
        
        
        NSLog(@"response code : %d",[request responseStatusCode]);
        NSLog(@"response code : %d\n[+] response Data : %@",[request responseStatusCode],json);
        
        
        if (404 == [request responseStatusCode]) {
            return @{@"result":[NSNumber numberWithInt:E_NOTFOUND]};
        }
        
        if (500 == [request responseStatusCode]) {
            return @{@"result":[NSNumber numberWithInt:E_SERVER]};
        }
        
    }
    else {
        NSLog(@"[+] error : %@",[error localizedDescription]);
        
        return @{@"result":[NSNumber numberWithInt:E_REQTIMEOUT]};
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    return json;
    
}


@end
