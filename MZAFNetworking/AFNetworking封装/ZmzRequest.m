//
//  ZmzRequest.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/9/30.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ZmzRequest.h"

@interface ZmzRequest()

@property(nonatomic,strong)ZmzAFNetworking *networking;
@end

@implementation ZmzRequest


- (void)getDateWithParams:(NSDictionary *)params WithDataBlock:(sendData)sendBlock{
    
    self.networking = [[ZmzAFNetworking alloc]init];
    
    [self.networking requsetWithPath:@"timeline/list" withParams:params withCacheType:YBCacheTypeReturnCacheDataThenLoad withRequestType:NetworkPostType withResult:^(id responseObject, NSError *error) {

        if (!error) {
            NSDictionary *dataDic = (NSDictionary *)responseObject;
            
            sendBlock(dataDic,YES);
        }else{
            sendBlock(error,NO);
        }
        
    }];
    
    
}

-(void)getListDataBlock:(sendData)sendBlock{
    
    self.networking = [[ZmzAFNetworking alloc]init];
  
    [self.networking requsetWithPath:@"http://api2.pianke.me/pub/today" withParams:nil withCacheType:YBCacheTypeReturnCacheDataThenLoad withRequestType:NetworkGetType withResult:^(id responseObject, NSError *error) {
       
        if (!error) {
            NSDictionary *dic = (NSDictionary *)responseObject;
            sendBlock(dic,YES);
        }else{
            sendBlock(error,NO);
        }

        
    }];
    
}



@end
