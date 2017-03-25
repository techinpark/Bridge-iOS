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
#define BASE_API_URL                    @"http://115.71.232.103/Veteran/"
#define BASE_CHAT_SERVER_URL            @"http://115.71.232.103:6847"

// Test Server
//#define BASE_SERVER_URL                 @"http://192.168.0.12:8888/"
//#define BASE_API_URL                    @"http://192.168.0.12:8888/Veteran/index.php/"

//#define BASE_CHAT_SERVER_URL            @"http://localhost:6847"
//#define BASE_CHAT_SERVER_URL            @"http://192.168.0.12:6847"


#define API_REGISTER                    @"Members/register"
#define API_REGISTER_CORETECH           @"Coretech/registerCoreTech"

#define API_GET_MY_CORETECH             @"Coretech/getMyCoreTech"
#define API_GET_ALL_CORETECH            @"Coretech/getAllCoreTech"
#define API_GET_CORETECH_WITH_IDX       @"Coretech/getCoretechWithIdx"
#define API_GET_CORETECH_ATTEND_MEMBERS @"Coretech/getCoretechAttendMembers"

#define API_GET_KEYWORD_INFO            @"Members/keywords"
#define API_GET_USER_INFO               @"Members/user"
#define API_GET_SPOT_TYPE               @"Members/spotType"
#define API_UPDATE_PUSH_TOKEN           @"Members/pushToken"
#define API_CHECK_REGISTER              @"Members/checkRegister"

#define API_GET_CORETECH_LEVEL          @"Members/getCoreLevels"
#define API_GET_CUSTOMER_TYPE           @"Members/getCustomerType"
#define API_GET_USER_INFO_WITH_EMAIL    @"Members/getMemberInfo"

#define API_CHAT_MAKE_NEW_ROOM          @"Chat/MakeNewChatRoom"
#define API_CHAT_MESSSAGES_WITH_ROOMIDX @"Chat/getAllMessages"
#define API_CHAT_DENY_USER              @"Chat/denyMemberChat"
#define API_CHAT_CHECK_DENY             @"Chat/checkDenyChat"
#define API_CHAT_GET_CHAT_LIST          @"Chat/getLastMessages"
#define API_CHAT_GET_MEMBER_LIST        @"Chat/getChatMembers"


#define API_REQUEST_JOIN_CORETECH       @"Members/sendJoinMember"
#define API_CHECK_PORPUSE_JOIN          @"Members/checkJoinPorpuse"
#define API_DENY_PORPUSE_JOIN           @"Members/changeDenyJoinState"
#define API_ACCEPT_PORPUSE_JOIN         @"Members/changeAttendJoinState"


#define PUSH_DATA_CORETECH_TYPE         @"coretech"
#define PUSH_DATA_CHAT_TYPE             @"chat"
#define PUSH_DATA_MESSAGE_TYPE          @"chatMessage"


#define DEFAULTS_MEMBER_INFO            @"kMemberInfo"

#define DEFAULTS_PUSH_DATA              @"kPushData"

#define DEFAULTS_REGISTER_ACCESSTOKEN   @"kRegAccessToken"
#define DEFAULTS_REGISTER_TEMP          @"userTempRegister"
#define DEFAULTS_REGISTER_NAME          @"kRegName"
#define DEFAULTS_REGISTER_NICKNAME      @"kRegNickname"
#define DEFAULTS_REGISTER_EMAIL         @"kRegEmail"
#define DEFAULTS_REGISTER_PASSWORD      @"kRegPassword"
#define DEFAULTS_REGISTER_CONTRY        @"kRegContry"
#define DEFAULTS_REGISTER_SIDO          @"kRegSIDO"
#define DEFAULTS_REGISTER_JIKGUN        @"kRegJIKGUN"
#define DEFAULTS_REGISTER_EXPER         @"kRegExper"
#define DEFAULTS_REGISTER_COMPANY       @"kRegCompany"
#define DEFAULTS_REGISTER_EX_JOB        @"kRegExJob"
#define DEFAULTS_REGISTER_MAJOR         @"kRegMajor"
#define DEFAULTS_REGISTER_DEGREE        @"kRegDegree"
#define DEFAULTS_REGISTER_ETC_MAJOR     @"kRegEtcMajor"
#define DEFAULTS_REGISTER_KEYWORD       @"kRegKeywords"
#define DEFAULTS_REGISTER_USER_PROFILE  @"kRegProfileImage"
#define DEFAULTS_REGISTER_SPOT_TYPE     @"kRegSpot"

#define DEFAULTS_CORETECH               @"kCoreTech"
#define DEFAULTS_CORETECH_KEYWORDS      @"kCoreKeywords"
#define DEFAULTS_CORETECH_DESCRIPTION   @"kCoreDescription"
#define DEFAULTS_CORETECH_LEVEL         @"kCoreLevel"
#define DEFAULTS_CORETECH_CUSTOMER      @"kCoreCustomers"
#define DEFAULTS_CORETECH_DETAIL_DESC   @"kCoreDetailDescription"
#define DEFAULTS_CORETECH_BUSI_PLAN     @"kCoreDetailBusinessPlan"
#define DEFAULTS_CORETECH_NEED_MEMBER   @"kCoreNeedMember"

#define DEFAULTS_USERNAME               @"kUsername"





#define E_TIMEOUT               99              // 인증시간 대기초과 (타임아웃)
#define E_SERVER                100             // 서버에러
#define E_NOTFOUND              -16             // 404에러
#define E_REQTIMEOUT            -17             // Request Timeout
