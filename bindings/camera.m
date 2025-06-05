#import <AVFoundation/AVFoundation.h>
#import "camera.h"

bool checkCameraPermission(void) {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    return status == AVAuthorizationStatusAuthorized;
}

bool requestCameraPermission(void) {
    __block bool granted = false;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL isGranted) {
        granted = isGranted;
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return granted;
}