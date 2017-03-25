//
//  Define.h
//  Veteran
//
//  Created by Techin Park on 2016. 12. 31..
//  Copyright © 2016년 Story&Brothers. All rights reserved.
//

/*
 서버 기본 세팅 정보
 */

#import "AppDelegate.h"

#define SharedAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define RGB(R, G, B)                        ([UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f])

// Real Server
#define BASE_SERVER_URL                 @"http://115.71.232.103/"
#define BASE_API_URL                    @"http://115.71.232.103:9000"

#define DEFAULTS_PUSH_DATA @"pushData"



#define E_TIMEOUT               99              // 인증시간 대기초과 (타임아웃)
#define E_SERVER                100             // 서버에러
#define E_NOTFOUND              -16             // 404에러
#define E_REQTIMEOUT            -17             // Request Timeout
