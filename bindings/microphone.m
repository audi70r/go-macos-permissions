#import <AVFoundation/AVFoundation.h>
#import "microphone.h"

bool checkMicrophonePermission(void) {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    return status == AVAuthorizationStatusAuthorized;
}

bool requestMicrophonePermission(void) {
    __block bool granted = false;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL isGranted) {
        granted = isGranted;
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return granted;
}