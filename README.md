# Katika - Motion Graphics Video Creator

An iOS application for learning and creating motion graphics videos with comprehensive training modules and project management tools.

![](https://github.com/AmirJahan/Katika/blob/main/sc.png)


## Overview

Katika teaches users how to create motion graphics videos through interactive training modules while providing a full suite of tools for scriptwriting, graphics assembly, shot planning, voice-overs, and video export.

## Features

### Training Modules
- **Break Apart**: Learn to decompose videos into individual shots
- **Definition**: Understand motion graphics fundamentals
- **Script**: Master scriptwriting techniques
- **Graphics**: Assemble visual elements into shots
- **Collaboration**: Work with team members
- **Motion**: Add animations to objects
- **Shotlist**: Organize scripts into shots
- **Export**: Generate final videos

### Project Management
- Create and manage multiple video projects
- Store scripts with collaborative comments
- Organize shots with duration and timing
- Manage graphics/artwork sets
- Record voice-overs with speech-to-text
- Track project metadata

### Animation System
- Keyframe animation for:
  - Position (X, Y)
  - Rotation
  - Scale (X, Y)
  - Opacity/Alpha

## Tech Stack

| Component | Technology |
|-----------|------------|
| Language | Swift |
| Platform | iOS (iPad-optimized, landscape) |
| Architecture | MVC with Storyboards |
| UI Framework | UIKit |
| Dependencies | PocketSVG ~> 2.0, Colorful ~> 3.0 |
| Data Persistence | NSCoding protocol |
| Permissions | Microphone, Speech Recognition |

## Project Structure

```
Katika/
├── Data Classes/           # 37 data model files
│   ├── Project.swift       # Video project container
│   ├── Shot.swift          # Individual shot data
│   ├── Artwork.swift       # Visual elements
│   └── ...
├── Project/                # Project editing screens
│   ├── Home/               # Project management
│   ├── Script/             # Script editing
│   ├── Shotlist/           # Shot organization
│   ├── Graphics/           # Graphics assembly
│   └── Export/             # Video export
├── Training/               # Training module VCs
│   ├── BreakApart/
│   ├── Script/
│   ├── Graphics/
│   └── ...
└── App settings/           # Extensions & utilities
```

## Requirements

- iOS 9.0+ (iPad recommended)
- Xcode with CocoaPods
- Landscape orientation only

## Getting Started

1. Clone the repository
2. Run `pod install`
3. Open `Katika.xcworkspace`
4. Build and run on iPad simulator or device

## Usage Flow

1. **Launch**: Enter user name on welcome screen
2. **Learn**: Complete training modules to understand video creation
3. **Create**: Start a new project
4. **Design**: Write scripts → Create shotlist → Add graphics → Record voice-overs
5. **Animate**: Add keyframe animations to elements
6. **Export**: Generate final video output

---


