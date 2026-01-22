//
//  OCRuntime.m
//  MyFoundation
//
//  Created by Derek on 2026/1/22.
//

#import "KKOCRuntime.h"
#import <MyFoundation/KKMacros.h>

NS_ASSUME_NONNULL_BEGIN

KK_FORCE_INLINE BOOL al_swizzle_method(Class cls, BOOL isClassMethod, SEL originalSEL, SEL swizzledSEL) {
    Method originalMethod = isClassMethod ? class_getClassMethod(cls, originalSEL) : class_getInstanceMethod(cls, originalSEL);
    Method swizzledMethod = isClassMethod ? class_getClassMethod(cls, swizzledSEL) : class_getInstanceMethod(cls, swizzledSEL);
    
    if (originalMethod == NULL) {
        // TODO：断言
        return NO;
    }
    
    if (swizzledMethod == NULL) {
        // TODO：断言
        return NO;
    }
    
    if (isClassMethod) {
        cls = object_getClass(cls);
    }
    
    BOOL methodDidAdd = class_addMethod(cls, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (methodDidAdd) {
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    return YES;
}


NS_ASSUME_NONNULL_END
