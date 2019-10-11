### Dependencies

- Add to pubspec.yaml the dependencies below, afeter "cupertino_icons":

```bash
path_provider: ^1.3.0
image_picker: ^0.6.1+4
```

### Setup the iOS configuration to use Camera permission

- Open the file Info.plist file, located in <project root>/ios/Runner/Info.plist, and include:

```bash
<key>NSPhotoLibraryUsageDescription</key>
<string>Message asking permission</string>

<key>NSCameraUsageDescription</key>
<string>Message asking permission</string>

<key>NSMicrophoneUsageDescription</key>
<string>Message asking permission</string>
```

### How to use ?

The return default type is base64, but you can change the flag "getBase64" to false if you preferer the "File" type.

```bash
1 - Future<dynamic> openCamera: 
Open the Camera and return the image 

2 - Future<dynamic> openGallery: 
Open the Gallery and return the image 
