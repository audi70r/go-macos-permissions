#import <ApplicationServices/ApplicationServices.h>
#import <AppKit/AppKit.h>
#import "accessibility.h"

bool checkAccessibilityPermission(void) {
    return AXIsProcessTrusted();
}

void requestAccessibilityPermission(void) {
    NSDictionary *options = @{(__bridge id)kAXTrustedCheckOptionPrompt: @YES};
    AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);
}