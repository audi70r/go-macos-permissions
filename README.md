# go-macos-permissions

A Go library for checking and requesting macOS system permissions through Objective-C/C bindings.

## Features

- Camera permission check and request
- Microphone permission check and request  
- Accessibility permission check and indirect request
- Screen Recording permission check and indirect request

## Installation

```bash
go get github.com/audi70r/go-macos-permissions
```

## Usage

```go
import "github.com/audi70r/go-macos-permissions"

// Check camera permission
hasCameraAccess := permissions.CheckCamera()

// Request camera permission
err := permissions.RequestCamera()
if err != nil {
    // Handle error
}

// Check microphone permission
hasMicAccess := permissions.CheckMicrophone()

// Request microphone permission  
err := permissions.RequestMicrophone()
if err != nil {
    // Handle error
}

// Check accessibility permission
hasAccessibility := permissions.CheckAccessibility()

// Request accessibility (opens System Preferences)
permissions.RequestAccessibility()

// Check screen recording permission
hasScreenRecording := permissions.CheckScreenRecording()

// Request screen recording (opens System Preferences)
permissions.RequestScreenRecording()
```

## Requirements

- macOS 10.15+
- Go 1.16+
- Xcode Command Line Tools

## Permission Behavior

| Permission       | Check | Request Type         | Notes                                              |
|------------------|-------|----------------------|----------------------------------------------------|
| Camera           | ✅    | System Dialog        | Uses AVFoundation framework                        |
| Microphone       | ✅    | System Dialog        | Uses AVFoundation framework                        |
| Accessibility    | ✅    | System Preferences   | Requires manual approval                           |
| Screen Recording | ✅    | System Preferences   | Requires manual toggle in System Preferences       |

## Example

See the [example](example/main.go) directory for a complete demo application.

## License

MIT