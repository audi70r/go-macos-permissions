#import <CoreGraphics/CoreGraphics.h>
#import <AppKit/AppKit.h>
#import "screen_recording.h"

bool checkScreenRecordingPermission(void) {
    if (@available(macOS 10.15, *)) {
        CFArrayRef windowList = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
        NSUInteger numberOfWindows = CFArrayGetCount(windowList);
        NSUInteger numberOfWindowsWithName = 0;
        
        for (int idx = 0; idx < numberOfWindows; idx++) {
            NSDictionary *windowInfo = (NSDictionary *)CFArrayGetValueAtIndex(windowList, idx);
            NSString *windowName = windowInfo[(id)kCGWindowName];
            if (windowName) {
                numberOfWindowsWithName++;
            } else {
                NSNumber *pid = windowInfo[(id)kCGWindowOwnerPID];
                if (pid && [pid intValue] != getpid()) {
                    CFRelease(windowList);
                    return false;
                }
            }
        }
        
        CFRelease(windowList);
        return true;
    }
    return true;
}

void requestScreenRecordingPermission(void) {
    NSString *urlString = @"x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture";
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];
}