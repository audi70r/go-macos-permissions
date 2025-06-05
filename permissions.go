package permissions

/*
#cgo CFLAGS: -x objective-c
#cgo LDFLAGS: -framework AVFoundation -framework AppKit -framework ApplicationServices -framework CoreGraphics
#include "bindings/camera.h"
#include "bindings/microphone.h"
#include "bindings/accessibility.h"
#include "bindings/screen_recording.h"
#include "bindings/camera.m"
#include "bindings/microphone.m"
#include "bindings/accessibility.m"
#include "bindings/screen_recording.m"
*/
import "C"
import "errors"

func CheckCamera() bool {
	return bool(C.checkCameraPermission())
}

func RequestCamera() error {
	result := C.requestCameraPermission()
	if !result {
		return errors.New("camera permission request failed or was denied")
	}
	return nil
}

func CheckMicrophone() bool {
	return bool(C.checkMicrophonePermission())
}

func RequestMicrophone() error {
	result := C.requestMicrophonePermission()
	if !result {
		return errors.New("microphone permission request failed or was denied")
	}
	return nil
}

func CheckAccessibility() bool {
	return bool(C.checkAccessibilityPermission())
}

func RequestAccessibility() error {
	C.requestAccessibilityPermission()
	return nil
}

func CheckScreenRecording() bool {
	return bool(C.checkScreenRecordingPermission())
}

func RequestScreenRecording() error {
	C.requestScreenRecordingPermission()
	return nil
}