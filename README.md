SECURITY DEVICES ASSET MANAGEMENT (iOS Mobile Application)

    OVERVIEW
The main goal is to reduce the average incident resolution time by up to 80%, giving field technicians instant access to all camera information directly on their mobile devices.

    EXPECTED BENEFITS
- Reduce incident response time by up to 80%
- Eliminate reliance on analysts for technical data
- Provide quick access to location and visual references
- Ensure accurate, up-to-date documentation
- Improve technician autonomy, efficiency, and accuracy

    FEATURES
- User Authentication: secure login for technicians
- Add a New Camera:
  - Camera model and serial number
  - MAC address, IP address, subnet mask
  - Admin username and password
  - Automatic GPS capture (latitude/longitude) ---> COOMING SOON
  - Photo upload showing the camera’s field of view ---> WORK IN PROGRESS
- QR Code & Label Generation:
 	  - Unique camera ID with QR code
 	  - Label printing via portable Bluetooth/Wi-Fi printer ---> COOMING SOON
- Search or Scan Camera:
 	  - Scan QR code to view details (photo, GPS, configuration)
- Edit Camera Information: update IP, credentials, or other details
- Delete Camera: remove records when a device is replaced or retired
- Printer Communication: direct label printing from the app ---> COOMING SOON
  
    TECH STACK
- Swift / SwiftUI
- Firebase Firestore
- Xcode
- CoreLocation
- Bluetooth/Wi-Fi APIs
  
      PROJECT STRUCTURE
├── Assets/              # Icons and images
├── Models/              # Data structures (Camera, User, Printer)
├── Views/               # SwiftUI screens
├── ViewModels/          # Logic and bindings
├── Services/            # External integrations (Firestore, Printer)
└── README.md            # Project documentation


    INSTALLATION & USAGE
- Clone this repository: git clone https://github.com/LuanarTonelli2024/security-devices-assets-management.git
- Open the project in Xcode
- Add your Firebase configuration file (GoogleService-Info.plist)
- Build and run on a simulator or physical iOS device

    CONTRIBUTIONS
Contributions are welcome!
  To collaborate:
- Fork the project
- Create a branch (feature/new-feature)
- Submit a pull request


    REFERENCES
Scanning QR codes with SwiftUI - a free Hacking with iOS: SwiftUI Edition tutorial: https://www.hackingwithswift.com/books/ios-swiftui/scanning-qr-codes-with-swiftui

