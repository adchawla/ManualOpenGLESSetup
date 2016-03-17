//
//  ViewController.h
//  ManualOpenGLESSetup
//
//  Created by Amandeep Chawla on 17/03/16.
//  Copyright © 2016 Amandeep Chawla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    CADisplayLink* displayLink;
}

-(void) startRendering;
-(void) stopRendering;

@end

