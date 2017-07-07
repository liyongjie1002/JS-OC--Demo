//
//  ViewController.m
//  JS调用OC方法
//
//  Created by liyongjie on 2017/7/7.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>


@interface ViewController ()<WKScriptMessageHandler>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    [userContentController addScriptMessageHandler:self name:@"StartGame"];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = userContentController;
    
    //HTML小白水平不高请见谅,加载的按钮可能会很小,使用模拟器双击放大即可
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:config];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"time" ofType:@"html"]]]];
    

    [self.view addSubview:webView];
    


}



-(void)function{

    NSLog(@"------------=======华丽的分割线=======-----------------");
}


#pragma mark
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
 
    if ([message.name isEqualToString:@"StartGame"]) {
        
        
        [self function];
    }
}


@end
