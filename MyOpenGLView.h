//
//  MyOpenGLView.h
//  ManualOpenGLESSetup
//
//  Created by Amandeep Chawla on 17/03/16.
//  Copyright © 2016 Amandeep Chawla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOpenGLView : UIView {
    GLuint displayFrameBufffer;
    GLuint colorRenderBuffer;
    int frameBufferWidth;
    int frameBufferHeight;
    EAGLContext* context;
}
-(void)draw;
@end
