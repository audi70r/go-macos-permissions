package main

import (
	"fmt"
	"log"

	"github.com/audi70r/go-macos-permissions"
)

func main() {
	fmt.Println("macOS Permissions Demo")
	fmt.Println("======================")

	fmt.Println("\n1. Camera Permission:")
	fmt.Printf("   Current status: %v\n", permissions.CheckCamera())
	fmt.Println("   Requesting permission...")
	if err := permissions.RequestCamera(); err != nil {
		log.Printf("   Failed to request camera permission: %v\n", err)
	} else {
		fmt.Printf("   New status: %v\n", permissions.CheckCamera())
	}

	fmt.Println("\n2. Microphone Permission:")
	fmt.Printf("   Current status: %v\n", permissions.CheckMicrophone())
	fmt.Println("   Requesting permission...")
	if err := permissions.RequestMicrophone(); err != nil {
		log.Printf("   Failed to request microphone permission: %v\n", err)
	} else {
		fmt.Printf("   New status: %v\n", permissions.CheckMicrophone())
	}

	fmt.Println("\n3. Accessibility Permission:")
	fmt.Printf("   Current status: %v\n", permissions.CheckAccessibility())
	fmt.Println("   Opening System Preferences...")
	if err := permissions.RequestAccessibility(); err != nil {
		log.Printf("   Failed to open accessibility settings: %v\n", err)
	}

	fmt.Println("\n4. Screen Recording Permission:")
	fmt.Printf("   Current status: %v\n", permissions.CheckScreenRecording())
	fmt.Println("   Opening System Preferences...")
	if err := permissions.RequestScreenRecording(); err != nil {
		log.Printf("   Failed to open screen recording settings: %v\n", err)
	}

	fmt.Println("\nDemo completed!")
}
