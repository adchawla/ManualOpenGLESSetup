//
//  MyOpenGLView.m
//  ManualOpenGLESSetup
//
//  Created by Amandeep Chawla on 17/03/16.
//  Copyright © 2016 Amandeep Chawla. All rights reserved.
//

#import "MyOpenGLView.h"
#import <OPENGLES/ES2/gl.h>

@implementation MyOpenGLView

+(Class)layerClass {
    return [CAEAGLLayer class];
}

-(int) initializeFrameBuffer {
    glGenBuffers(1, &displayFrameBufffer);
    glBindFramebuffer(GL_FRAMEBUFFER, displayFrameBufffer);
    
    //create a render buffer for the frame buffer
    GLuint rbo;
    glGenRenderbuffers(1, &rbo);
    glBindRenderbuffer(GL_RENDERBUFFER, rbo);
    colorRenderBuffer = rbo;
    CAEAGLLayer* layer = (CAEAGLLayer *)self.layer;
    
    //allocate memory for the rbo.
    [context renderbufferStorage:GL_RENDERBUFFER fromDrawable:layer];
    
    
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &frameBufferWidth);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &frameBufferHeight);
    
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, rbo);
    
    // create a depth buffer for the EBO.
    GLuint depthRBO;
    glGenRenderbuffers(1, &depthRBO);
    glBindRenderbuffer(GL_RENDERBUFFER, depthRBO);
    
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, frameBufferWidth, frameBufferHeight);
    
    // attach the depth buffer to the FBO
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthRBO);
    
    GLenum success = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    if ( success == GL_FRAMEBUFFER_COMPLETE ) {
        NSLog(@"Frame Buffer created successfully" );
    }
    
    return displayFrameBufffer;
    
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // create context for OpenGL ES2
        context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
        
        // make the context as current
        [EAGLContext setCurrentContext:context];
        
        // create the display frame buffer
        [self initializeFrameBuffer];
        
//        [self draw];
    }
    return self;
}

-(void) draw {
    // bind to display frame buffer
    glBindFramebuffer(GL_FRAMEBUFFER, displayFrameBufffer);
    glBindRenderbuffer(GL_RENDERBUFFER, colorRenderBuffer);
    
    glClearColor(1.0, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    // make open GL calls
    [context presentRenderbuffer:GL_RENDERBUFFER];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
