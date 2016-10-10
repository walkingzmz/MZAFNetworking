//
//  ZmzAFNetworking.m
//  afCach
//
//  Created by CiHon-IOS2 on 16/9/29.
//  Copyright © 2016年 walkingzmz. All rights reserved.
// 30岁前一定有的心态
// 事业永远第一；别把钱看得太重；学会体谅父母；交上好朋友；不要沉迷于任何东西；年轻没有失败；不要轻易崇拜或者鄙视一个人；要有责任心；外貌并不重要；学会保护身体；别觉得一事无成；认真工作；认真对待感情；留一点童心。


#import "ZmzAFNetworking.h"

/**
 *  存放 网络请求的线程
 */
static NSMutableArray *sg_requestTasks;


static NSString *const MAIN_URLL = @"http://api2.pianke.me/";

@interface ZmzAFNetworking()

@property (nonatomic, strong)AFHTTPSessionManager  *manager;
@property (nonatomic, assign, getter=isConnected) BOOL connected;/**<网络是否连接*/
@property (nonatomic, retain) NSURLSessionTask *task;
@end

@implementation ZmzAFNetworking

-(AFHTTPSessionManager *)manager{
    static AFHTTPSessionManager *rmanager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rmanager = [AFHTTPSessionManager manager];
       
        rmanager.responseSerializer = [AFJSONResponseSerializer serializer];
        rmanager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"image/jpg",@"application/x-javascript",@"keep-alive", nil];
        // 设置超时时间
        [rmanager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        rmanager.requestSerializer.timeoutInterval = 60.f;
        [rmanager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
    });
    return rmanager;
}

- (BOOL)isConnected {
    struct sockaddr zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sa_len = sizeof(zeroAddress);
    zeroAddress.sa_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability =
    SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags =
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        printf("Error. Count not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}


-(void)requsetWithPath:(NSString *)path Withparams:(NSDictionary *)params withRequestType:(NetworkRequestType)type withResult:(ZmzBlock)resultBlock{
    
    if (!self.isConnected) {
        NSLog(@"没有网络,建议在手机设置中打开网络");
        return;
    }

    switch (type) {
        case NetworkGetType:
        {
            [self.manager GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 [self handleRequestResultWithDataTask:task responseObject:responseObject error:nil resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 [self handleRequestResultWithDataTask:task responseObject:nil error:error resultBlock:resultBlock];
            }];
        }
            break;
        case NetworkPostType:
        {
             NSString *cutPath = [NSString stringWithFormat:@"%@%@",MAIN_URLL,path];
            [self.manager POST:cutPath parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResultWithDataTask:task responseObject:responseObject error:nil resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task responseObject:nil error:error resultBlock:resultBlock];
            }];
            
        }
            break;
        default:
            break;
    }
}



-(void)downloadWithrequest:(NSString *)urlString downloadpath:(NSString *)downloadpath downloadblock:(ZmzDownBlock)downloadblock{
    if (!self.connected) {
        return;
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    self.task = [self.manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *desturl = [NSURL fileURLWithPath:downloadpath];
        return desturl;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        downloadblock(response,filePath,error);
    }];
    [self.task resume];
    
}


- (void)handleRequestResultWithDataTask:(NSURLSessionDataTask *)task
                         responseObject:(id)responseObject
                                  error:(NSError *)error
                            resultBlock:(ZmzBlock)resultBlock {
    //do something here...
   // NSLog(@"%@==-==%@",responseObject,error);
    if(resultBlock) {
        resultBlock(responseObject,error);
    }
}




- (NSURLSessionTask *)uploadImageWithUrl:(NSString *)url
                              WithParams:(NSDictionary*)params
                                   image:(NSData *)imageData
                                filename:(NSString *)name
                                mimeType:(NSString *)mimetype
                              completion:(requestSuccessBlock)completion
                              errorBlock:(requestFailureBlock)errorBlock{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [self manager];
    NSURLSessionTask *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg",str];
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:mimetype];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
       
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);

    }];
    
    return operation;
    
    
    
}
- (NSURLSessionTask *)uploadVedioWithUrl:(NSString *)url
                              WithParams:(NSDictionary*)params
                                   image:(NSData *)vedioData
                                filename:(NSString *)name
                                mimeType:(NSString *)mimetype
                              completion:(requestSuccessBlock)completion
                              errorBlock:(requestFailureBlock)errorBlock{

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [self manager];

    NSURLSessionTask *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.mp4",str];
    [formData appendPartWithFileData:vedioData name:name fileName:fileName mimeType:mimetype];
    
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    completion(responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    errorBlock(error);
    }];

    return operation;
}







- (void)cancelRequestWithURL:(NSString *)url {
    
    if (url == nil) {
        return;
    }
    
    @synchronized(self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(NSURLSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[NSURLSessionTask class]]
                && [task.currentRequest.URL.absoluteString hasSuffix:url]) {
                [task cancel];
                [[self allTasks] removeObject:task];
                return;
            }
        }];
    };
}

- (void)cancelAllRequest {
    @synchronized(self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(NSURLSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[NSURLSessionTask class]]) {
                [task cancel];
            }
        }];
        
        [[self allTasks] removeAllObjects];
    };
}

- (NSMutableArray *)allTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sg_requestTasks == nil) {
            sg_requestTasks = [[NSMutableArray alloc] init];
        }
    });
    
    return sg_requestTasks;
}
@end
