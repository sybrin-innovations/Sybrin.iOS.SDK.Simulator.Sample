# Sybrin.iOS.SDK.Simulator.Sample
An example project showing how to make use of build schemes to build a project on a simulator while the Sybrin SDK's are still part of the project.

## How it works
This project allows you to use different build schemes to omit the Sybrin SDK's from the build process

To run on a physical device select the 'RealDevice' scheme.
To run on a simulator select the 'Simulator' scheme.

## Prerequisites
The Pods folder has been omitted from the repo due to size constraints. Please run the following commands where relevant.

### Pods
Run in the <project_root>/ directory.
  ```sh
  pod install
  ```

## Known Issues
### Failed to build module from its module interface
This issue is caused by the ML Kit dependency not having module stability. To workaround this problem (permanent fix pending), you can simply delete the import MLKit statement from the .swiftinterface file.

Visual guide for implementing fix:
![Gif showing how to remove MLKit import from .swiftinterface file](images/iOS_Module_Stability.gif)

### Video Tutorial
Coming Soon!

