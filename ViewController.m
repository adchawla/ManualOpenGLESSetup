//
//  ViewController.m
//  ManualOpenGLESSetup
//
//  Created by Amandeep Chawla on 17/03/16.
//  Copyright © 2016 Amandeep Chawla. All rights reserved.
//

#import "ViewController.h"
#import "MyOpenGLView.h"

@interface ViewController ()
-(void) drawFrame:(CADisplayLink*)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startRendering];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startRendering {
    displayLink = [[UIScreen mainScreen] displayLinkWithTarget:self selector:@selector(drawFrame:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void) stopRendering {
    [displayLink invalidate];
    displayLink = nil;
}

-(void) drawFrame:(CADisplayLink *)sender {
    //refresh the view
    MyOpenGLView * view = (MyOpenGLView*) self.view;
    [view draw];
}

@end
