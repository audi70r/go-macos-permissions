package permissions

import "testing"

func TestCheckCamera(t *testing.T) {
	_ = CheckCamera()
}

func TestCheckMicrophone(t *testing.T) {
	_ = CheckMicrophone()
}

func TestCheckAccessibility(t *testing.T) {
	_ = CheckAccessibility()
}

func TestCheckScreenRecording(t *testing.T) {
	_ = CheckScreenRecording()
}