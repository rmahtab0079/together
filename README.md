# Together App

Together is an iOS application that integrates various IBM Watson services for functionalities such as mapping, event management, and user authentication. The app utilizes a combination of external libraries, including Alamofire, Firebase, and Watson Developer Cloud SDKs.

## Table of Contents
1. [Features](#features)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Dependencies](#dependencies)
5. [Contributing](#contributing)
6. [License](#license)

## Features
- **User Authentication:** Sign in using Google or other methods.
- **Event Management:** Display and manage events with details and images.
- **Mapping:** Visual representation of events on a map using FlyoverKit.
- **Contacts Integration:** Access and display user contacts.
- **Camera Functionality:** Capture and analyze images using Watson Visual Recognition.

## Installation

To install the Together app, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/together.git
   cd together
   ```

2. **Install CocoaPods:**
   Ensure you have CocoaPods installed. If not, install it using:
   ```bash
   sudo gem install cocoapods
   ```

3. **Install the dependencies:**
   Navigate to the project directory and run:
   ```bash
   pod install
   ```

4. **Open the project:**
   Open the `.xcworkspace` file in Xcode.
   ```bash
   open together.xcworkspace
   ```

## Usage

1. **Configure IBM Watson Services:**
   - Obtain API keys and service URLs from the IBM Cloud dashboard.
   - Update the credentials in the `WatsonCredentials.swift` file.

2. **Run the App:**
   - Build and run the app on a simulator or an iOS device.
   - Follow the on-screen instructions to sign in and explore the features.

3. **Explore Features:**
   - Use the map interface to view events.
   - Access contacts and manage them through the ContactsViewController.

## Dependencies
The app utilizes several libraries, which are managed through CocoaPods:

- **Alamofire:** For networking.
- **Firebase:** For user authentication and data storage.
- **FlyoverKit:** For enhanced map visualization.
- **Watson Developer Cloud SDK:** For accessing various Watson services.

## Contributing
We welcome contributions from the community! If you wish to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/MyFeature`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/MyFeature`).
5. Create a new Pull Request.

## License
This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

---

Feel free to reach out for any questions or further clarification!# Watson SDK for iOS

This repository contains the IBM Watson SDK for iOS, which provides developers with a set of tools to integrate various IBM Watson services into their iOS applications. The SDK supports a wide range of functionalities including natural language processing, speech recognition, language translation, tone analysis, visual recognition, and more.

## Major Components

### 1. **Core Components**
   - **Models**: Defines the data structures used across the various Watson services, including entities, intents, and responses.
   - **Networking Layer**: Handles HTTP requests and responses to and from the IBM Watson services.
   - **Error Handling**: Provides a structured way to manage errors that may occur during service calls.

### 2. **Service Implementations**
   - **Natural Language Understanding**: Analyzes text to extract insights such as keywords, categories, and sentiment.
   - **Text to Speech**: Converts written text into natural-sounding audio in various languages.
   - **Speech to Text**: Transcribes spoken audio into written text.
   - **Language Translation**: Translates text from one language to another.
   - **Tone Analyzer**: Analyzes the tone of written text to provide insights into emotions and sentiments.
   - **Visual Recognition**: Identifies and classifies images using machine learning models.

### 3. **Testing**
   - Unit tests for each service implementation ensure that the SDK behaves as expected. Mock services and sample data are provided for testing purposes.

## Installation Instructions

To install the Watson SDK for iOS, you can use CocoaPods or Swift Package Manager.

### Using CocoaPods

1. Add the following line to your `Podfile`:

   ```ruby
   pod 'WatsonSDK'
   ```

2. Run the following command to install the pod:

   ```bash
   pod install
   ```

### Using Swift Package Manager

1. Open your Xcode project and go to **File > Swift Packages > Add Package Dependency**.
2. Enter the repository URL of the Watson SDK and select the version you want to use.
3. Follow the prompts to complete the integration.

## Usage Instructions

### Importing the SDK

Before using the SDK, make sure to import the necessary modules in your Swift files:

```swift
import WatsonSDK
```

### Example Usage

#### Natural Language Understanding

```swift
let nlu = NaturalLanguageUnderstanding(apiKey: "YOUR_API_KEY")

let text = "IBM Watson is an amazing technology."
let parameters = NLUParameters(text: text)

nlu.analyze(parameters: parameters) { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let response = response {
        print("Analysis: \(response)")
    }
}
```

#### Text to Speech

```swift
let textToSpeech = TextToSpeech(apiKey: "YOUR_API_KEY")

textToSpeech.synthesize(text: "Hello, world!") { audioData, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let audioData = audioData {
        // Handle audio data
    }
}
```

### Important Notes

- Ensure you have a valid API key for each IBM Watson service you wish to use.
- The SDK requires an internet connection to communicate with IBM Watson services.
- For more detailed information about each service, refer to the IBM Watson documentation.

## Contributing

Contributions are welcome! Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on how to contribute to the project.

## License

This project is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for details.# IBM Watson Swift SDK

The IBM Watson Swift SDK provides a set of APIs for integrating various IBM Watson services into your Swift applications. This SDK supports functionalities such as speech recognition, natural language processing, personality insights, and more. 

## Major Components

1. **Speech to Text**: This service allows you to convert audio to text in real-time or from audio files. It supports various audio formats and provides features like keyword spotting and word alternatives.

2. **Personality Insights**: This service analyzes text data to extract personality traits and preferences of users, helping to understand user behavior and improve engagement.

3. **Discovery**: IBM Watson Discovery enables the creation of cognitive applications that can analyze and extract insights from large volumes of unstructured data.

4. **Assistant**: The Assistant service allows you to build conversational agents that can engage users in a dialogue, providing answers and assistance as needed.

## Installation

To install the IBM Watson Swift SDK, follow these steps:

1. **CocoaPods**: Add the following line to your Podfile:
   ```ruby
   pod 'IBMWatsonSwiftSDK'
   ```

   Then run:
   ```bash
   pod install
   ```

2. **Carthage**: If you prefer using Carthage, add the following line to your Cartfile:
   ```
   github "IBM/Swift-SDK"
   ```

   Then run:
   ```bash
   carthage update --platform iOS
   ```

3. **Manually**: Download the SDK and include it in your project.

## Usage

### Speech to Text Example

To use the Speech to Text service, you first need to initialize the service with your API key:

```swift
import SpeechToTextV1

let apiKey = "your-api-key"
let speechToText = SpeechToText(apiKey: apiKey)

let audioFile = Bundle.main.url(forResource: "filename", withExtension: "wav")!
let settings = RecognitionSettings(contentType: "audio/wav")

speechToText.recognize(audio: audioFile, settings: settings) { response, error in
    if let error = error {
        print(error)
    }
    guard let results = response?.result else {
        print("Failed to recognize the audio")
        return
    }
    print(results)
}
```

### Personality Insights Example

To get personality insights from a text input:

```swift
import PersonalityInsightsV3

let apiKey = "your-api-key"
let personalityInsights = PersonalityInsights(version: "YYYY-MM-DD", apiKey: apiKey)

let content = ProfileContent.text("your-text")

personalityInsights.profile(profileContent: content) { response, error in
    if let error = error {
        print(error)
    }
    guard let profile = response?.result else {
        print("Failed to generate profile")
        return
    }
    print(profile)
}
```

### Assistant Example

To create a session with the Assistant service:

```swift
import AssistantV2

let apiKey = "your-api-key"
let assistant = Assistant(version: "YYYY-MM-DD", apiKey: apiKey)

assistant.createSession(assistantID: "your-assistant-id") { response, error in
    if let error = error {
        print(error)
    }
    guard let session = response?.result else {
        print("Failed to create a session")
        return
    }
    print("Session created: \(session.sessionID)")
}
```

## Additional Resources

- [IBM Watson Speech to Text Documentation](https://cloud.ibm.com/docs/services/speech-to-text?topic=speech-to-text-using)
- [IBM Watson Personality Insights Documentation](https://cloud.ibm.com/docs/services/personality-insights?topic=personality-insights-using)
- [IBM Watson Assistant Documentation](https://cloud.ibm.com/docs/services/assistant?topic=assistant-using)

For further questions regarding integration, please refer to the official documentation or use community forums such as Stack Overflow.# IBM Watson SDK for Swift

This repository contains the Swift SDK for IBM Watson services, providing developers with a set of tools to integrate various cognitive services into their applications. The services included in this SDK are:

- Speech to Text
- Natural Language Understanding
- Tone Analyzer
- Natural Language Classifier
- Visual Recognition
- Language Translator
- Compare and Comply

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
   - [Speech to Text](#speech-to-text)
   - [Natural Language Understanding](#natural-language-understanding)
   - [Tone Analyzer](#tone-analyzer)
   - [Natural Language Classifier](#natural-language-classifier)
   - [Visual Recognition](#visual-recognition)
   - [Language Translator](#language-translator)
   - [Compare and Comply](#compare-and-comply)
3. [Contributing](#contributing)
4. [License](#license)

## Installation

To use the IBM Watson SDK in your Swift project, you can add it as a dependency using Swift Package Manager. Add the following line to your `Package.swift` file:

```swift
.package(url: "https://github.com/IBM/Swift-Watson.git", from: "1.0.0")
```

Then, add the relevant services to your target dependencies.

## Usage

### Speech to Text

To transcribe audio using the Speech to Text service:

```swift
import SpeechToTextV1

let apiKey = "your-api-key"
let speechToText = SpeechToText(apiKey: apiKey)

let audioData: Data = // Your audio file data
speechToText.recognize(audio: audioData, completionHandler: { response, error in
    // Handle the response or error
})
```

### Natural Language Understanding

To analyze text for various features like sentiment, emotion, and entity recognition:

```swift
import NaturalLanguageUnderstandingV1

let apiKey = "your-api-key"
let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(apiKey: apiKey)

let text = "your-text"
naturalLanguageUnderstanding.analyze(features: features, text: text) { response, error in
    // Handle the response or error
}
```

### Tone Analyzer

To analyze the tone of a given text:

```swift
import ToneAnalyzerV3

let apiKey = "your-api-key"
let toneAnalyzer = ToneAnalyzer(apiKey: apiKey)

let text = "your-input-text"
toneAnalyzer.tone(toneContent: .toneInput(ToneInput(text: text))) { response, error in
    // Handle the response or error
}
```

### Natural Language Classifier

To classify text into predefined classes:

```swift
import NaturalLanguageClassifierV1

let apiKey = "your-api-key"
let classifier = NaturalLanguageClassifier(apiKey: apiKey)

let classifierID = "your-classifier-id"
let text = "your-text"
classifier.classify(classifierID: classifierID, text: text) { response, error in
    // Handle the response or error
}
```

### Visual Recognition

To analyze images for scenes, objects, and faces:

```swift
import VisualRecognitionV3

let apiKey = "your-api-key"
let visualRecognition = VisualRecognition(apiKey: apiKey)

let imageURL = Bundle.main.url(forResource: "image", withExtension: "jpg")!
visualRecognition.classify(imagesFile: imageURL) { response, error in
    // Handle the response or error
}
```

### Language Translator

To translate text from one language to another:

```swift
import LanguageTranslatorV3

let apiKey = "your-api-key"
let languageTranslator = LanguageTranslator(apiKey: apiKey)

languageTranslator.translate(text: ["Hello"], source: "en", target: "es") { response, error in
    // Handle the response or error
}
```

### Compare and Comply

To extract data from contracts and governing documents:

```swift
import CompareComplyV1

let apiKey = "your-api-key"
let compareComply = CompareComply(apiKey: apiKey)

let documentURL = URL(fileURLWithPath: "./Documents/ContractA.pdf")
compareComply.classifyElements(file: documentURL) { response, error in
    // Handle the response or error
}
```

## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests for any improvements or bug fixes.

## License

This SDK is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for more details.# IBM Watson Text to Speech SDK for Swift

## Overview

The IBM Watson Text to Speech SDK for Swift enables developers to synthesize natural-sounding speech from input text in various languages. This repository provides a comprehensive implementation of the Text to Speech service, including support for WAV audio format, error handling, and customization through various API calls.

## Major Components

1. **WAV Repair**: A class responsible for converting and repairing WAV files, ensuring they are formatted correctly for playback.

2. **Error Handling**: Enums (`OpusError`, `OggError`) that define various error states for the SDK, allowing developers to handle API errors gracefully.

3. **Text to Speech Service**: The main class (`TextToSpeech`) that handles API requests, manages authentication, and provides methods for synthesizing speech.

4. **Audio Handling**: Classes (`SpeechToTextSession`, `SpeechToTextRecorder`, `SpeechToTextEncoder`) that manage audio input and output, including microphone recording and streaming audio data to the Text to Speech service.

5. **Models**: Data structures (e.g., `TrainingExample`, `ConsumptionPreferences`, `Behavior`) that encapsulate the various input and output formats for the Text to Speech service.

## Installation

To install the IBM Watson Text to Speech SDK for Swift, follow these steps:

1. **CocoaPods**: Add the following line to your Podfile:
   ```ruby
   pod 'TextToSpeechV1'
   ```

2. **Swift Package Manager**: Add the package dependency by modifying your `Package.swift` file:
   ```swift
   .package(url: "https://github.com/watson-developer-cloud/swift-sdk.git", from: "x.x.x")
   ```

3. **Direct Import**: Clone the repository directly into your project or import the relevant files as needed.

## Usage

To utilize the Text to Speech service, follow these instructions:

1. **Import the SDK**:
   ```swift
   import TextToSpeechV1
   import AVFoundation
   ```

2. **Initialize the Service**:
   ```swift
   let apiKey = "your-api-key"
   let textToSpeech = TextToSpeech(apiKey: apiKey)
   ```

3. **Synthesize Text**:
   Use the `synthesize` method to convert text to speech:
   ```swift
   let text = "Hello, world!"
   textToSpeech.synthesize(text: text, accept: "audio/wav") { response, error in
       if let error = error {
           print("Error synthesizing text: \(error)")
           return
       }
       guard let data = response?.result else {
           print("Failed to synthesize the text")
           return
       }
       do {
           let audioPlayer = try AVAudioPlayer(data: data)
           audioPlayer.prepareToPlay()
           audioPlayer.play()
       } catch {
           print("Error playing audio: \(error)")
       }
   }
   ```

4. **Using Custom Voices**:
   To use a specific voice, provide the `voice` parameter:
   ```swift
   textToSpeech.synthesize(text: text, accept: "audio/wav", voice: "en-US_LisaVoice") { response, error in
       // Handle response
   }
   ```

## Additional Resources

- [IBM Watson Text to Speech Documentation](https://cloud.ibm.com/docs/services/text-to-speech?code=swift)
- [IBM Cloud Account](https://cloud.ibm.com/registration)

## License

This project is licensed under the Apache License, Version 2.0. See the LICENSE file for details.

---

By following the above instructions, you should be able to integrate the IBM Watson Text to Speech SDK into your Swift applications and synthesize speech from text with ease.# Speech Recognition SDK

This repository contains a Swift SDK for integrating speech recognition capabilities using IBM's Watson services. The SDK provides a structured approach to handle speech recognition results, manage connections to the Watson Speech-to-Text service, and work with various models and audio resources.

## Major Components

1. **SpeechRecognitionResultsAccumulator**: 
   - A struct that accumulates speech recognition results and speaker labels.

2. **SpeechToTextSocket**: 
   - A class responsible for managing WebSocket connections to the Watson Speech-to-Text service. It handles audio input, manages state (connected, listening, etc.), and processes recognition results.

3. **SpeechRecognitionResults**: 
   - A struct containing the results of a speech recognition request, including information about recognized speech, speaker labels, processing metrics, and warnings.

4. **AudioMetrics**: 
   - A struct that holds information about the audio characteristics of the input audio, such as frequency and signal-to-noise ratio.

5. **Custom Models and Resources**: 
   - The SDK allows for the creation and management of custom language and acoustic models, including functionalities to add words, handle training, and manage audio resources.

6. **Dialog Nodes**: 
   - The SDK also includes functionality to manage dialog nodes for conversational agents, allowing developers to create interactive applications.

## Installation

To install the SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/speech-recognition-sdk.git
   cd speech-recognition-sdk
   ```

2. **Open the Project**:
   - Open the project in Xcode by double-clicking the `.xcodeproj` file.

3. **Add Dependencies**:
   - Ensure you have the necessary dependencies installed. This SDK uses `RestKit` for API requests. You can add it via CocoaPods:
   ```bash
   pod install
   ```

4. **Build the Project**:
   - Build the project in Xcode (Command + B) to ensure all dependencies are correctly linked.

## Usage

Here’s a basic example of how to use the SDK to perform speech recognition:

1. **Import the SDK**:
   ```swift
   import SpeechRecognitionSDK
   ```

2. **Set Up WebSocket Connection**:
   ```swift
   let socket = SpeechToTextSocket(url: yourWebSocketURL, authMethod: yourAuthMethod, defaultHeaders: yourDefaultHeaders)
   socket.onConnect = {
       print("Connected to the service.")
   }
   socket.onResults = { results in
       print("Received results: \(results)")
   }
   ```

3. **Connect to the Service**:
   ```swift
   socket.connect()
   ```

4. **Start Recognition**:
   ```swift
   let recognitionSettings = RecognitionSettings() // Configure your settings
   socket.writeStart(settings: recognitionSettings)
   ```

5. **Send Audio Data**:
   ```swift
   let audioData = Data() // Your audio data here
   socket.writeAudio(audio: audioData)
   ```

6. **Stop Recognition**:
   ```swift
   socket.writeStop()
   ```

## Conclusion

This SDK provides a comprehensive interface to leverage IBM's Watson Speech-to-Text services within your Swift applications. With support for custom models, real-time audio streaming, and dialog management, it’s designed to facilitate the development of advanced speech recognition features. 

For further information, please refer to the official [IBM Watson Speech-to-Text documentation](https://cloud.ibm.com/docs/services/speech-to-text).# README.md

## Overview

This repository contains a collection of Swift-based implementations for various IBM Watson services, including Natural Language Classifier, Visual Recognition, Text to Speech, Speech to Text, and Compare and Comply. Each service is encapsulated in its respective module, allowing for streamlined integration and usage in Swift applications.

## Major Components

### 1. Natural Language Classifier
- **Functionality**: Classifies text into categories based on trained models.
- **Key Methods**:
  - `createClassifier`: Create a new classifier using training data.
  - `classify`: Classify a given text.
  - `listClassifiers`: Retrieve all user-trained classifiers.

### 2. Visual Recognition
- **Functionality**: Analyzes images to classify objects and detect faces.
- **Key Methods**:
  - `classify`: Classify an image by URL or data.
  - `detectFaces`: Detect faces in an image.
  - `createClassifier`: Create a new visual recognition classifier.

### 3. Text to Speech
- **Functionality**: Converts text into spoken audio in various languages and voices.
- **Key Methods**:
  - `synthesize`: Generate audio from text.
  - `listVoices`: Retrieve available voices for synthesis.

### 4. Speech to Text
- **Functionality**: Converts audio into text.
- **Key Methods**:
  - `recognize`: Recognize speech from audio files.
  - `createJob`: Create an asynchronous speech recognition job.

### 5. Compare and Comply
- **Functionality**: Compares and analyzes documents, extracting key information and identifying sections.
- **Key Methods**:
  - `convertToHTML`: Convert documents to HTML format.
  - `classifyElements`: Classify elements in the document.
  - `compareDocuments`: Compare two documents for differences.

## Installation

To use the IBM Watson services in your Swift project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/repository.git
   cd repository
   ```

2. **Install Dependencies**:
   Make sure you have the Swift Package Manager installed. You can add the dependencies to your `Package.swift` file.

3. **Configure Watson Credentials**:
   Create a file named `WatsonCredentials.swift` and add your IBM Watson service credentials in the following format:
   ```swift
   struct WatsonCredentials {
       static let NaturalLanguageClassifierAPIKey = "your-api-key"
       static let VisualRecognitionAPIKey = "your-api-key"
       static let TextToSpeechAPIKey = "your-api-key"
       static let SpeechToTextAPIKey = "your-api-key"
       static let CompareComplyV1APIKey = "your-api-key"
       // Add other credentials as needed
   }
   ```

## Usage

Here's a brief example of how to use the Natural Language Classifier:

### Example: Natural Language Classifier

```swift
import NaturalLanguageClassifierV1

let naturalLanguageClassifier = NaturalLanguageClassifier(apiKey: WatsonCredentials.NaturalLanguageClassifierAPIKey)

let trainingData = ... // Your training data
let metadata = ... // Your metadata

// Create a Classifier
naturalLanguageClassifier.createClassifier(metadata: metadata, trainingData: trainingData) { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        print("Classifier created with ID: \(response?.result?.classifierID ?? "")")
    }
}
```

### Example: Visual Recognition

```swift
import VisualRecognitionV3

let visualRecognition = VisualRecognition(apiKey: WatsonCredentials.VisualRecognitionAPIKey)

let imageURL = "https://example.com/image.jpg"

// Classify an Image
visualRecognition.classify(url: imageURL) { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        print("Classification results: \(response?.result ?? "")")
    }
}
```

### Example: Text to Speech

```swift
import TextToSpeechV1

let textToSpeech = TextToSpeech(apiKey: WatsonCredentials.TextToSpeechAPIKey)

let text = "Hello, world!"

// Synthesize Text to Audio
textToSpeech.synthesize(text: text, accept: "audio/wav") { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        // Handle the audio data
    }
}
```

## Conclusion

This repository provides a comprehensive set of tools for integrating IBM Watson services into Swift applications. For detailed usage of each service, refer to the official IBM Watson documentation.# README

## Overview

This repository contains a collection of unit tests and implementations for various IBM Watson services, including Assistant, Discovery, and Natural Language Understanding. The tests ensure that the functionalities of these services are working as expected.

### Major Parts of the Code

1. **Unit Tests**: The repository includes extensive unit tests for various Watson services. Each service has its own test class that contains multiple test functions to validate different functionalities. 
   - **AssistantTests**: Tests for IBM Watson Assistant, ensuring session creation, message handling, and context management.
   - **DiscoveryTests**: Tests for IBM Watson Discovery, validating environment, configuration, and document management.
   - **NaturalLanguageUnderstandingTests**: Tests for analyzing text, HTML, and URLs for various features like tone analysis, emotion detection, and entity recognition.

2. **Test Utilities**: The `TestUtilities.swift` file contains helper functions and mock data to facilitate testing across different modules.

3. **Watson Credentials**: The `WatsonCredentials.swift` file contains the necessary credentials to access IBM Watson services. This is important for authentication and should be handled securely.

## Installation

To set up the repository for testing, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/repo.git
   cd repo
   ```

2. **Install Dependencies**: Make sure you have [Xcode](https://developer.apple.com/xcode/) installed on your machine. Then, open the project in Xcode and let it resolve any dependencies.

3. **Set Up Watson Credentials**:
   - Create a file named `WatsonCredentials.swift` in the `SupportingFiles` directory.
   - Fill in your IBM Watson service credentials as follows:
     ```swift
     struct WatsonCredentials {
         static let AssistantAPIKey = "YOUR_ASSISTANT_API_KEY"
         static let DiscoveryAPIKey = "YOUR_DISCOVERY_API_KEY"
         static let ToneAnalyzerAPIKey = "YOUR_TONE_ANALYZER_API_KEY"
         static let NaturalLanguageUnderstandingAPIKey = "YOUR_NLU_API_KEY"
         static let AssistantV2ID = "YOUR_ASSISTANT_V2_ID"
         // Add other necessary credentials
     }
     ```

## Usage

To run the tests, open the project in Xcode and follow these steps:

1. **Select the Test Target**: 
   - In Xcode, select the test target you want to run from the scheme dropdown menu.

2. **Run Tests**: 
   - Use the shortcut `Cmd + U` or navigate to `Product > Test` to run all tests.
   - You can also run individual tests by using the test navigator (⌘ + 6) or by clicking the diamond icon next to each test function in the code.

3. **View Results**: 
   - After running the tests, check the console output or the test report panel in Xcode for results and any failures.

### Example Usage 

Here is a brief example of how to use the Assistant service to create a session and send a message. 

```swift
let assistant = Assistant(version: "2021-06-14", apiKey: "YOUR_API_KEY")
assistant.createSession(assistantId: "YOUR_ASSISTANT_ID") { (session, error) in
    guard let sessionID = session?.sessionID else {
        print("Error creating session: \(error?.localizedDescription ?? "Unknown error")")
        return
    }

    let messageInput = MessageInput(text: "Hello")
    assistant.message(assistantId: "YOUR_ASSISTANT_ID", sessionID: sessionID, input: messageInput) { (response, error) in
        if let output = response?.output {
            print("Assistant response: \(output.text.first ?? "")")
        }
    }
}
```

This example demonstrates how to create a session with the Assistant service and send a simple text message.

## Conclusion

This repository provides a solid foundation for testing various IBM Watson services, ensuring that the functionalities meet expected standards. By following the installation and usage instructions, you can easily set up the environment and run the tests to validate the implementations.# README.md

## Overview
This repository contains the source code and documentation for a Swift SDK that interacts with IBM Watson services. The SDK provides various functionalities such as natural language understanding, text-to-speech, and visual recognition.

## Major Parts of the Code

### 1. **SDK Structure**
The SDK is structured to support multiple Watson services, including:
- **Assistant**: For building conversational interfaces.
- **Natural Language Understanding**: For analyzing text and extracting insights.
- **Text to Speech**: For converting text to natural-sounding speech.
- **Visual Recognition**: For analyzing images and extracting information.

### 2. **AJAX and Event Handling**
The code includes AJAX functions for making network requests to the Watson services, handling responses, and managing events. This includes functions to handle JSONP requests and to manage the state of the application as it interacts with the APIs.

### 3. **Utilities**
There are utility functions to manipulate the DOM, manage CSS properties, and handle events. This includes functions for showing, hiding, and animating elements.

### 4. **Configuration and Setup**
The code includes configuration settings for AJAX requests, default values, and event handlers that are crucial for initializing the SDK and making it ready for use.

## Installation Instructions

To install the SDK, follow these steps:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/watson-developer-cloud/swift-sdk.git
   cd swift-sdk
   ```

2. **Install Dependencies**
   Make sure you have CocoaPods installed. If not, you can install it using:
   ```bash
   sudo gem install cocoapods
   ```

   Then, install the necessary dependencies:
   ```bash
   pod install
   ```

3. **Open the Project**
   Open the `.xcworkspace` file in Xcode:
   ```bash
   open WatsonDeveloperCloud.xcworkspace
   ```

## Usage Instructions

To use the SDK, you need to import the necessary modules into your Swift project:

```swift
import AssistantV1
import NaturalLanguageUnderstandingV1
import TextToSpeechV1
import VisualRecognitionV3
```

### Example Usage

Here is a brief example of how to use the Assistant service:

```swift
let assistant = AssistantV1(version: "2021-08-01")
assistant.setCredentials(apiKey: "YOUR_API_KEY")

let response = assistant.message(workspaceID: "YOUR_WORKSPACE_ID", input: ["text": "Hello"])
print(response.output.text)
```

### Notes
- Replace `YOUR_API_KEY` and `YOUR_WORKSPACE_ID` with your actual IBM Watson credentials.
- Make sure you handle errors and manage the responses as per your application's needs.

## Contributing
We welcome contributions! Please follow the standard fork-and-pull request process. Ensure that your code adheres to the existing coding style and includes appropriate tests.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact
For any inquiries or issues, please reach out to the maintainers of this repository.# Starscream WebSocket Library

Starscream is a powerful WebSocket client library written in Swift. It provides a simple API for connecting to WebSocket servers, sending and receiving messages, and handling connection events.

## Major Components

### 1. WebSocket Client
The `WebSocket` class is the main entry point for using the library. It manages the connection to the server and provides methods for sending and receiving messages.

### 2. Compression Support
Starscream implements compression extensions for WebSocket communication. The `Compressor` and `Decompressor` classes handle the compression and decompression of data according to RFC 7692.

### 3. SSL Security
The `SSLSecurity` class allows for SSL certificate validation and provides options for overriding hostnames and disabling certificate validation.

### 4. Stream Management
The `WSStream` protocol and its `FoundationStream` implementation manage the underlying input and output streams for WebSocket communication.

### 5. Delegate Pattern
Starscream uses a delegate pattern to notify when events occur, such as connection, disconnection, receiving messages, and data.

### 6. Error Handling
The `WSError` class encapsulates various error types that can occur during WebSocket communication.

## Installation

To install Starscream via CocoaPods, add the following line to your Podfile:

```ruby
pod 'Starscream', '~> 4.0'
```

Then run:

```bash
pod install
```

Alternatively, you can install Starscream using Swift Package Manager by adding the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.0")
]
```

## Usage

1. **Import the Library**

   To use Starscream in your project, import it at the top of your Swift file:

   ```swift
   import Starscream
   ```

2. **Create a WebSocket Instance**

   Create an instance of `WebSocket` by providing a URL:

   ```swift
   let socket = WebSocket(url: URL(string: "ws://example.com/socket")!)
   ```

3. **Set the Delegate**

   Assign a delegate to handle WebSocket events:

   ```swift
   socket.delegate = self
   ```

4. **Connect to the Server**

   Call the `connect` method to establish a connection:

   ```swift
   socket.connect()
   ```

5. **Sending Messages**

   Use the `write` method to send messages:

   ```swift
   socket.write(string: "Hello, WebSocket!")
   ```

6. **Handling Events**

   Implement the `WebSocketDelegate` protocol methods to handle connection and message events:

   ```swift
   func websocketDidConnect(socket: WebSocketClient) {
       print("Connected")
   }
   
   func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
       print("Disconnected")
   }
   
   func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
       print("Received text: \(text)")
   }
   
   func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
       print("Received data: \(data.count)")
   }
   ```

7. **Disconnecting**

   Call the `disconnect` method to close the connection:

   ```swift
   socket.disconnect()
   ```

## Conclusion

Starscream provides a straightforward way to work with WebSockets in Swift. With built-in support for compression and SSL security, it offers a robust solution for real-time communication in your applications. For more details, refer to the [official documentation](https://github.com/daltoniam/Starscream).# Starscream WebSocket Library

Starscream is a powerful WebSocket client library for Swift that provides an easy interface to interact with WebSocket servers. It is designed to be lightweight and efficient, making it suitable for real-time applications.

## Features

- **WebSocket Connection**: Establish a connection to a WebSocket server.
- **Message Handling**: Send and receive text and binary messages.
- **SSL Support**: Optionally support secure WebSocket connections (WSS).
- **Delegate Support**: Implement delegate methods for connection events, message handling, and error handling.
- **Compression**: Support for message compression.

## Installation

You can install Starscream via CocoaPods or Carthage.

### CocoaPods

Add the following line to your `Podfile`:

```ruby
pod 'Starscream', '~> 4.0'
```

Then run:

```bash
pod install
```

### Carthage

Add the following line to your `Cartfile`:

```
github "daltoniam/Starscream" ~> 4.0
```

Then run:

```bash
carthage update
```

## Usage

### Importing

To use Starscream in your project, import the library in your Swift files:

```swift
import Starscream
```

### Creating a WebSocket Client

You can create a WebSocket client by initializing a `WebSocket` instance with a URL.

```swift
let url = URL(string: "wss://example.com/socket")!
let socket = WebSocket(url: url)
```

### Connecting

To connect to the WebSocket server, use the `connect()` method.

```swift
socket.connect()
```

### Sending Messages

You can send both text and binary messages using the following methods:

```swift
// Sending text message
socket.write(string: "Hello, WebSocket!")

// Sending binary data
if let data = "Binary data".data(using: .utf8) {
    socket.write(data: data)
}
```

### Receiving Messages

To handle incoming messages, set the delegate and implement the appropriate delegate methods.

```swift
class MyWebSocketDelegate: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("Connected!")
    }

    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("Disconnected: \(error?.localizedDescription ?? "")")
    }

    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Received text: \(text)")
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data)")
    }
}

socket.delegate = MyWebSocketDelegate()
```

### Disconnecting

To disconnect from the WebSocket server, call the `disconnect()` method.

```swift
socket.disconnect()
```

## Delegate Methods

Starscream provides a set of delegate methods to handle various WebSocket events:

- `websocketDidConnect(socket:)`: Called when the WebSocket connects successfully.
- `websocketDidDisconnect(socket:error:)`: Called when the WebSocket disconnects.
- `websocketDidReceiveMessage(socket:text:)`: Called when a text message is received.
- `websocketDidReceiveData(socket:data:)`: Called when binary data is received.

## Conclusion

Starscream is an easy-to-use and efficient WebSocket library for Swift applications. With support for SSL, message compression, and a straightforward API, you can quickly integrate real-time WebSocket functionality into your projects.

For more detailed documentation, please refer to the [official GitHub repository](https://github.com/daltoniam/Starscream).# Natural Language Classifier SDK

The Natural Language Classifier SDK provides a Swift interface for integrating with IBM Watson's Natural Language Classifier service. This allows developers to classify text inputs into predefined categories with high accuracy.

## Contents

- **Models**: The SDK includes several model files that define structures for various types of data exchanged with the API:
  - `ClassifyCollectionInput`: Represents the input format for classifying a collection of texts.
  - `ClassificationCollection`: Represents the collection of classifications returned by the service.
  - `ClassifiedClass`: Represents a single classification result including confidence scores.
  - `Classification`: Represents a classification result with additional details.

- **Networking**: The SDK handles network requests to the Watson API, including methods for creating and managing classifiers, classifying text, and listing results.

## Installation

To install the Natural Language Classifier SDK, follow these steps:

1. **Carthage**: The SDK can be integrated using Carthage. Add the following line to your `Cartfile`:

    ```plaintext
    github "IBM/swift-sdk"
    ```

2. **Update Carthage**: Run the following command to fetch the repository and build the SDK:

    ```bash
    carthage update --platform iOS
    ```

3. **Add to Xcode**: After building, drag the built framework into your Xcode project.

4. **Link Frameworks**: Ensure that the framework is linked in your project settings.

## Usage

To use the SDK, follow these steps:

1. **Import SDK**: Import the necessary module in your Swift file:

    ```swift
    import NaturalLanguageClassifierV1
    ```

2. **Initialize the Classifier**: Create an instance of the classifier using your credentials:

    ```swift
    let classifier = NaturalLanguageClassifier(apiKey: "YOUR_API_KEY")
    ```

3. **Classify Text**: To classify a single text input, use the `classify` method:

    ```swift
    let text = "Your text here"
    classifier.classify(text: text) { response, error in
        if let error = error {
            print("Error classifying text: \(error)")
        } else {
            if let classification = response?.classification {
                print("Classification: \(classification)")
            }
        }
    }
    ```

4. **Classify a Collection**: To classify multiple texts at once, use the `classifyCollection` method:

    ```swift
    let texts = ["Text 1", "Text 2", "Text 3"]
    classifier.classifyCollection(classifyCollectionInput: ClassifyCollectionInput(texts: texts)) { response, error in
        if let error = error {
            print("Error classifying collection: \(error)")
        } else {
            if let classifications = response?.classifications {
                for classification in classifications {
                    print("Classification: \(classification)")
                }
            }
        }
    }
    ```

5. **Error Handling**: Make sure to handle errors appropriately, as shown in the examples above.

## Conclusion

The Natural Language Classifier SDK for Swift provides an easy-to-use interface for classifying text using IBM Watson's powerful machine learning capabilities. Follow the installation and usage instructions above to get started with integrating natural language classification into your iOS applications. 

For further details, refer to the official IBM Watson documentation or the source code within this repository.# Assistant Swift SDK

The Assistant Swift SDK provides a set of models and functionalities for interacting with the Watson Assistant service. This SDK allows developers to build conversational agents with ease by utilizing various classes that represent different components of the Assistant service.

## Major Components

### Models

1. **OutputData**: Represents the output returned by the Assistant service, including texts, suggested actions, and more.

2. **DialogNode**: Represents a node in the dialog flow, defining how the conversation should progress based on user input.

3. **MessageContextMetadata**: Contains metadata about the message context, such as deployment information and user ID.

4. **DialogNodeNextStep**: Represents the next steps in the dialog flow, including behaviors and selectors for branching conversations.

5. **RuntimeIntent**: Represents an identified intent in the user's input, including its confidence level and additional properties.

6. **EntityMentionCollection**: Manages collections of entity mentions in user input, allowing for better understanding of user intent.

7. **Update/Creation Models**: Models like `CreateValue`, `UpdateEntity`, and `UpdateCounterexample` provide functionalities to create and update various elements in the Assistant service.

### Utilities

- Various utility functions for encoding and decoding, making it easier to work with JSON representations of the models.
- Support for pagination in collections to handle large datasets effectively.

## Installation

To include the Assistant Swift SDK in your project, you can use CocoaPods or Swift Package Manager (SPM).

### Using CocoaPods

1. Add the following line to your `Podfile`:

   ```ruby
   pod 'AssistantSwiftSDK'
   ```

2. Run `pod install` to install the SDK.

### Using Swift Package Manager (SPM)

1. Add the following dependency in your `Package.swift`:

   ```swift
   .package(url: "https://github.com/your-repo/AssistantSwiftSDK.git", from: "1.0.0")
   ```

2. Add the package to your target dependencies.

## Usage Instructions

### Importing the SDK

In your Swift files, import the SDK:

```swift
import AssistantSwiftSDK
```

### Creating a Watson Assistant Instance

To create an instance of the Watson Assistant service, use the following code:

```swift
let assistant = Assistant(apiKey: "your_api_key", url: "your_service_url")
```

### Sending a Message

To send a message to the Assistant and receive a response, use the following method:

```swift
let input = MessageInput(text: "Hello, Assistant!")
assistant.sendMessage(input: input) { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let response = response {
        print("Response: \(response.output.text)")
    }
}
```

### Updating an Entity

To update an entity in the Assistant, you can use the following code:

```swift
let updatedEntity = UpdateEntity(entity: "entity_name", newValues: ["value1", "value2"])
assistant.updateEntity(updatedEntity) { success, error in
    if let error = error {
        print("Error updating entity: \(error.localizedDescription)")
    } else {
        print("Entity updated successfully!")
    }
}
```

## Conclusion

The Assistant Swift SDK provides a comprehensive set of tools for building and managing conversational agents using the Watson Assistant service. By following the installation and usage instructions, developers can easily integrate the SDK into their projects and create interactive applications.

For further documentation, examples, and contributions, please refer to the [GitHub repository](https://github.com/your-repo/AssistantSwiftSDK).# Assistant SDK for Swift

This repository contains the Swift SDK for the Assistant API. The code is structured to provide a comprehensive interface to interact with various components of the Assistant service, including models for dialog nodes, intents, examples, counterexamples, and more. Below is a summary of the major parts of the codebase along with installation and usage instructions.

## Major Components

1. **Models**: 
   - The SDK includes various model classes that represent different entities associated with the Assistant API. These include:
     - `DialogNode`
     - `Intent`
     - `Example`
     - `Counterexample`
     - `EntityMention`
     - `LogMessage`
     - `Pagination`
     - `WorkspaceSystemSettings`
     - `UpdateDialogNode`
     - `UpdateExample`
   - Each model class handles serialization and deserialization of data, ensuring smooth communication with the API.

2. **Networking**:
   - The SDK manages network requests and responses, allowing users to easily make API calls without dealing with the lower-level networking code.
   - Supports various HTTP methods and handles authentication.

3. **Error Handling**:
   - The SDK incorporates robust error handling mechanisms to manage API errors effectively.

4. **Custom String Convertible**: 
   - Many models conform to `CustomStringConvertible` and `CustomDebugStringConvertible` protocols for easy logging and debugging.

## Installation

To install the Assistant SDK for Swift, you can use [CocoaPods](https://cocoapods.org/) or [Carthage](https://github.com/Carthage/Carthage).

### Using CocoaPods

1. Add the following line to your Podfile:
   ```ruby
   pod 'AssistantSDK', '~> 1.0'
   ```
2. Run `pod install` to install the SDK.

### Using Carthage

1. Add the following line to your Cartfile:
   ```
   github "yourusername/AssistantSDK" ~> 1.0
   ```
2. Run `carthage update` to build the SDK.

## Usage

### Importing the SDK

Import the Assistant SDK into your project:
```swift
import AssistantSDK
```

### Creating an Instance

To create an instance of the Assistant API client:
```swift
let assistant = Assistant(version: "2023-10-01", apiKey: "YOUR_API_KEY")
```

### Making API Calls

Here’s an example of how to use the SDK to create a dialog node:

```swift
let dialogNode = DialogNode(
    title: "Sample Dialog Node",
    output: ["text": "Hello! How can I help you?"],
    conditions: "true"
)

assistant.createDialogNode(dialogNode) { (response, error) in
    if let error = error {
        print("Error creating dialog node: \(error)")
    } else {
        print("Dialog node created successfully: \(response)")
    }
}
```

### Updating a Dialog Node

To update an existing dialog node, you can call:

```swift
assistant.updateDialogNode(nodeId: "NODE_ID", update: dialogNode) { (response, error) in
    if let error = error {
        print("Error updating dialog node: \(error)")
    } else {
        print("Dialog node updated successfully: \(response)")
    }
}
```

### Additional Functionality

The SDK also provides functionality for managing intents, examples, counterexamples, and more. Each model has specific methods for creating, updating, and retrieving data from the Assistant API.

## Conclusion

The Assistant SDK for Swift simplifies integrating the Assistant API into your applications by providing an easy-to-use interface and handling the complexities of networking and data management. For more advanced usage and additional features, please refer to the official documentation or the code comments within the SDK.# Watson Assistant Swift SDK

This Swift SDK provides a simple interface for interacting with the IBM Watson Assistant API. It allows developers to easily create and manage assistant configurations, including entities, intents, and dialog nodes.

## Major Components

1. **AssistantV1**: This is the main class that interfaces with the Watson Assistant API. It includes methods for creating, updating, and deleting assistants, as well as managing intents, entities, and dialog nodes.

2. **Models**: The SDK includes various model classes that represent the core components of the Watson Assistant. These include:
   - **Intent**: Represents an intent that the assistant can recognize.
   - **Entity**: Represents an entity that the assistant can extract from user input.
   - **DialogNode**: Represents a node in the dialog tree of the assistant.
   - **MessageResponse**: Represents the response returned by the assistant after processing a user message.

3. **Error Handling**: The SDK provides error handling mechanisms to manage API call failures and other unexpected behaviors.

4. **Insecure Connection Handling**: There are options to allow insecure connections for testing purposes.

## Installation

To install this SDK, you can use CocoaPods or Carthage.

### CocoaPods

1. Add the following line to your Podfile:

   ```ruby
   pod 'WatsonAssistant', '~> 1.0'
   ```

2. Run `pod install` to install the SDK.

### Carthage

1. Add the following line to your Cartfile:

   ```ogdl
   github "IBM/Swift-SDK" ~> 2.3.0
   ```

2. Run `carthage update` to install the SDK.

### Swift Package Manager

1. Add the following line to your `Package.swift` dependencies:

   ```swift
   .package(url: "https://github.com/IBM/Swift-SDK.git", from: "2.3.0"),
   ```

## Usage Instructions

Here's a quick guide to using the Watson Assistant SDK in your Swift project:

1. **Import the SDK** at the top of your Swift file:

   ```swift
   import WatsonAssistant
   ```

2. **Initialize the Assistant**:

   ```swift
   let assistant = AssistantV1(apiKey: "YOUR_API_KEY", version: "2021-04-01")
   ```

3. **Create an Assistant**:

   ```swift
   assistant.createAssistant(name: "My Assistant", description: "This is my Watson Assistant.")
   ```

4. **Add Intents**:

   ```swift
   let intent = Intent(name: "greeting", description: "Greeting Intent")
   assistant.createIntent(intent: intent)
   ```

5. **Handle Responses**:

   When you send a message to your assistant, you'll receive a response that you can process:

   ```swift
   assistant.message(assistantId: "YOUR_ASSISTANT_ID", input: "Hello") { response, error in
       if let error = error {
           print("Error: \(error.localizedDescription)")
           return
       }
       print("Response: \(response?.output?.generic ?? [])")
   }
   ```

6. **Error Handling**:

   Ensure to implement error handling to manage any issues that arise during API calls.

## Contribution

Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.

## License

This SDK is released under the MIT License. See `LICENSE` for more details. 

---

This README provides a high-level overview of the Watson Assistant Swift SDK and instructions for installation and usage. For more detailed information, please refer to the official [Watson Assistant documentation](https://cloud.ibm.com/apidocs/assistant).# Tone Analyzer SDK for Swift

This repository contains a Swift SDK for the IBM Watson Tone Analyzer service, which analyzes the tone of written text. The SDK provides a set of models and methods to interact with the Tone Analyzer API.

## Major Components

1. **Models**: The SDK includes several models that represent the various data structures used by the Tone Analyzer API:
   - **ToneChatInput**: Represents the input for the chat tone analysis.
   - **ToneInput**: Represents the input for general tone analysis.
   - **ToneAnalysis**: Represents the results of the tone analysis.
   - **Utterance**: Represents a spoken utterance to be analyzed.
   - **SentenceAnalysis**: Represents the analysis of individual sentences.
   - **Category**: Represents different tone categories and their associated scores.

2. **Networking**: The SDK handles HTTP requests to the Tone Analyzer service and processes the responses. It includes methods for authentication and error handling.

3. **Utilities**: Helper functions and extensions are provided to simplify tasks such as encoding and decoding data.

## Installation

To install the Tone Analyzer SDK, you can use Carthage or CocoaPods. Here is how to do it with both:

### Using Carthage

1. Add the following line to your `Cartfile`:
   ```
   github "your-github-username/ToneAnalyzerSDK"
   ```

2. Run the following command to build the framework:
   ```
   carthage update --platform iOS
   ```

3. Link the built framework to your Xcode project.

### Using CocoaPods

1. Add the following line to your `Podfile`:
   ```ruby
   pod 'ToneAnalyzerSDK', :git => 'https://github.com/your-github-username/ToneAnalyzerSDK.git'
   ```

2. Run the following command to install the pod:
   ```
   pod install
   ```

## Usage

To use the SDK, follow these steps:

1. **Import the SDK**:
   ```swift
   import ToneAnalyzerSDK
   ```

2. **Initialize the Tone Analyzer**:
   ```swift
   let toneAnalyzer = ToneAnalyzer(apiKey: "YOUR_API_KEY")
   ```

3. **Analyze a Text**:
   ```swift
   let textToAnalyze = "I am feeling great today!"
   toneAnalyzer.analyzeTone(text: textToAnalyze) { analysis, error in
       if let analysis = analysis {
           print("Tone analysis results: \(analysis)")
       } else if let error = error {
           print("Error: \(error.localizedDescription)")
       }
   }
   ```

4. **Handle the Response**: The response will contain the tone analysis results, which you can process as needed.

## Conclusion

The Tone Analyzer SDK for Swift provides an easy way to integrate IBM Watson's Tone Analyzer service into your Swift applications. By following the installation and usage instructions, you can quickly get started with analyzing the tone of written text.

For more information on the API and its capabilities, refer to the [IBM Watson Tone Analyzer documentation](https://cloud.ibm.com/apidocs/tone-analyzer).# Visual Recognition Swift SDK

This repository contains the Swift SDK for IBM Watson's Visual Recognition service. It allows developers to integrate image recognition capabilities into their applications, enabling features such as classification, face detection, and more.

## Major Components

### Models
The SDK includes several model classes that represent the various entities involved in image processing, such as:
- **ClassifierResult**: Represents the result of a classification task, including the classifier ID, name, and classification scores.
- **ClassifiedImage**: Represents an image that has been classified, including its source URL, resolved URL, and associated classifiers.
- **FaceAge**: Represents the estimated age of detected faces within images.
- **WarningInfo**: Represents warnings returned from the Visual Recognition service.
- **ClassifiedImages**: Represents a collection of classified images, including potential warnings and custom classes.

### Key Features
- **Classification**: Classify images using pre-trained models and custom classifiers.
- **Face Detection**: Detect faces in images and analyze their attributes.
- **Customization**: Create and manage custom classifiers tailored to specific needs.
- **Error Handling**: Robust error handling to manage issues from the Visual Recognition API.

## Installation

To install the Visual Recognition Swift SDK, follow these steps:

1. **CocoaPods Installation**: 
   Add the following line to your `Podfile`:
   ```ruby
   pod 'VisualRecognition'
   ```
   Then run:
   ```bash
   pod install
   ```

2. **Carthage Installation**:
   Add the following line to your `Cartfile`:
   ```
   github "IBM/visual-recognition-swift-sdk"
   ```
   Then run:
   ```bash
   carthage update --platform iOS
   ```

3. **Manual Installation**: 
   Clone the repository and include the source files in your Xcode project.

## Usage

To use the Visual Recognition SDK, follow these instructions:

1. **Import the SDK**:
   ```swift
   import VisualRecognition
   ```

2. **Initialize the Service**:
   Create an instance of the Visual Recognition service using your API key:
   ```swift
   let visualRecognition = VisualRecognition(apiKey: "YOUR_API_KEY")
   ```

3. **Classify an Image**:
   Use the `classify` method to classify an image:
   ```swift
   visualRecognition.classify(image: imageData, classifiers: ["default"], failure: { error in
       print("Error: \(error.localizedDescription)")
   }, success: { classifiedImages in
       print("Classified Images: \(classifiedImages)")
   })
   ```

4. **Detect Faces**:
   To detect faces in an image, use the `detectFaces` method:
   ```swift
   visualRecognition.detectFaces(image: imageData, failure: { error in
       print("Error: \(error.localizedDescription)")
   }, success: { detectedFaces in
       print("Detected Faces: \(detectedFaces)")
   })
   ```

5. **Handle Errors**:
   Ensure to handle any potential errors from the API calls to manage different scenarios effectively.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

For more information on the Visual Recognition service, refer to the [IBM Watson Visual Recognition Documentation](https://cloud.ibm.com/apidocs/visual-recognition).# Text to Speech SDK

This repository contains the Swift SDK for interacting with the Text to Speech service. It provides functionalities to convert text into natural-sounding speech with various customization options.

## Major Components

1. **Models**: 
   - **Pronunciation**: Represents the pronunciation of words, including customization options.
   - **Word**: Represents individual words, their translations, and associated metadata.
   - **Voice**: Contains details about different voices available for speech synthesis, including language, gender, and customization options.
   - **Translation**: Represents translations of words or phrases along with their part of speech.
   - **Supported Features**: Lists the features supported by the service, such as custom pronunciations and voice transformations.

2. **Core Functionality**:
   - **TextToSpeech**: Main class for interacting with the Text to Speech service. It provides methods for synthesizing speech, managing voice models, and handling customizations.
   - **Decoder**: Handles the decoding of audio streams and manages audio data for playback. It includes methods for managing the internal state and processing audio data.

3. **Networking**:
   - The SDK utilizes RESTful API calls to communicate with the Text to Speech service, handling authentication, request formation, and response parsing.

4. **Utilities**:
   - Includes various helper functions and classes for data manipulation, error handling, and other auxiliary operations.

## Installation

To install the Text to Speech SDK, follow these steps:

1. **CocoaPods**:
   Add the following line to your Podfile:
   ```ruby
   pod 'TextToSpeech'
   ```

2. **Carthage**:
   Add the following line to your Cartfile:
   ```ruby
   github "YourOrg/TextToSpeech"
   ```

3. **Swift Package Manager**:
   Add the following dependency to your `Package.swift`:
   ```swift
   .package(url: "https://github.com/YourOrg/TextToSpeech.git", from: "1.0.0")
   ```

4. **Manual Installation**:
   Clone the repository and include the necessary files in your project.

## Usage

### Basic Usage Example

Here’s a simple example of how to use the SDK to synthesize speech from text:

```swift
import TextToSpeech

let textToSpeech = TextToSpeech(apiKey: "YOUR_API_KEY")

textToSpeech.synthesize(text: "Hello, world!", voice: "en-US_AllisonV3Voice") { result in
    switch result {
    case .success(let audioData):
        // Handle audio data (e.g., play it)
    case .failure(let error):
        print("Error synthesizing speech: \(error)")
    }
}
```

### Customization Options

You can customize various parameters such as voice, language, and pronunciation. Refer to the models provided in the SDK for more details on available options.

### Error Handling

The SDK provides error handling through the completion handlers, allowing you to handle different scenarios (e.g., network issues, invalid API keys) gracefully.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This SDK is licensed under the MIT License. See the LICENSE file for details.

---

This README provides an overview of the SDK's components, installation instructions, and basic usage examples to help developers get started quickly.# Natural Language Understanding SDK

This repository contains a Swift SDK for IBM's Natural Language Understanding service. The SDK provides an interface for analyzing text data, extracting insights such as sentiment, emotion, keywords, entities, and more.

## Major Components of the Code

### 1. **Models**
   - **AnalysisResults**: Represents the results of an analysis request, including various insights extracted from the text.
   - **EntitiesResult**: Contains information about entities found in the text, including their type, relevance, and associated metadata.
   - **EmotionScores**: Provides the emotional analysis of the text, detailing various emotions such as joy, sadness, fear, etc.
   - **SentimentResult**: Indicates the overall sentiment of the analyzed text, either positive, negative, or neutral.
   - **RelationEntity**: Represents relationships between entities detected in the text, detailing the type and specific entities involved.

### 2. **Parameters**
   - **Parameters**: Contains configuration options for analysis requests, specifying which features to include in the analysis (e.g., sentiment, emotion, entities).
   - **Features**: A structure that defines which analysis features to enable when making a request.

### 3. **Networking**
   - **RestKit**: Responsible for handling network requests and responses. It manages authentication, session handling, and error responses when interacting with the Natural Language Understanding API.

### 4. **Utilities**
   - **String Interpolation**: Custom string interpolation methods for creating URLs and managing request parameters.
   - **Error Handling**: Comprehensive error handling to manage failures in network requests or analysis processing.

## Installation

To install the Natural Language Understanding SDK, follow these steps:

### Prerequisites

- Xcode 10.0 or later
- Swift 5.0 or later
- CocoaPods or Carthage for dependency management

### Using CocoaPods

1. Add the following line to your `Podfile`:

   ```ruby
   pod 'NaturalLanguageUnderstanding', :git => 'https://github.com/your/repo.git'
   ```

2. Run `pod install` in your terminal.

### Using Carthage

1. Add the following line to your `Cartfile`:

   ```
   github "your/repo.git" ~> 1.0
   ```

2. Run `carthage update` in your terminal.

## Usage

To use the SDK, import the module in your Swift file:

```swift
import NaturalLanguageUnderstanding
```

### Example: Analyzing Text

Here’s a basic example of how to use the SDK to analyze a piece of text:

```swift
let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(apiKey: "YOUR_API_KEY")

let features = Features(sentiment: true, emotion: true, entities: true)

naturalLanguageUnderstanding.analyze(text: "Your text goes here", features: features) { result, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let result = result {
        print("Analysis Results: \(result)")
    }
}
```

### Supported Features

- **Sentiment Analysis**: Determine the overall sentiment of the text.
- **Emotion Analysis**: Analyze emotions such as joy, sadness, anger, etc.
- **Entity Recognition**: Identify entities within the text and provide relevant details.
- **Keyword Extraction**: Extract significant keywords from the text.

## Contributing

Contributions are welcome! If you have suggestions for improvements or find bugs, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

For more detailed documentation, please refer to the official IBM Natural Language Understanding API documentation.# Natural Language Understanding SDK for Swift

This repository contains a Swift SDK for integrating IBM's Natural Language Understanding (NLU) service. The SDK provides a set of models and options for analyzing text and extracting insights such as emotions, sentiments, keywords, and entities.

## Major Components

1. **Models**:
   - **EntityMention**: Represents mentions of entities in the text.
   - **KeywordsOptions**: Configuration options for keyword extraction.
   - **CategoriesRelevantText**: Represents relevant text associated with categories.
   - **AnalysisResultsEmotion**: Contains the results related to emotions detected in the text.
   - **TargetedEmotionResults**: Represents targeted emotions for specific entities.
   - **SemanticRoles**: Provides information about the roles of words in sentences.

2. **Options**:
   - **SentimentOptions**: Options for analyzing sentiment in the text.
   - **EntitiesOptions**: Configurations for entity extraction and analysis.
   - **RelationsOptions**: Options for identifying relationships within the text.
   - **SyntaxOptions**: Options for syntactic analysis of text.

3. **Utility Functions**:
   - Functions for encoding and decoding the models for data persistence and transmission.

## Installation

To install the SDK, you need to include it in your Swift project. You can use [CocoaPods](https://cocoapods.org/) or [Carthage](https://github.com/Carthage/Carthage).

### Using CocoaPods

1. Add the following line to your `Podfile`:

    ```ruby
    pod 'NaturalLanguageUnderstanding'
    ```

2. Run `pod install`.

### Using Carthage

1. Add the following line to your `Cartfile`:

    ```
    github "IBM/swift-sdk"
    ```

2. Run `carthage update`.

## Usage

After installing the SDK, you can use it to analyze text and extract insights. Here is a simple example:

```swift
import NaturalLanguageUnderstanding

// Create an instance of the Natural Language Understanding service
let nlu = NaturalLanguageUnderstanding(apiKey: "YOUR_API_KEY")

// Analyze text for sentiment
let textToAnalyze = "IBM is a great company!"
nlu.analyze(text: textToAnalyze, features: [.sentiment]) { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let response = response {
        print("Sentiment: \(response.sentiment)")
    }
}
```

### Available Features
The SDK supports various features for text analysis, including:
- Sentiment Analysis
- Emotion Detection
- Entity Recognition
- Keywords Extraction
- Syntactic Analysis
- Relationship Extraction

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss improvements and features.

## License
This SDK is licensed under the MIT License. See the LICENSE file for more information.

## Contact
For more information or support, please contact [support@ibm.com](mailto:support@ibm.com).# Natural Language Understanding SDK

This repository contains a Swift SDK for IBM's Natural Language Understanding (NLU) service, which provides various functionalities for analyzing and understanding text. The code is structured around different models and functionalities that the NLU service offers.

## Major Components

1. **Models**:
   - **KeywordsResultSentiment**: Represents the sentiment analysis results for keywords.
   - **SemanticRolesObject**: Represents the semantic roles extracted from text, including entities and their relationships.
   - **KeywordsResultEmotion**: Represents emotion analysis results for keywords.
   - **DocumentSentimentResults**: Represents the sentiment analysis results for entire documents.
   - **DocumentEmotionResults**: Represents emotion analysis results for entire documents.
   - **EntitiesResultSentiment**: Represents sentiment analysis results for detected entities in the text.
   - **ConceptsResult**: Represents concepts extracted from the text along with their relevance and attributes.
   - **RelationArgument**: Represents arguments in a relation extracted from the text.
   - **Feedback Data Structures**: Classes for handling feedback related to the NLU service.

2. **Options**:
   - The SDK includes various options for configuring requests to the NLU service, allowing users to specify parameters for text analysis, such as sentiment and emotion analysis, keywords extraction, and more.

3. **Utilities**:
   - The SDK provides utility functions for encoding and decoding data structures when communicating with the NLU service, ensuring that data formats align with the service's requirements.

## Installation

To install the Natural Language Understanding SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/natural-language-understanding-sdk.git
   ```

2. **Install Dependencies**:
   This SDK uses [Carthage](https://github.com/Carthage/Carthage). Make sure you have Carthage installed, then run:
   ```bash
   carthage update --platform iOS
   ```

3. **Integrate the SDK**:
   - Add the built frameworks from the `Carthage/Build/iOS/` directory to your Xcode project.

4. **Import the SDK**:
   In your Swift files, import the SDK:
   ```swift
   import NaturalLanguageUnderstandingV1
   ```

## Usage

Here’s a simple example of how to use the SDK to analyze text:

```swift
import NaturalLanguageUnderstandingV1

let nlu = NaturalLanguageUnderstandingV1(apiKey: "YOUR_API_KEY", version: "2021-08-01")

let textToAnalyze = "IBM is an American multinational technology company."

let options = AnalyzeOptions(
    text: textToAnalyze,
    features: Features(sentiment: SentimentOptions(), emotion: EmotionOptions())
)

nlu.analyze(options: options) { response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let response = response {
        print("Sentiment: \(response.sentiment)")
        print("Emotion: \(response.emotion)")
    }
}
```

### Available Features

The SDK supports various features that can be enabled during the analysis, including:

- **Sentiment Analysis**: Determine the sentiment (positive, negative, neutral) of the text.
- **Emotion Analysis**: Identify emotions such as joy, anger, sadness, disgust, and fear in the text.
- **Keywords Extraction**: Extract keywords from the text and analyze their sentiments and emotions.
- **Semantic Roles**: Understand the roles that words play in the context of the text.

## Contributing

Contributions are welcome! Please submit pull requests or open issues for any enhancements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 

---

This README provides a comprehensive overview of the Natural Language Understanding SDK, its installation, and basic usage. Feel free to customize the text and examples according to your specific requirements.# CompareComply Swift SDK

The CompareComply Swift SDK provides a set of models and functionalities for interacting with the IBM Compare and Comply service, which helps users extract and analyze information from documents.

## Major Components

1. **Models**: The SDK includes various models representing different aspects of the Compare and Comply service, such as:
   - `Element`: Represents individual elements within the document.
   - `Category`: Represents categories of elements.
   - `Attribute`: Represents attributes associated with elements.
   - `TypeLabel`: Represents labels for different types of elements.
   - `FeedbackDataInput` and `FeedbackDataOutput`: Models for handling feedback data as input and output.
   - `BatchStatus`: Represents the status of batch processing.
   - `ContractTypes`, `ContractAmts`, `UpdatedLabelsIn`, and `OriginalLabelsIn`: Models for specific contract-related data.
   - `Contexts`: Represents contextual information related to the data being processed.

2. **Coding Keys**: Each model has associated coding keys that help map JSON keys to Swift properties, ensuring correct serialization and deserialization.

3. **Keyed Containers**: The SDK provides `KeyedEncodingContainer` and `KeyedDecodingContainer` implementations for handling encoding and decoding of the models.

## Installation

To install the CompareComply SDK, follow these steps:

1. Make sure you have [CocoaPods](https://cocoapods.org/) or [Carthage](https://github.com/Carthage/Carthage) installed.
2. Add the following to your `Podfile` or `Cartfile`:

   **CocoaPods**
   ```ruby
   pod 'CompareComply'
   ```

   **Carthage**
   ```ogdl
   github "IBM/compare-comply-swift-sdk"
   ```

3. Run `pod install` or `carthage update` to install the SDK.

## Usage

To use the CompareComply SDK, follow these steps:

1. Import the SDK in your Swift file:
   ```swift
   import CompareComply
   ```

2. Create instances of the models to interact with the service. For example, to create a new `FeedbackDataInput`:
   ```swift
   let feedbackInput = FeedbackDataInput(feedbackType: "example", document: yourDocument)
   ```

3. Utilize the models to send requests to the Compare and Comply service, and handle responses as needed. For example:
   ```swift
   let classifyReturn = ClassifyReturn(elements: [yourElement], effectiveDates: [yourEffectiveDate])
   ```

4. Check the status of batch operations using the `BatchStatus` model:
   ```swift
   let batchStatus = BatchStatus(batchID: "yourBatchID")
   ```

5. Implement error handling and feedback mechanisms to ensure robust interactions with the service.

## Contributing

Contributions to the CompareComply SDK are welcome. Please submit pull requests or raise issues for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

This README provides a comprehensive overview of the CompareComply Swift SDK, its components, installation instructions, and usage examples to help you get started quickly.# Compare Comply Swift SDK

## Overview

The Compare Comply Swift SDK is designed to facilitate the integration of IBM's Compare and Comply API into Swift applications. This SDK allows developers to easily access and utilize the various features of the Compare and Comply service, which includes document comparison and compliance checking.

## Major Components

### Models
The SDK includes various models that represent the data structures used by the Compare and Comply API. These models include:

- **Document**: Represents a document being analyzed.
- **RowHeaderIDs**: Contains identification for row headers in a document.
- **ColumnHeaderTexts**: Represents text for column headers.
- **BodyCells**: Represents individual cells within the body of a table in a document.
- **EffectiveDates**: Represents effective dates associated with compliance checks.
- **FeedbackReturn**: Represents the feedback returned from the service after a call.
- **HTMLReturn**: Represents the HTML output of the processed documents.
- **TerminationDates**: Contains information about termination dates related to contracts.

### Key Features
- **Document Analysis**: Analyze documents for compliance and comparison.
- **Feedback Handling**: Manage feedback from document processing.
- **Customizable Output**: Customize the output format of analyzed documents.

## Installation

To install the Compare Comply Swift SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/compare-comply-swift-sdk.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd compare-comply-swift-sdk
   ```

3. **Install Dependencies**:
   Ensure you have [Carthage](https://github.com/Carthage/Carthage) installed, then run:
   ```bash
   carthage update --platform iOS
   ```

4. **Add to Your Xcode Project**:
   Drag the built `.framework` files from the Carthage/Build/iOS folder to your Xcode project.

## Usage

Here's a basic example of how to use the Compare Comply Swift SDK:

### Import the SDK
```swift
import CompareComply
```

### Initialize the Service
```swift
let service = CompareComply(apiKey: "YOUR_API_KEY")
```

### Analyze a Document
```swift
let document = Document(title: "Sample Document", html: "<html><body>Your HTML content here</body></html>")

service.analyze(document: document) { result in
    switch result {
    case .success(let response):
        print("Analysis successful: \(response)")
    case .failure(let error):
        print("Error analyzing document: \(error)")
    }
}
```

### Access Feedback
```swift
service.getFeedback(id: "feedback_id") { result in
    switch result {
    case .success(let feedback):
        print("Feedback received: \(feedback)")
    case .failure(let error):
        print("Error retrieving feedback: \(error)")
    }
}
```

## Contributing
If you would like to contribute to the project, please fork the repository and submit a pull request. For any issues or feature requests, please open an issue on the GitHub repository.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.# Compare Comply Swift SDK

The Compare Comply Swift SDK provides a set of functionalities to interact with IBM's Compare and Comply service. It allows users to extract tables, compare documents, manage feedback, and more.

## Major Components

1. **Models**:
   - **Feedback**: Handles operations related to feedback submissions and retrieval.
   - **Document List**: Manages a collection of documents submitted to the service for processing.
   - **Translation Models**: Represents models used for translating content.

2. **Functions**:
   - **Document Management**:
     - `listDocuments`: Retrieves a list of documents.
     - `getDocumentStatus`: Checks the status of a document.
     - `translateDocument`: Translates a document using specified models.
   - **Feedback Management**:
     - `addFeedback`: Allows users to submit feedback.
     - `getFeedback`: Retrieves feedback by ID.
     - `deleteFeedback`: Deletes feedback based on its ID.
   - **Table Extraction**:
     - `extractTables`: Extracts tabular data from documents.
   - **Comparison**:
     - `compareDocuments`: Compares two documents to identify differences.

3. **Utilities**:
   - **Error Handling**: Integrates error handling mechanisms to manage exceptions and errors gracefully.
   - **Authentication**: Methods for managing authentication and session management.

## Installation

To install the Compare Comply SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/compare-comply-swift-sdk.git
   ```

2. **Install Dependencies**:
   Use Carthage to manage dependencies. Ensure you have Carthage installed, then run:
   ```bash
   carthage update --platform iOS
   ```

3. **Add the Framework**:
   After building the project, link the `CompareComply.framework` located in the Carthage build folder to your Xcode project.

## Usage Instructions

To use the Compare Comply SDK in your project, follow these steps:

1. **Import the Framework**:
   ```swift
   import CompareComply
   ```

2. **Initialize the API Client**:
   Set up your API client with authentication details:
   ```swift
   let apiClient = CompareComply(apiKey: "YOUR_API_KEY")
   ```

3. **Perform Operations**:
   - **List Documents**:
     ```swift
     apiClient.listDocuments { (documents, error) in
         if let error = error {
             print("Error fetching documents: \(error)")
         } else {
             print("Fetched documents: \(documents)")
         }
     }
     ```

   - **Translate a Document**:
     ```swift
     apiClient.translateDocument(file: documentFile, modelID: "YOUR_MODEL_ID") { (translationResult, error) in
         if let error = error {
             print("Error translating document: \(error)")
         } else {
             print("Translation result: \(translationResult)")
         }
     }
     ```

4. **Handle Feedback**:
   - **Add Feedback**:
     ```swift
     apiClient.addFeedback(feedbackData: feedbackData) { (response, error) in
         if let error = error {
             print("Error adding feedback: \(error)")
         } else {
             print("Feedback added successfully: \(response)")
         }
     }
     ```

5. **Error Handling**:
   Ensure to handle errors appropriately in all API calls.

## Conclusion

The Compare Comply Swift SDK provides a comprehensive interface for interacting with the IBM Compare and Comply service. By following the installation and usage instructions, you can easily integrate document comparison and analysis capabilities into your Swift applications. For more details, refer to the official documentation.# Language Translator SDK

This SDK provides a Swift interface for interacting with the Language Translator service, allowing for seamless translation of text across multiple languages. It supports various features including document translation, language identification, and more.

## Features

- **Translation Request**: Send text for translation from one language to another.
- **Translation Result**: Access detailed results of translations including character count and word count.
- **Document Status**: Track the status of document translations including completion time and input/output details.
- **Insecure Connection Support**: Handle insecure connection scenarios.

## Installation

To install the Language Translator SDK, you can use [Carthage](https://github.com/Carthage/Carthage). Follow the steps below:

1. Add the following line to your Cartfile:
   ```
   github "IBM/Swift-SDK"
   ```

2. Run the following command to fetch the SDK:
   ```
   carthage update --platform iOS
   ```

3. Link the framework in your Xcode project.

## Usage

### Importing the SDK

To use the SDK in your project, import it as follows:

```swift
import LanguageTranslatorV3
```

### Making a Translation Request

Here’s a basic example of how to initiate a translation request:

```swift
let translator = LanguageTranslator(apiKey: "YOUR_API_KEY")

let translateRequest = TranslateRequest(text: ["Hello, world!"], source: "en", target: "es")

translator.translate(request: translateRequest) { result in
    switch result {
    case .success(let translationResult):
        print("Translated Text: \(translationResult.translations.first?.translation ?? "")")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
```

### Handling Document Translations

For document translations, you can use the DocumentStatus and DocumentTranslation classes to monitor the translation status:

```swift
let documentStatus = DocumentStatus(documentID: "DOCUMENT_ID")

translator.getDocumentStatus(documentStatus) { result in
    switch result {
    case .success(let status):
        print("Document Status: \(status.status)")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
```

### Insecure Connection Handling

If you need to handle insecure connections, implement the `AllowInsecureConnectionDelegate` as follows:

```swift
class InsecureConnectionDelegate: AllowInsecureConnectionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // Handle insecure connection challenges here
    }
}
```

## Conclusion

The Language Translator SDK provides a user-friendly interface to interact with the Language Translator service. With features such as text and document translation, it enables developers to integrate powerful translation capabilities into their applications easily. For more detailed instructions and advanced usage, please refer to the official documentation.# Compare Comply SDK

The Compare Comply SDK provides a comprehensive suite of tools for analyzing and comparing contract documents. This SDK is designed to facilitate the extraction of meaningful data from contracts, making it easier for users to navigate and comprehend their content.

## Major Components

The SDK includes several key components, each focusing on different aspects of contract processing:

1. **Models**: 
   - **FeedbackDataInput**: Represents input data for feedback, including fields like `document`, `modelID`, `location`, `text`, `originalLabels`, and `updatedLabels`.
   - **ShortDoc**: Represents a summarized version of the document with details like `title`, `hash`, and location.
   - **FeedbackInput**: Represents user feedback for contract analysis, including fields for model ID and text input.
   - **Element**: Represents elements extracted from the contract, including text and types.
   - **Category**: Represents categorized information about contracts, allowing users to classify various document parts.
   - **Contexts**: Represents contextual information relevant to the document, such as locations and previous references.
   - **DocCounts**: Provides counts for documents analyzed, including totals for success, pending, and failed analyses.

2. **Coding Keys**: Each model defines coding keys that facilitate the encoding and decoding of data, ensuring compatibility with JSON formats.

3. **Decoding and Encoding**: The SDK supports serialization of data to and from JSON using the `Encoder` and `Decoder` protocols, allowing easy integration with RESTful services.

4. **Feedback Handling**: The SDK provides mechanisms for sending and receiving feedback on the analysis results, enhancing user interaction and system learning.

## Installation

To install the Compare Comply SDK, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/compare-comply-sdk.git
   cd compare-comply-sdk
   ```

2. **Install dependencies**: The SDK uses Carthage for dependency management. Ensure you have Carthage installed and run the following command:
   ```bash
   carthage update --platform iOS
   ```

3. **Integrate the SDK into your project**:
   - Drag the built framework from `Carthage/Build/iOS` into your Xcode project.

4. **Import the SDK** in your Swift files:
   ```swift
   import CompareComply
   ```

## Usage

Here’s a simple example of how to use the Compare Comply SDK for document analysis:

1. **Creating FeedbackDataInput**:
   ```swift
   let feedbackInput = FeedbackDataInput(
       document: ShortDoc(title: "Contract Title", hash: "contract_hash"),
       modelID: "model_123",
       location: Location(),
       text: "Contract text here",
       originalLabels: OriginalLabelsIn(),
       updatedLabels: UpdatedLabelsIn()
   )
   ```

2. **Sending Feedback**:
   ```swift
   FeedbackInput.sendFeedback(data: feedbackInput) { result in
       switch result {
       case .success(let response):
           print("Feedback sent successfully: \(response)")
       case .failure(let error):
           print("Error sending feedback: \(error.localizedDescription)")
       }
   }
   ```

3. **Retrieving Document Counts**:
   ```swift
   let docCounts = DocCounts(total: 100, successful: 80, failed: 20, pending: 0)
   print("Total documents analyzed: \(docCounts.total)")
   ```

4. **Analyzing Sections**:
   ```swift
   let sectionTitles = SectionTitles(sectionTitle: "Section 1", elementLocations: [])
   print("Section Title: \(sectionTitles.sectionTitle)")
   ```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue to discuss potential changes.

## License

This project is licensed under the MIT License. See the LICENSE file for details. 

---

This README.md provides a high-level overview of the Compare Comply SDK, its major components, installation instructions, and usage examples to help users get started quickly.# Compare Comply SDK

## Overview

The Compare Comply SDK is a Swift library designed to facilitate the integration of IBM's Compare and Comply services into applications. This SDK allows developers to easily utilize document comparison and compliance checking functionalities provided by the IBM Watson service.

## Major Components

The SDK includes several key classes and structures that represent various aspects of the Compare and Comply service:

1. **Models**:
   - **RowHeaderIDs**: Represents the IDs associated with rows in a comparison.
   - **GetFeedback**: Represents feedback responses returned from the service.
   - **EffectiveDates**: Contains information about important dates relevant to compliance.
   - **ContractType**: Represents the type of contract being analyzed.
   - **Document**: Represents the documents being processed.
   - **TableReturn**: Represents the results of a table comparison.
   - **Batches**: Contains batch processing information for multiple documents.

2. **Keyed Containers**:
   - Each model includes associated `KeyedDecodingContainer` and `KeyedEncodingContainer` implementations for JSON serialization and deserialization.

3. **Utility Functions**:
   - Functions for handling feedback, document processing, and batch operations.

## Installation

To install the Compare Comply SDK, follow these steps:

1. **CocoaPods**:
   Add the following line to your `Podfile`:
   ```ruby
   pod 'CompareComplySDK'
   ```

2. **Carthage**:
   Add the following line to your `Cartfile`:
   ```
   github "IBM/compare-comply-swift-sdk"
   ```

3. **Swift Package Manager**:
   Add the package to your dependencies:
   ```swift
   .package(url: "https://github.com/IBM/compare-comply-swift-sdk.git", from: "1.0.0")
   ```

4. **Manual Installation**:
   Clone this repository and integrate the necessary files directly into your project.

## Usage

To use the Compare Comply SDK, follow these instructions:

1. **Initialization**:
   Initialize the service with your IBM Cloud API credentials:
   ```swift
   let compareComply = CompareComply(apiKey: "YOUR_API_KEY", url: "YOUR_SERVICE_URL")
   ```

2. **Making a Request**:
   Use the provided methods to analyze documents or get feedback:
   ```swift
   // Example of analyzing a document
   compareComply.analyzeDocument(document: myDocument) { response, error in
       if let error = error {
           print("Error analyzing document: \(error)")
       } else if let response = response {
           print("Document analysis result: \(response)")
       }
   }
   ```

3. **Handling Feedback**:
   You can retrieve and submit feedback using the `GetFeedback` model:
   ```swift
   compareComply.getFeedback(feedbackID: "FEEDBACK_ID") { feedback, error in
       // Handle the feedback
   }
   ```

4. **Batch Processing**:
   Utilize batch functions to process multiple documents at once:
   ```swift
   compareComply.createBatch(documents: myDocuments) { batchStatus, error in
       // Handle the batch status
   }
   ```

## Conclusion

The Compare Comply SDK provides developers with a straightforward way to integrate document comparison and compliance checking capabilities into their applications. With its comprehensive set of models and easy-to-use methods, the SDK facilitates efficient document processing and compliance analysis.

For further details and advanced usage, please refer to the official documentation.# Speech to Text SDK

This repository provides a Swift-based SDK for integrating IBM's Speech to Text service into your applications. The SDK facilitates real-time speech recognition and transcription capabilities, making it suitable for various use cases, including voice commands, dictation, and interactive voice-driven applications.

## Major Components

### 1. **WebSocket Communication**
The SDK implements WebSocket communication for real-time audio streaming and speech recognition. The `SpeechToTextSocket` class manages the connection to the WebSocket server and handles incoming and outgoing messages.

### 2. **Session Management**
The `SpeechToTextSession` class is responsible for managing user sessions, including:
- Starting and stopping the microphone.
- Configuring recognition settings.
- Handling user authentication and session parameters.

### 3. **Recognition Settings**
The `RecognitionSettings` struct defines various parameters for speech recognition, such as:
- Content type (audio format).
- Customization options (e.g., language model and acoustic model).
- Proficiency filters, timestamps, and speaker labels.

### 4. **Audio Handling**
The SDK includes several classes for managing audio input and processing:
- `Recorder`: Captures audio from the microphone.
- `Encoder`: Prepares audio data for transmission over the WebSocket.

### 5. **Data Models**
The SDK provides data models for handling responses from the Speech to Text service, including:
- `RecognitionResults`: Contains the results of the speech recognition process.
- `AudioMetrics`: Contains audio-related metrics for analysis.

## Installation

### Prerequisites
- Xcode 11 or later
- Swift 5.0 or later

### Using CocoaPods
To integrate the SDK into your project using CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'SpeechToTextSDK'
```

Then, run:

```bash
pod install
```

### Using Carthage
To integrate the SDK into your project using Carthage, add the following line to your `Cartfile`:

```bash
github "your-repo-url/SpeechToTextSDK"
```

Then, run:

```bash
carthage update --platform iOS
```

### Manual Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo-url/SpeechToTextSDK.git
   ```
2. Drag and drop the `SpeechToTextSDK` folder into your Xcode project.

## Usage

### Importing the SDK
In your Swift files, import the SDK as follows:

```swift
import SpeechToTextSDK
```

### Setting Up a Speech to Text Session
To set up a speech recognition session:

```swift
let session = SpeechToTextSession(apiKey: "YOUR_API_KEY", iamUrl: "YOUR_IAM_URL")
session.startMicrophone()
```

### Configuring Recognition Settings
You can customize the recognition settings:

```swift
let settings = RecognitionSettings(contentType: "audio/wav")
settings.speakerLabels = true
session.recognitionSettings = settings
```

### Handling Recognition Results
To handle the recognition results:

```swift
session.onResults = { results in
    for result in results {
        print("Recognized text: \(result.transcript)")
    }
}
```

### Stopping the Session
When done, stop the session:

```swift
session.stopMicrophone()
```

## Conclusion
The Speech to Text SDK provides a powerful tool for integrating speech recognition into your applications. By following the installation and usage guidelines, you can easily implement voice-driven functionalities, enhancing the user experience of your app. For more advanced features and configurations, refer to the complete API documentation.# SpeechToText Swift SDK

The SpeechToText Swift SDK is a powerful library for integrating speech recognition capabilities into your Swift applications. This SDK allows you to interact with the Speech to Text service, enabling you to convert audio speech into written text.

## Major Components

The SDK is organized into several key components:

1. **Models**: This section contains the data models corresponding to various entities used in speech recognition, including:
   - `RecognitionJob`: Represents a job for recognizing speech.
   - `LanguageModel`: Represents a language model used for speech recognition.
   - `AudioMetricsDetails`: Contains metrics related to audio input.
   - `KeywordResult`: Represents results for specific keywords recognized in the audio.

2. **Encoders**: The encoder classes handle audio encoding, transforming raw audio data into formats suitable for processing by the Speech to Text service.

3. **WebSockets**: This component manages real-time communication with the Speech to Text service, allowing for continuous streaming of audio and immediate transcription results.

4. **InsecureConnection**: This feature allows the SDK to bypass SSL verification, which may be useful for development or testing purposes in a controlled environment.

## Installation

To install the SpeechToText Swift SDK, you can use [CocoaPods](https://cocoapods.org) or [Carthage](https://github.com/Carthage/Carthage). 

### CocoaPods

Add the following line to your `Podfile`:

```ruby
pod 'SpeechToText'
```

Then run:

```bash
pod install
```

### Carthage

Add the following line to your `Cartfile`:

```
github "YourGitHubUsername/SpeechToText"
```

Then run:

```bash
carthage update
```

## Usage

### Basic Setup

Here’s a quick example of how to set up the SpeechToText SDK in your application:

```swift
import SpeechToText

let speechToText = SpeechToText(authMethod: .iam(apikey: "YOUR_API_KEY"))
```

### Creating a Recognition Job

To create a recognition job, you can use the following code snippet:

```swift
let audioData = ... // Your audio data
speechToText.createJob(audio: audioData, model: "en-US_BroadbandModel") { (result, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let job = result {
        print("Job created: \(job.id)")
    }
}
```

### Streaming Audio for Real-Time Recognition

For real-time speech recognition, you can use WebSockets:

```swift
let recorder = SpeechToTextRecorder { (result, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let transcription = result {
        print("Transcription: \(transcription)")
    }
}

recorder.startRecording()
```

### Handling Errors

The SDK provides comprehensive error handling. You can check for specific error codes and handle exceptions accordingly.

## Conclusion

The SpeechToText Swift SDK offers a seamless way to add speech recognition capabilities to your applications. With easy installation and straightforward usage instructions, you can quickly integrate this powerful technology into your projects. For further details, please refer to the official documentation or the source code provided in this repository.# Speech to Text SDK for Swift

This repository contains a Swift SDK for interacting with IBM's Speech to Text service. The SDK provides various models and methods to facilitate the conversion of audio input into text, enabling developers to integrate speech recognition capabilities into their applications.

## Major Components

### Models

The SDK includes several models that represent different aspects of the Speech to Text service:

1. **AudioResources.swift**: Defines the structure for audio resources including their coding keys, encoding, and decoding methods.
2. **TrainingWarning.swift**: Manages training warnings emitted by the service, providing structured access to warning codes and messages.
3. **AudioMetrics.swift**: Contains metrics related to audio processing such as sampling intervals and accumulated details.
4. **AudioDetails.swift**: Describes the details of audio resources including type, codec, frequency, and compression.
5. **Words.swift**: Represents a list of words processed by the service, providing access to individual word details.

### Features

The SDK supports various features of the Speech to Text service including:

- **Recognize Callbacks**: Handles real-time audio processing and recognition.
- **Processing Metrics**: Tracks audio processing metrics to analyze performance.
- **Semantic Roles**: Provides insights into the roles of words within sentences for better context understanding.

### Installation

To install the Speech to Text SDK in your Swift project, follow these steps:

1. **Carthage Installation**:
   - Add the following line to your `Cartfile`:
     ```
     github "IBM/Swift-SDK" ~> 1.0
     ```
   - Run the command:
     ```bash
     carthage update --platform iOS
     ```

2. **CocoaPods Installation**:
   - Add the following line to your `Podfile`:
     ```ruby
     pod 'SpeechToText', '~> 1.0'
     ```
   - Run the command:
     ```bash
     pod install
     ```

3. **Manually Add the SDK**:
   - Download the SDK files and add them to your Xcode project.

### Usage

To use the Speech to Text SDK, follow these steps:

1. **Import the SDK**:
   ```swift
   import SpeechToText
   ```

2. **Initialize the Speech to Text Service**:
   ```swift
   let speechToText = SpeechToText(apiKey: "YOUR_API_KEY")
   ```

3. **Recognize Speech from Audio**:
   ```swift
   speechToText.recognize(audio: audioData) { response, error in
       if let error = error {
           print("Error recognizing audio: \(error.localizedDescription)")
           return
       }
       if let transcription = response?.results.first?.alternatives.first?.transcript {
           print("Transcription: \(transcription)")
       }
   }
   ```

4. **Handle Recognition Results**:
   You can implement callbacks to handle results and warnings as needed.

### Example

Here’s a simple example of recognizing speech from an audio file:

```swift
let audioFileURL = URL(fileURLWithPath: "path/to/audio/file.mp3")
let audioData = try Data(contentsOf: audioFileURL)

speechToText.recognize(audio: audioData) { response, error in
    if let error = error {
        print("Error: \(error)")
    } else if let transcription = response?.results.first?.alternatives.first?.transcript {
        print("Transcription: \(transcription)")
    }
}
```

### Contributing

If you would like to contribute to this SDK, please fork the repository and submit a pull request with your changes.

### License

This SDK is licensed under the MIT License. See the LICENSE file for more information.

---

Feel free to modify any part of this README to better suit your project!# Natural Language Understanding SDK

This repository contains the Swift SDK for IBM's Natural Language Understanding (NLU) service. The SDK provides an interface to analyze text and extract valuable insights such as entities, emotions, sentiments, semantic roles, and more. 

## Key Components

1. **Models**: The codebase includes various models that encapsulate the results of different analyses:
   - **EntitiesResult**: Represents the results of entity recognition, including mentions, types, and sentiments.
   - **EmotionScores**: Holds scores for different emotions detected in the input text.
   - **SentimentResult**: Represents the sentiment analysis results.
   - **AnalysisResults**: Contains various analyses performed on the text including sentiment, emotion, keywords, entities, and categories.
   - **DisambiguationResult**: Provides information on disambiguated entities detected in the text.

2. **Options**: The SDK allows users to configure various analysis options:
   - **SentimentOptions**: Configure sentiment analysis parameters.
   - **KeywordsOptions**: Configure keyword extraction parameters.
   - **EntitiesOptions**: Configure entity recognition parameters.
   - **EmotionOptions**: Configure emotion detection parameters.
   - **ConceptsOptions**: Configure concept extraction parameters.
   - **RelationsOptions**: Configure relation extraction parameters.

3. **Analysis**: The SDK provides methods to analyze text and retrieve the results in structured formats.

## Installation

To install the SDK, you can use Carthage. Follow these steps:

1. Add the following line to your `Cartfile`:
   ```
   github "IBM/swift-sdk" ~> 1.0
   ```

2. Run the following command in your terminal:
   ```bash
   carthage update --platform iOS
   ```

3. Follow the instructions to add the framework to your Xcode project.

## Usage

To use the NLU SDK, follow these steps:

1. Import the SDK in your Swift file:
   ```swift
   import NaturalLanguageUnderstandingV1
   ```

2. Initialize the NLU service with your API key and URL:
   ```swift
   let nlu = NaturalLanguageUnderstanding(version: "2021-03-01", apiKey: "YOUR_API_KEY")
   ```

3. Prepare your analysis parameters:
   ```swift
   let features = Features(emotion: EmotionOptions(), sentiment: SentimentOptions())
   let parameters = AnalyzeParameters(text: "Your text here", features: features)
   ```

4. Call the analyze method:
   ```swift
   nlu.analyze(parameters: parameters) { response, error in
       if let error = error {
           print("Error: \(error)")
       } else if let response = response {
           print("Analysis results: \(response)")
       }
   }
   ```

5. Handle and use the analysis results as needed.

## Conclusion

This SDK provides a powerful way to integrate IBM's Natural Language Understanding capabilities into your Swift applications. By using this SDK, you can easily analyze text data and extract meaningful insights from it. For further customization and options, refer to the method documentation within the SDK.# Natural Language Understanding Swift SDK

This repository contains a Swift SDK for interacting with the Natural Language Understanding (NLU) service. The SDK provides various models and features that allow users to analyze text and extract valuable insights such as emotions, entities, keywords, and semantic roles.

## Major Components

### Models

1. **Feed**: Represents a collection of documents or data that can be processed by the NLU service.
2. **Features**: Contains various analysis features such as:
   - **Concepts**: Extracts concepts from the text.
   - **Emotion**: Analyzes emotions expressed in the text.
   - **Entities**: Identifies entities in the text and provides relevant metadata.
   - **Keywords**: Extracts keywords from the text.
   - **Sentiment**: Analyzes the sentiment expressed in the text.
   - **Categories**: Classifies the text into various categories.
   - **Syntax**: Analyzes the grammatical structure of the text.
   - **Semantic Roles**: Identifies the roles that entities play in sentences.

3. **CategoriesResultExplanation**: Provides explanations for category results generated by the NLU service.
4. **TargetedEmotionResults**: Represents the results of targeted emotion analysis.
5. **KeywordsResultSentiment**: Contains sentiment analysis results specifically for keywords.

### Options

Each model has associated options to customize the analysis:
- **EntitiesOptions**: Configures settings for entity extraction, such as limiting the number of entities returned.
- **EmotionOptions**: Configures settings for emotion analysis.
- **KeywordsOptions**: Configures settings for keyword extraction.
- **SentimentOptions**: Configures settings for sentiment analysis.
- **SyntaxOptions**: Configures settings for syntax analysis.
- **SemanticRolesOptions**: Configures settings for semantic role labeling.

### Utilities

The SDK includes several utility functions and types for encoding and decoding data, ensuring that the models can be easily serialized and deserialized.

## Installation

To install the SDK, you can use Carthage. Follow these steps:

1. Add the following line to your `Cartfile`:

   ```
   github "YourUsername/swift-sdk" ~> 1.0
   ```

2. Run the following command in your terminal:

   ```bash
   carthage update --platform iOS
   ```

3. Link the built frameworks to your Xcode project.

## Usage

To use the Natural Language Understanding SDK, follow these steps:

1. Import the framework in your Swift file:

   ```swift
   import NaturalLanguageUnderstanding
   ```

2. Create an instance of the NLU service:

   ```swift
   let nluService = NaturalLanguageUnderstanding(apiKey: "YOUR_API_KEY")
   ```

3. Set up the options for the analysis you want to perform. For example, to analyze emotions:

   ```swift
   let emotionOptions = EmotionOptions()
   emotionOptions.model = "en"
   ```

4. Call the appropriate method on the NLU service to analyze your text:

   ```swift
   nluService.analyze(text: "I love programming!", features: [emotionOptions]) { result, error in
       if let error = error {
           print("Error: \(error.localizedDescription)")
       } else if let result = result {
           print("Analysis result: \(result)")
       }
   }
   ```

5. Handle the analysis results as needed.

## Contributing

If you would like to contribute to this SDK, please fork the repository and submit a pull request. Ensure that your code is well-documented and follows the Swift style guidelines.

## License

This SDK is licensed under the MIT License. See the `LICENSE` file for more details.

---

For more information about the Natural Language Understanding service, refer to the [official documentation](https://cloud.ibm.com/apidocs/natural-language-understanding).# Natural Language Understanding SDK for Swift

This repository contains the Swift SDK for IBM's Natural Language Understanding (NLU) service. The SDK allows developers to easily integrate NLU capabilities into their Swift applications, enabling various natural language processing features such as sentiment analysis, emotion detection, entity recognition, and more.

## Major Components

The SDK consists of several key components, each responsible for different functionalities:

1. **Models**: The core data models that represent the structure of the data returned by the NLU service. Models include:
   - `EntitiesResultSentiment`: Represents the sentiment associated with detected entities.
   - `Author`: Represents information about the author of a document or content.
   - `DocumentSentimentResults`: Represents the overall sentiment of a document.
   - `KeywordsResultEmotion`: Represents emotions related to detected keywords.
   - `SyntaxResult`: Contains the results of syntactic analysis, including tokens and sentences.
   - `RelationsResult`: Represents relationships identified in the analyzed text.
   - `ConceptsResult`: Represents concepts detected in the text.

2. **Enrichment Features**: These features allow users to enhance their queries with additional capabilities, such as:
   - Emotion detection
   - Sentiment analysis
   - Entity extraction
   - Keyword extraction

3. **Discovery Service Integration**: The SDK provides functionalities to interact with the Discovery service, including operations to create, update, delete, and retrieve collections and documents.

## Installation

To install the Natural Language Understanding SDK for Swift, follow these steps:

1. **Carthage Installation**:
   - Ensure you have Carthage installed. If you don't, you can install it using Homebrew:
     ```bash
     brew install carthage
     ```
   - Add the following line to your `Cartfile`:
     ```bash
     github "IBM/swift-sdk"
     ```
   - Run the following command in your terminal:
     ```bash
     carthage update --platform iOS
     ```

2. **Manual Installation**:
   - Clone this repository:
     ```bash
     git clone https://github.com/IBM/swift-sdk.git
     ```
   - Drag the `NaturalLanguageUnderstandingV1` folder into your Xcode project.

## Usage

To use the SDK in your Swift application, follow these steps:

1. **Import the SDK**:
   In your Swift file, import the necessary modules:
   ```swift
   import NaturalLanguageUnderstandingV1
   ```

2. **Create an NLU Instance**:
   Initialize the NLU service with your API credentials:
   ```swift
   let nlu = NaturalLanguageUnderstanding(version: "2021-08-01", apiKey: "YOUR_API_KEY")
   ```

3. **Analyze Text**:
   Use the NLU instance to analyze text. For example, to analyze sentiment:
   ```swift
   let parameters = AnalyzeParameters(text: "I love programming!", features: Features(sentiment: SentimentOptions()))
   nlu.analyze(parameters: parameters) { response, error in
       if let error = error {
           print("Error: \(error.localizedDescription)")
       } else if let response = response {
           print("Sentiment: \(response.sentiment?.document?.label ?? "No sentiment detected")")
       }
   }
   ```

4. **Handle Responses**:
   Process the response received from the NLU service to extract insights and display them in your application.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

For more information, refer to the [IBM Natural Language Understanding documentation](https://cloud.ibm.com/apidocs/natural-language-understanding).# Swift SDK for IBM Watson Discovery

## Overview

The Swift SDK for IBM Watson Discovery provides a set of functionalities that allows developers to integrate Watson Discovery services into their Swift applications. The SDK facilitates operations such as managing collections, adding documents, querying for insights, and utilizing natural language understanding capabilities.

## Major Components

1. **Models**: The SDK contains various models that represent different entities and responses from the Watson Discovery service. Key models include:
   - `DocumentSnapshot`: Represents the snapshot of a document in a collection.
   - `QueryResultMetadata`: Contains metadata about the results from a query.
   - `NluEnrichmentFeatures`: Encapsulates features for NLU enrichments such as keywords, entities, sentiments, etc.
   - `Gateway`: Represents a gateway to access the service.
   - `Environment, Collection, Configuration`: Manage environments, collections, and configurations within the Discovery service.

2. **Requests**: Functions for sending requests to the Watson Discovery API, including:
   - `addDocument`: Adds documents to a specified collection.
   - `deleteCollection`: Deletes a specified collection.
   - `getCollection`: Retrieves details about a specified collection.
   - `listCollections`: Lists all collections in an environment.

3. **Responses**: Classes that handle responses from the API calls, ensuring that the data returned from the service is accurately mapped to Swift types.

## Installation

### Prerequisites

- Xcode 11 or later
- Swift 5.0 or later

### Using CocoaPods

1. Add the following to your Podfile:

   ```ruby
   pod 'WatsonDiscovery', '~> 1.0'
   ```

2. Run the following command to install the SDK:

   ```bash
   pod install
   ```

### Using Carthage

1. Add the following to your Cartfile:

   ```
   github "IBM/SwiftSDK" ~> 1.0
   ```

2. Run the following command to build the framework:

   ```bash
   carthage update --platform iOS
   ```

## Usage

### Importing the SDK

In your Swift file, import the SDK:

```swift
import WatsonDiscovery
```

### Initializing the Service

To initialize the Watson Discovery service, use the following code:

```swift
let discovery = Discovery(version: "2023-10-01", apiKey: "your_api_key")
```

### Example: Adding a Document

```swift
let document = Document(file: Data(), filename: "example.pdf", contentType: "application/pdf")
let completionHandler: (Result<Document, Error>) -> Void = { result in
    switch result {
    case .success(let document):
        print("Document added: \(document)")
    case .failure(let error):
        print("Error adding document: \(error)")
    }
}

discovery.addDocument(environmentId: "your_environment_id", collectionId: "your_collection_id", file: document, completionHandler: completionHandler)
```

### Example: Querying for Insights

To query the Discovery service for insights from a collection:

```swift
let query = "your_query_string"
discovery.query(environmentId: "your_environment_id", collectionId: "your_collection_id", query: query) { result in
    switch result {
    case .success(let response):
        print("Query results: \(response)")
    case .failure(let error):
        print("Error querying: \(error)")
    }
}
```

## Conclusion

The Swift SDK for IBM Watson Discovery simplifies the integration of powerful discovery features into Swift applications. With easy-to-use models and methods for interacting with the Watson Discovery service, developers can quickly build applications that leverage Watson's capabilities for document management and natural language understanding. Be sure to refer to the [IBM Watson Discovery API documentation](https://cloud.ibm.com/apidocs/discovery) for additional details and advanced usage.# Discovery SDK for Swift

## Overview
The Discovery SDK for Swift provides a set of tools for interacting with IBM's Discovery service. The SDK enables developers to perform various operations like enrichment of natural language understanding (NLU), managing collections, handling documents, and working with various response types from the Discovery service.

## Major Components
The repository consists of several key components:

1. **Nlu Enrichment**: 
   - Classes for managing concepts, relations, categories, emotions, entities, keywords, and sentiment analysis.
   - Includes features for modifying, setting, and getting these NLU enrichment types.

2. **Models**:
   - Classes that represent various models such as `SourceOptionsFolder`, `TokenDictStatusResponse`, `SduStatus`, `Histogram`, etc.
   - Each model generally provides a way to decode and encode the data being sent to or received from the Discovery service.

3. **Response Handling**:
   - Classes designed to handle the responses from queries to the Discovery service, including handling specific response types such as `LogQueryResponseResult`, `QueryResponse`, and others.

4. **Source Options**:
   - Classes for configuring source options, including web crawling settings and credential management.

5. **Training and Example Management**:
   - Tools for managing training examples and settings related to training models.

## Installation
To install the Discovery SDK for Swift, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/discovery-sdk.git
   cd discovery-sdk
   ```

2. **Using CocoaPods**:
   Add the following line to your Podfile:
   ```ruby
   pod 'DiscoverySDK'
   ```

   Then run:
   ```bash
   pod install
   ```

3. **Using Swift Package Manager**:
   Add the following dependency to your `Package.swift` file:
   ```swift
   .package(url: "https://github.com/yourusername/discovery-sdk.git", from: "1.0.0")
   ```

## Usage Instructions
To use the Discovery SDK in your Swift project, follow these steps:

1. **Import the SDK**:
   At the top of your Swift file, import the SDK:
   ```swift
   import DiscoverySDK
   ```

2. **Initialize the Discovery Service**:
   Create an instance of the `Discovery` service with your API credentials:
   ```swift
   let discovery = Discovery(apiKey: "YOUR_API_KEY", version: "2023-10-01")
   ```

3. **Perform Operations**:
   Use the various classes and methods available in the SDK to interact with the Discovery service. For example, to enrich a document:
   ```swift
   let document = "Your document text here"
   discovery.enrichDocument(document: document) { enrichedResult, error in
       if let error = error {
           print("Error enriching document: \(error)")
       } else {
           print("Enriched document: \(enrichedResult)")
       }
   }
   ```

4. **Handle Responses**:
   You can manage responses using the provided models, ensuring you handle decoding and encoding as necessary.

## Contributing
We welcome contributions to the Discovery SDK! Please fork the repository and submit a pull request with your changes.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 

For more detailed documentation, refer to the [official IBM Cloud Discovery documentation](https://cloud.ibm.com/docs/discovery?code=swift-sdk).

---

Feel free to modify the example code and installation instructions based on your specific project needs!# Swift SDK for Discovery Service

This repository contains a Swift SDK for interacting with the Discovery Service API. The SDK is designed to facilitate the integration of Discovery functionalities into Swift applications. It includes various models and methods for managing credentials, queries, and results.

## Major Parts of the Code

1. **Models**: 
   - The SDK contains models representing different entities within the Discovery Service. Each model corresponds to a specific part of the API, facilitating data structure management and serialization.
   - Models include `CredentialDetails`, `ListCollectionFieldsResponse`, `QueryLarge`, `MetricAggregation`, and more.

2. **Encoding and Decoding**: 
   - The SDK provides mechanisms for encoding and decoding data to and from JSON format using Swift's `Codable` protocol.
   - Keyed encoding and decoding containers are used to manage the serialization of complex nested structures.

3. **Custom String Representation**: 
   - Many models conform to `CustomStringConvertible` and `CustomDebugStringConvertible` protocols to provide meaningful string representations for debugging and logging.

4. **Networking**: 
   - The SDK includes network handling capabilities to send requests to the Discovery Service and process responses.

5. **Management of Credentials**: 
   - The SDK handles various operations related to credentials, including creating, deleting, and updating credentials, as well as managing their states.

## Installation

To install the Swift SDK for Discovery Service, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/discovery-swift-sdk.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd discovery-swift-sdk
   ```

3. **Install Dependencies**:
   If you're using CocoaPods, add the following to your `Podfile`:
   ```ruby
   pod 'DiscoverySDK'
   ```

   Then run:
   ```bash
   pod install
   ```

4. **Open the Project**:
   Open the `.xcworkspace` file in Xcode.

## Usage

Here’s a quick guide on how to use the SDK in your Swift application:

1. **Import the SDK**:
   At the top of your Swift file, import the SDK:
   ```swift
   import DiscoverySDK
   ```

2. **Initialize a Service Client**:
   Create an instance of the service client to start using the API:
   ```swift
   let discoveryClient = DiscoveryClient(apiKey: "YOUR_API_KEY")
   ```

3. **Perform Operations**:
   You can now perform various operations using the models and methods provided by the SDK. For example, to create a new credential:
   ```swift
   let newCredential = CredentialDetails()
   newCredential.username = "user@example.com"
   newCredential.password = "securePassword"
   discoveryClient.createCredential(credential: newCredential) { result in
       switch result {
       case .success(let response):
           print("Credential created successfully: \(response)")
       case .failure(let error):
           print("Error creating credential: \(error)")
       }
   }
   ```

4. **Handle Query Results**:
   Use the models to manage query results:
   ```swift
   discoveryClient.queryDocuments(query: "search term") { result in
       switch result {
       case .success(let documents):
           for document in documents {
               print("Found document: \(document.title)")
           }
       case .failure(let error):
           print("Error querying documents: \(error)")
       }
   }
   ```

## Conclusion

The Swift SDK for Discovery Service simplifies the process of integrating Discovery functionalities into your applications. It provides a robust set of models and methods to interact with the API seamlessly. For further details, refer to the API documentation or explore the codebase for additional functionalities and examples.# Swift SDK for Discovery V1

This repository contains a Swift SDK for interacting with Discovery V1 APIs. The SDK provides models and functions that facilitate the communication with the Discovery service, enabling developers to integrate various functionalities such as training queries, document management, and enrichment processes.

## Major Components

### Models

The SDK includes several key models representing different entities and responses from the Discovery API:

1. **TrainingQuery**: Represents a query for training data.
2. **TrainingStatus**: Provides the status of a training operation.
3. **TrainingExample**: Details individual training examples used in the training process.
4. **DeleteDocumentResponse**: Represents the response received after deleting a document.
5. **EnvironmentDocuments**: Contains documents associated with a specific environment.
6. **NormalizationOperation**: Represents a normalization operation that can be applied during data processing.
7. **QueryEntitiesContext**: Provides context for querying entities within the service.
8. **NluEnrichment**: Models related to Natural Language Understanding enrichments.
9. **SourceOptions**: Represents options for configuring the data source.
10. **LogQueryResponseResultDocuments**: Represents results from log queries.

### Configuration

The SDK is designed to be configurable, allowing users to set various parameters such as connection settings, query parameters, and operational options.

## Installation

To install the Swift SDK for Discovery V1, follow these steps:

### Prerequisites

- Ensure you have [Xcode](https://developer.apple.com/xcode/) installed on your macOS.
- Swift Package Manager is needed to manage dependencies.

### Steps to Install

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/swift-sdk.git
   cd swift-sdk
   ```

2. Open the project in Xcode:
   ```bash
   open swift-sdk.xcodeproj
   ```

3. Add the SDK as a dependency in your Swift project by modifying your `Package.swift` file:
   ```swift
   dependencies: [
       .package(url: "https://github.com/your-username/swift-sdk.git", from: "1.0.0"),
   ]
   ```

## Usage

### Setting Up

To use the SDK, you need to import the SDK module into your Swift files. 

```swift
import DiscoveryV1
```

### Example

Here's a simple example demonstrating how to initialize a training query and execute it:

```swift
// Initialize the Discovery service
let discoveryService = Discovery(apiKey: "YOUR_API_KEY")

// Create a training query
let trainingQuery = TrainingQuery(parameters: ["param1": "value1", "param2": "value2"])

// Execute the training query
discoveryService.executeTrainingQuery(trainingQuery) { result in
    switch result {
    case .success(let response):
        print("Training query executed successfully: \(response)")
        
    case .failure(let error):
        print("Error executing training query: \(error.localizedDescription)")
    }
}
```

### Handling Responses

The models in the SDK provide methods to parse the responses from the API calls, making it easy to access the data you need.

### Error Handling

The SDK provides error handling mechanisms to help manage any issues that arise during API calls. Always check for errors in your completion handlers.

## Contributing

Contributions to the SDK are welcome! Please submit a pull request or open an issue if you encounter any problems or have suggestions for improvements.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

This README provides a comprehensive overview of the Swift SDK for Discovery V1, including its major components, installation instructions, and usage examples to help developers get started quickly.# Swift SDK for Discovery V1

## Overview

The Swift SDK for Discovery V1 provides a set of models and methods to interact with the Discovery service. This allows developers to manage environments, collections, documents, and perform various queries on the data stored in the Discovery service. The SDK encapsulates complex operations and provides easy-to-use methods for each functionality.

## Key Features

- **Environment Management**: Create, delete, and update environments.
- **Collection Management**: Handle collections within environments, including creating and deleting collections.
- **Document Management**: Add, delete, and update documents within collections.
- **Querying**: Perform complex queries to retrieve documents and analyze data using queries.
- **Training Data**: Manage training examples for machine learning models.

## Installation

To install the Swift SDK for Discovery V1, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/swift-sdk.git
   ```

2. **Navigate to the Directory**:
   ```bash
   cd swift-sdk
   ```

3. **Install Dependencies**:
   If you are using Carthage, run the following command:
   ```bash
   carthage update --platform iOS
   ```

4. **Add to Your Project**:
   Drag and drop the built frameworks from the `Carthage/Build/iOS` folder into your Xcode project.

## Usage Instructions

Here's a brief guide on how to use the major functionalities of the SDK:

### 1. Initialize the SDK

Before using the SDK, you need to initialize it with the appropriate credentials:

```swift
import DiscoveryV1

let discovery = Discovery(apiKey: "YOUR_API_KEY", url: "YOUR_SERVICE_URL")
```

### 2. Manage Environments

#### Create an Environment

```swift
let environment = try discovery.createEnvironment(name: "My Environment", description: "This is my environment.")
```

#### Delete an Environment

```swift
try discovery.deleteEnvironment(environmentID: "ENVIRONMENT_ID")
```

### 3. Manage Collections

#### Create a Collection

```swift
let collection = try discovery.createCollection(environmentID: "ENVIRONMENT_ID", name: "My Collection", description: "This is my collection.")
```

#### Delete a Collection

```swift
try discovery.deleteCollection(environmentID: "ENVIRONMENT_ID", collectionID: "COLLECTION_ID")
```

### 4. Manage Documents

#### Add a Document

```swift
let document = try discovery.addDocument(environmentID: "ENVIRONMENT_ID", collectionID: "COLLECTION_ID", document: yourDocumentData)
```

#### Delete a Document

```swift
try discovery.deleteDocument(environmentID: "ENVIRONMENT_ID", collectionID: "COLLECTION_ID", documentID: "DOCUMENT_ID")
```

### 5. Query Data

#### Query Documents

```swift
let queryResults = try discovery.query(environmentID: "ENVIRONMENT_ID", collectionID: "COLLECTION_ID", query: "YOUR_QUERY")
```

### 6. Manage Training Data

#### Add Training Example

```swift
let trainingExample = try discovery.addTrainingExample(environmentID: "ENVIRONMENT_ID", collectionID: "COLLECTION_ID", documentID: "DOCUMENT_ID", relevance: 1, crossReference: "YOUR_CROSS_REFERENCE")
```

#### Delete Training Example

```swift
try discovery.deleteTrainingExample(environmentID: "ENVIRONMENT_ID", collectionID: "COLLECTION_ID", documentID: "DOCUMENT_ID")
```

## Conclusion

The Swift SDK for Discovery V1 simplifies the interaction with the Discovery service, allowing developers to focus on building applications without worrying about the underlying complexities. For more detailed information, refer to the code documentation or the official Discovery API documentation.# Assistant SDK for Swift

The Assistant SDK for Swift provides a simple interface to interact with IBM Watson's Assistant service, allowing developers to build conversational applications easily. This SDK facilitates session management, message handling, and context management to create engaging user experiences.

## Major Components

1. **Message Context**:  
   The `MessageContext` class encapsulates the context of a conversation, enabling the storage and retrieval of important information throughout the session. It includes:
   - `global`: Global context information.
   - `skills`: Skills associated with the Assistant application.

2. **Message Input Options**:  
   The `MessageInputOptions` class allows customization of the input message sent to the Assistant, including options for debugging, alternate intents, and context handling.

3. **Responses**:  
   The SDK handles various response types that the Assistant can return, such as:
   - `MessageResponse`: Represents the Assistant's response, including text, actions, and suggestions.
   - `DialogNodeOutputOptionsElement`: Represents specific output options in the dialog.

4. **Runtime Entities**:  
   The `RuntimeEntity` class is used to capture entities recognized in user input, allowing the Assistant to understand and respond to contextually relevant queries.

5. **Insecure Connection Handling**:  
   The SDK includes support for managing insecure connections, allowing developers to set up an `AllowInsecureConnectionDelegate`.

6. **Error Handling**:  
   The SDK provides error management features to handle issues that may arise during API requests.

## Installation

To use the Assistant SDK in your Swift project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/AssistantSDK.git
   ```

2. **Install Dependencies**:  
   The SDK uses [Carthage](https://github.com/Carthage/Carthage) for dependency management. Ensure you have Carthage installed, then run:
   ```bash
   carthage update --platform iOS
   ```

3. **Add the Framework**:
   Drag the `Assistant.framework` from the `Carthage/Build/iOS` directory into your Xcode project.

## Usage

To get started with the Assistant SDK, follow these instructions:

1. **Import the SDK**:
   ```swift
   import Assistant
   ```

2. **Create an Instance of the Assistant**:
   ```swift
   let assistant = Assistant(apiKey: "YOUR_API_KEY", version: "2021-06-14")
   ```

3. **Start a Session**:
   ```swift
   assistant.createSession { response, error in
       guard let sessionID = response?.sessionID else {
           print("Error creating session: \(error?.localizedDescription ?? "")")
           return
       }
       print("Session created with ID: \(sessionID)")
   }
   ```

4. **Send a Message**:
   ```swift
   let input = MessageInput(text: "Hello, how can I help you today?")
   assistant.sendMessage(input: input, sessionID: sessionID) { response, error in
       if let output = response?.output {
           print("Assistant response: \(output.text)")
       } else {
           print("Error sending message: \(error?.localizedDescription ?? "")")
       }
   }
   ```

5. **End the Session**:
   ```swift
   assistant.deleteSession(sessionID: sessionID) { error in
       if let error = error {
           print("Error deleting session: \(error.localizedDescription)")
       } else {
           print("Session deleted successfully.")
       }
   }
   ```

## License

This SDK is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.# Assistant V2 SDK for Swift

This repository contains the Swift SDK for interacting with IBM Watson's Assistant V2 API. It provides a set of classes and methods for building applications that can communicate with Watson Assistant, allowing developers to integrate AI-driven conversations into their applications.

## Major Components

1. **Models**: The SDK includes various model classes that represent the different entities and responses from the Assistant API. Some of the key models include:
   - `RuntimeEntity`: Represents entities recognized by the Assistant.
   - `CaptureGroup`: Represents a group of captured entities from a user input.
   - `DialogNodeOutputOptionsElement`: Represents output options for dialog nodes.
   - `SearchResult`: Represents the results of a search query.
   - `MessageResponseContext`: Contains contextual information about the Assistant's response.
   - `MessageInput`: Represents the input message sent to the Assistant.

2. **Coding Keys**: The SDK provides custom coding keys for encoding and decoding the models to and from JSON, ensuring that the structure matches the API specifications.

3. **Networking**: The SDK handles the networking aspects, including requests and responses to/from the Assistant API, allowing for seamless integration.

4. **Error Handling**: The SDK includes mechanisms to handle errors that may arise during API calls.

## Installation

To install the SDK, you can use Carthage. Follow these steps:

1. **Install Carthage**:
   If you haven't already installed Carthage, you can do so using Homebrew:
   ```bash
   brew install carthage
   ```

2. **Add the SDK to Your Project**:
   Create a `Cartfile` in your project directory and add the following line:
   ```
   github "IBM/Swift-SDK" ~> 2.0
   ```

3. **Build the SDK**:
   Run the following command to build the SDK:
   ```bash
   carthage update --platform iOS
   ```

4. **Link the Framework**:
   After building, link the resulting framework to your Xcode project.

## Usage

Once the SDK is installed, you can start using it in your application. Here's a basic example of how to interact with the Assistant API:

```swift
import AssistantV2

// Initialize the Assistant
let assistant = Assistant(version: "2023-10-01")

// Create a message input
let messageInput = MessageInput(text: "Hello, how can I help you?", intents: [], entities: [])

// Send a message to the Assistant
assistant.message(assistantID: "your-assistant-id", input: messageInput) { response, error in
    if let error = error {
        print("Error sending message: \(error.localizedDescription)")
    } else if let response = response {
        print("Assistant response: \(response.output.generic.first?.text ?? "")")
    }
}
```

### Configuration

Make sure to configure the SDK with your **API key** and **service URL** before making requests. You can set these in your application setup:

```swift
let apiKey = "your-api-key"
let serviceURL = "https://api.us-south.assistant.watson.cloud.ibm.com/instances/your-instance-id"

let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)
assistant.authenticator = authenticator
assistant.serviceURL = serviceURL
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for more details.# SpeechToText Swift SDK

This repository contains a Swift SDK for integrating speech-to-text functionalities in your applications. The SDK provides a range of features for audio recognition and allows the customization of models, grammars, and other settings.

## Major Components

### 1. **Models**
- **Recognition Settings**: Classes and structures to define settings for audio recognition, such as language model, acoustic model, and various parameters for customization.
- **Audio Resources**: Structures to manage audio resources, including details about audio listing and resource details.
- **Custom Words**: Support for adding, removing, and managing custom words and their variations for improved recognition accuracy.

### 2. **WebSockets**
- **SpeechToTextSession**: Manages WebSocket connections to a server for real-time audio streaming and recognition.
- **Socket Handling**: Handles socket connections, including sending and receiving audio data, as well as managing connection states.

### 3. **Recognition Callbacks**
- **Recognition Results**: Provides structures for handling recognition results, including confidence levels, timestamps, and alternatives.
- **Error Handling**: Structures to manage and return errors during recognition processes.

### 4. **REST API Integration**
- **Requests and Responses**: Functions for making RESTful API calls to manage audio resources, recognition jobs, and model customizations.

## Installation

To install the SpeechToText SDK, follow these steps:

### Step 1: Clone the Repository
```bash
git clone https://github.com/your-repo/speech-to-text-swift-sdk.git
cd speech-to-text-swift-sdk
```

### Step 2: Install Dependencies
Make sure you have CocoaPods installed. If not, install CocoaPods first.

```bash
sudo gem install cocoapods
```

Then, navigate to the project directory and run:

```bash
pod install
```

### Step 3: Open the Project
Open the `.xcworkspace` file in Xcode:
```bash
open SpeechToText.xcworkspace
```

## Usage

To use the SpeechToText SDK, follow these steps:

### Step 1: Import the SDK
In your Swift files, import the SDK:
```swift
import SpeechToText
```

### Step 2: Initialize the SpeechToText Session
```swift
let speechToText = SpeechToText(apiKey: "YOUR_API_KEY", iamUrl: "YOUR_IAM_URL")
```

### Step 3: Configure Recognition Settings
Setup recognition settings according to your requirements:
```swift
let recognitionSettings = RecognitionSettings()
recognitionSettings.contentType = "audio/wav"
recognitionSettings.interimResults = true
```

### Step 4: Start Recognition
To start the recognition process:
```swift
speechToText.recognize(audio: audioData, settings: recognitionSettings) { result, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let result = result {
        print("Recognition Result: \(result.bestTranscript)")
    }
}
```

### Step 5: Handle Callbacks
Implement the required callback functions to manage results and errors:
```swift
class RecognitionCallback: RecognizeCallback {
    func onResults(results: [RecognitionResult]) {
        // Handle the results
    }

    func onError(error: Error) {
        // Handle the error
    }
}
```

### Step 6: Clean Up
Don't forget to clean up the session when done:
```swift
speechToText.stop()
```

## Conclusion

This SDK provides easy integration of speech-to-text recognition capabilities into your applications. With customizable models and settings, developers can enhance the recognition accuracy based on specific use cases.

For detailed documentation and examples, please refer to the code comments and additional documentation in this repository.# Speech to Text SDK

## Overview

The Speech to Text SDK allows developers to integrate speech recognition capabilities into their applications. The SDK provides various features for managing language models, recognition jobs, and audio processing, enabling effective speech-to-text conversion.

## Major Components

1. **Models**: The SDK includes several model classes that represent key components of the speech recognition system:
   - `RecognitionJob`: Represents a job for processing audio and obtaining transcription results.
   - `LanguageModel`: Represents a model that can be trained and customized for specific speech recognition tasks.
   - `KeywordResult`: Represents the results of keyword detection during speech recognition.
   - `ProcessedAudio`: Represents audio that has already been processed for recognition.
   - `TrainingWarning`: Represents warnings that may arise during the training of language models.

2. **Utilities**: The SDK provides utility functions for handling audio data and managing recognition states:
   - `Recorder`: Manages audio recording and processing.
   - `RecognitionState`: Represents the current state of an ongoing recognition process.
   - `SupportedFeatures`: Lists the features supported by the API, such as speaker labels and custom language models.

3. **WebSocket Connections**: The SDK supports WebSocket connections for real-time audio streaming and processing, allowing for live speech recognition.

## Installation

To install the Speech to Text SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/speech-to-text-sdk.git
   cd speech-to-text-sdk
   ```

2. **Install Dependencies**:
   Ensure that you have [CocoaPods](https://cocoapods.org/) installed. Then, run:
   ```bash
   pod install
   ```

3. **Open the Project**:
   Open the `.xcworkspace` file in Xcode.

## Usage

### Setting Up the SDK

1. **Import the SDK**:
   In your Swift file, import the SDK:
   ```swift
   import SpeechToTextV1
   ```

2. **Initialize the Speech to Text Service**:
   Create an instance of the speech-to-text service with your credentials:
   ```swift
   let speechToText = SpeechToText(apiKey: "YOUR_API_KEY")
   ```

### Recognizing Speech

1. **Start a Recognition Job**:
   Create a recognition job by providing audio input:
   ```swift
   let audioFilePath = "path/to/audio/file.wav"
   speechToText.recognize(audio: audioFilePath) { response, error in
       if let error = error {
           print("Error recognizing audio: \(error.localizedDescription)")
           return
       }
       if let results = response?.results {
           print("Transcription: \(results)")
       }
   }
   ```

2. **Manage Language Models**:
   You can create, delete, and list language models:
   ```swift
   speechToText.createLanguageModel(name: "CustomModel", completionHandler: { model, error in
       // Handle model creation
   })
   ```

3. **Handle Recognition States**:
   Monitor the state of recognition jobs:
   ```swift
   speechToText.checkJob(id: "JOB_ID") { job, error in
       // Handle job check
   }
   ```

### Additional Features

- **Customizations**: You can customize language models to improve accuracy for specific vocabulary.
- **Error Handling**: The SDK provides detailed error messages for better debugging.

## Conclusion

The Speech to Text SDK is a comprehensive tool for integrating speech recognition into your applications. With easy installation and extensive features, developers can quickly build robust speech-to-text functionalities. For more information, check the detailed documentation within the source code or the project's GitHub page. 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.# Speech to Text SDK for Swift

## Overview
The Speech to Text SDK is designed to provide developers with easy access to speech recognition capabilities. This SDK utilizes Watson's Speech to Text services to convert audio voice into written text. It supports various features, including language model creation, audio metrics, and recognition alternatives.

## Major Components

### 1. Models
The SDK contains several models that represent various elements of the Speech to Text service:

- **CreateLanguageModel**: This model is used to create a custom language model, allowing users to tailor the speech recognition to specific vocabulary or usage scenarios.
- **AudioMetricsHistogramBin**: Represents audio metrics that help analyze the audio data processed.
- **RecognitionAlternative**: Contains the results of a recognition request, including transcripts and confidence scores.
- **Face, FaceGender, FaceAge, DetectedFaces**: These models are used to handle facial recognition results, allowing the identification of various attributes like age and gender.
- **ClassifierResult**: Represents the outcome of a classification request, detailing the class names and associated scores.

### 2. Error Handling
The SDK includes error handling mechanisms through the `ErrorInfo` model, which provides details about errors encountered during API calls.

### 3. Shared Utilities
The `Shared` class includes utility methods for common operations, such as generating SDK headers, managing API keys, and handling user agents.

### 4. Networking
The SDK utilizes RestKit for making network requests to the Watson Speech to Text API, handling encoding and decoding of responses effectively.

## Installation

To install the Speech to Text SDK, you can use CocoaPods or manually integrate it into your project. 

### Using CocoaPods
1. Add the following line to your `Podfile`:
   ```
   pod 'SpeechToTextSDK', '~> 2.3.0'
   ```
2. Run `pod install` to install the SDK.

### Manual Integration
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/speech-to-text-sdk.git
   ```
2. Add the `Source/SpeechToTextV1` directory to your Xcode project.
3. Ensure all dependencies are included and linked in your project settings.

## Usage

### Importing the SDK
To use the SDK in your Swift code, import the necessary modules:
```swift
import SpeechToTextV1
```

### Creating a Language Model
To create a custom language model, instantiate the `CreateLanguageModel` class and configure it:
```swift
let languageModel = CreateLanguageModel(
    name: "CustomModel",
    base: "en-US_BroadbandModel",
    description: "A custom language model for specific vocabulary."
)

// Call the API to create the model
```

### Recognizing Audio
To recognize speech from audio input:
```swift
let audioFile = "path/to/audio/file.wav"
let recognitionCallback = RecognizeCallback { result in
    // Handle recognition result
}

// Start recognition
speechToText.recognizeUsingWebSocket(audioFile, callback: recognitionCallback)
```

### Handling Errors
Handle errors gracefully by checking the `ErrorInfo` model for detailed messages:
```swift
if let error = errorInfo {
    print("Error occurred: \(error.description)")
}
```

## Conclusion
The Speech to Text SDK for Swift provides a robust interface for integrating speech recognition features into your applications. Follow the installation and usage instructions to get started quickly. For further details, refer to the official documentation or the API reference.# Visual Recognition SDK

The Visual Recognition SDK is a library designed to facilitate integration with IBM's Visual Recognition service. This service allows users to classify images, detect faces, and analyze visual content using machine learning models.

## Major Components

### Models
The SDK contains several model classes that represent the various entities returned by the Visual Recognition service:
- **Classifier**: Represents a trained classifier model.
- **ClassResult**: Represents the result of a classification request, including class names and their respective confidence scores.
- **ImageWithFaces**: Represents an image that contains detected faces, along with their attributes.
- **WarningInfo**: Contains warning information returned by the service, such as potential issues with the request.
- **ClassifiedImages**: Represents a collection of images that have been classified by the service.

### Networking
The SDK uses the `RestKit` library for making network requests. It includes methods for:
- **Authenticating**: Supports multiple authentication methods including API Key and IAM Token.
- **Making Requests**: Provides methods to classify images, detect faces, create, update, and delete classifiers.

### Error Handling
The SDK includes error handling mechanisms to capture and manage errors returned from network requests.

## Installation

To install the Visual Recognition SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/visual-recognition-sdk.git
   cd visual-recognition-sdk
   ```

2. **Install Dependencies**:
   Make sure you have [CocoaPods](https://cocoapods.org/) installed. Then run the following command:
   ```bash
   pod install
   ```

3. **Open the Project**:
   Open the `.xcworkspace` file in Xcode:
   ```bash
   open visual-recognition-sdk.xcworkspace
   ```

## Usage

1. **Import the SDK**:
   In your Swift file, import the Visual Recognition SDK:
   ```swift
   import VisualRecognitionV3
   ```

2. **Initialize the Service**:
   Create an instance of the `VisualRecognition` service using your API key:
   ```swift
   let visualRecognition = VisualRecognition(apiKey: "YOUR_API_KEY", version: "2023-10-01")
   ```

3. **Classifying an Image**:
   Use the service instance to classify an image:
   ```swift
   let imageData = Data(contentsOf: URL(fileURLWithPath: "path_to_your_image"))
   visualRecognition.classify(imageData: imageData, classifierIDs: ["YOUR_CLASSIFIER_ID"]) { response, error in
       if let error = error {
           print("Error: \(error.localizedDescription)")
       } else if let classifications = response?.classifications {
           print("Classifications: \(classifications)")
       }
   }
   ```

4. **Handling Warnings**:
   If the service returns warnings, you can access them through the `WarningInfo` class:
   ```swift
   if let warnings = response?.warnings {
       for warning in warnings {
           print("Warning: \(warning.description)")
       }
   }
   ```

5. **Additional Features**:
   The SDK also allows you to create, update, and delete classifiers. Refer to the respective methods in the `Classifier` model for more details.

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue to discuss potential improvements or bugs.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

This README provides a comprehensive overview of the Visual Recognition SDK, its major components, installation instructions, and basic usage examples. For more advanced features and detailed API documentation, please refer to the official documentation provided in the repository.# Natural Language Classifier SDK

The Natural Language Classifier SDK provides a Swift interface to interact with IBM Watson's Natural Language Classifier service, allowing users to classify text input into predefined categories. This SDK is designed to simplify the integration of natural language processing capabilities into Swift applications.

## Major Components

1. **Models**: The SDK includes various models reflecting the core components of the Natural Language Classifier API, including:
   - **Classifier**: Represents a trained classifier, containing details such as the classifier ID, name, and status.
   - **ClassifiedClass**: Represents a classification result, including the class name and confidence score.
   - **CollectionItem**: Represents an item in a collection of classifications.
   - **Classification**: Represents the classification response, which includes the classifier ID, input text, and the classified classes.

2. **Error Handling**: The SDK provides error handling for API responses, ensuring that users can manage and respond to different error states effectively.

3. **Utilities**: Helper functions for encoding and decoding models to and from JSON format, ensuring seamless communication with the API.

## Installation

To install the Natural Language Classifier SDK, you can use [CocoaPods](https://cocoapods.org/):

1. Add the following line to your `Podfile`:

   ```ruby
   pod 'NaturalLanguageClassifier'
   ```

2. Run the following command in your terminal:

   ```bash
   pod install
   ```

3. Open the `.xcworkspace` file created by CocoaPods.

Alternatively, you can integrate the SDK manually by downloading the source code and adding it to your Xcode project.

## Usage Instructions

1. **Import the SDK**:
   To use the SDK, import it into your Swift file:

   ```swift
   import NaturalLanguageClassifier
   ```

2. **Initialize the Classifier**:
   Create an instance of the classifier using your IBM Watson credentials:

   ```swift
   let classifier = NaturalLanguageClassifier(apiKey: "YOUR_API_KEY", version: "2023-10-01")
   ```

3. **Classify Text**:
   Use the classifier to classify text by calling the appropriate method:

   ```swift
   classifier.classify(text: "Your text to classify") { response, error in
       if let error = error {
           print("Error classifying text: \(error.localizedDescription)")
           return
       }
       if let classification = response {
           print("Classified as: \(classification.topClass) with confidence: \(classification.confidence)")
       }
   }
   ```

4. **Handle Errors**:
   Implement error handling to manage API response errors effectively:

   ```swift
   if let error = error {
       // Handle error
   }
   ```

5. **Access Classifications**:
   Access the classification results to retrieve details such as class names and confidence scores.

```swift
if let classifications = classification.classes {
    for classifiedClass in classifications {
        print("Class: \(classifiedClass.className), Confidence: \(classifiedClass.confidence)")
    }
}
```

## Conclusion

This Natural Language Classifier SDK simplifies the process of integrating IBM Watson's natural language processing capabilities into your Swift applications. With easy installation and straightforward usage instructions, you can quickly classify text data and enhance your application's functionality. For additional information and advanced usage, refer to the official IBM Watson documentation.# Personality Insights SDK

The Personality Insights SDK allows users to analyze and extract personality traits from textual data using machine learning models. This SDK is designed for easy integration into applications, providing insights into user personality based on input text.

## Major Components

1. **Models**: The SDK includes various models that represent key concepts in personality insights, such as:
   - `Warning`: Represents warnings or errors that occur during processing.
   - `Profile`: Contains user personality profiles derived from analysis.
   - `Trait`: Represents individual traits that make up a user's personality.
   - `ContentItem`: Represents content items that can be analyzed.
   - `ConsumptionPreferences`: Represents preferences regarding consumption of content.

2. **Networking**: The SDK has built-in networking capabilities to communicate with the Personality Insights API. It handles authentication, sending requests, and processing responses.

3. **Utilities**: The SDK includes utility functions for JSON encoding/decoding, error handling, and data processing.

## Installation

### Swift Package Manager

To install the SDK using Swift Package Manager, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your/repo.git", from: "1.0.0")
]
```

### CocoaPods

If you are using CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'PersonalityInsights', '~> 1.0.0'
```

Then run `pod install` to install the SDK.

### Carthage

To integrate the SDK using Carthage, add the following line to your `Cartfile`:

```
github "your/repo" ~> 1.0.0
```

Then run `carthage update` to build the framework.

## Usage

Here is a simple example of how to use the SDK:

```swift
import PersonalityInsights

// Initialize the SDK
let personalityInsights = PersonalityInsights(apiKey: "YOUR_API_KEY")

// Analyze text for personality insights
let text = "Your input text goes here."
personalityInsights.analyze(text: text) { result, error in
    if let error = error {
        print("Error analyzing text: \(error)")
        return
    }
    
    if let result = result {
        // Process the personality insights
        print("Personality Insights: \(result)")
    }
}
```

### Configuration

You can configure the SDK with various parameters, such as service URLs and authentication methods. Refer to the documentation for detailed configuration options.

## Contributing

We welcome contributions to the Personality Insights SDK. Please fork the repository and submit a pull request with your changes.

## License

This SDK is licensed under the MIT License. See the LICENSE file for more details.

For more detailed documentation and examples, please refer to the [official documentation](https://link-to-documentation).# Swift SDK for IBM Watson Discovery

## Overview

The Swift SDK for IBM Watson Discovery provides a set of tools and APIs to interact with IBM's Watson Discovery service. This service allows developers to extract meaningful insights from unstructured data, enabling advanced search and analytics capabilities. The SDK includes various models and functions to handle different aspects of data management, including querying, document management, and environment handling.

## Key Features

- **Environment Management**: Create, update, and delete environments.
- **Collection Management**: Manage collections within an environment, including creating, updating, and deleting collections.
- **Document Management**: Add, update, delete, and retrieve documents from collections.
- **Query Capabilities**: Perform advanced queries to search through indexed documents with various filters and parameters.
- **Aggregation and Analytics**: Perform data aggregations to analyze data trends and patterns.

## Installation

To get started with the SDK, follow these installation instructions:

### Prerequisites

- Ensure you have Xcode installed on your machine.
- Swift 5.0 or higher is required.

### Installation Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/IBM/Swift-SDK.git
   cd Swift-SDK
   ```

2. **Install Dependencies**:
   Use [CocoaPods](https://cocoapods.org/) or [Swift Package Manager](https://swift.org/package-manager/) to manage dependencies.
   
   For CocoaPods, add the following to your `Podfile`:
   ```ruby
   pod 'WatsonDiscovery', '~> 1.0'
   ```

   Then run:
   ```bash
   pod install
   ```

   For Swift Package Manager, add the following to your `Package.swift` file:
   ```swift
   .package(url: "https://github.com/IBM/Swift-SDK.git", from: "1.0.0")
   ```

3. **Build the Project**:
   Open the project in Xcode, and build it to ensure all dependencies are correctly set up.

## Usage Instructions

Once you have installed the SDK, you can start using it in your Swift projects.

### Importing the SDK

To use the SDK in your Swift file, import the module:
```swift
import WatsonDiscovery
```

### Example Usage

Here’s a simple example demonstrating how to create a new environment and perform a query:

```swift
import WatsonDiscovery

// Initialize Discovery client
let discovery = Discovery(version: "2023-01-01", apiKey: "YOUR_API_KEY")

// Create a new environment
discovery.createEnvironment(name: "My Environment", description: "Environment for analytics") { response, error in
    guard let environment = response else {
        print("Error creating environment: \(error?.localizedDescription ?? "Unknown error")")
        return
    }
    print("Environment created with ID: \(environment.environmentID)")
}

// Query the collection
let query = "search_term"
discovery.query(environmentID: "YOUR_ENVIRONMENT_ID", collectionID: "YOUR_COLLECTION_ID", query: query) { response, error in
    guard let results = response else {
        print("Error querying collection: \(error?.localizedDescription ?? "Unknown error")")
        return
    }
    print("Query results: \(results)")
}
```

### Available Methods

For a complete list of available methods and their parameters, refer to the API documentation provided within the SDK.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For any issues or questions, please open an issue in the repository or contact IBM support.

---

This README provides a concise overview and instructions for installation and usage of the Swift SDK for IBM Watson Discovery, making it easier for developers to integrate and utilize its capabilities in their applications.# Swift SDK for Discovery API

A Swift SDK for interfacing with the Discovery API, providing a collection of models and functionalities to work with various aspects of data discovery including sources, documents, and enrichment features.

## Major Components

1. **Models**:
   - **SourceStatus**: Represents the status of a data source. It includes properties related to the source and conforms to various protocols for coding and debugging.
   - **TopHits**: Contains information about the top search results, including hits, aggregations, and other relevant data.
   - **NluEnrichmentFeatures**: Handles features related to Natural Language Understanding (NLU), including concepts, sentiment, and emotion analysis.
   - **SourceOptions**: Includes settings and options related to data sources, such as web crawl configurations and query filters.
   - **TokenDict**: Represents a token dictionary response, including various token types and statuses.

2. **Coding Keys**:
   - Each model has a set of coding keys that define how the properties are encoded and decoded when interacting with JSON data.

3. **Configuration Options**:
   - Various configuration options are available for customizing the behavior of the SDK, including how to handle data sources, crawl settings, and more.

## Installation

To install this SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/swift-sdk.git
   cd swift-sdk
   ```

2. **Install Dependencies**:
   If using CocoaPods or Swift Package Manager, ensure to add the dependencies specified in your `Podfile` or `Package.swift`.

3. **Build the SDK**:
   Open the project in Xcode and build the SDK.

## Usage

To utilize the SDK, import the necessary modules in your Swift files:

```swift
import DiscoverySDK
```

### Example: Fetching Source Status

Here's a simple example of how to fetch and display the source status:

```swift
let sourceStatus = SourceStatus()

sourceStatus.fetch { result in
    switch result {
    case .success(let status):
        print("Source Status: \(status)")
    case .failure(let error):
        print("Error fetching source status: \(error)")
    }
}
```

### Example: Using NLU Enrichment Features

You can also utilize NLU enrichment features to analyze text:

```swift
let enrichmentFeatures = NluEnrichmentFeatures()

enrichmentFeatures.analyze(text: "Your text here") { result in
    switch result {
    case .success(let features):
        print("Enrichment Features: \(features)")
    case .failure(let error):
        print("Error analyzing text: \(error)")
    }
}
```

## Contribution

Contributions are welcome! Please submit a pull request or open an issue for any improvements or bugs you encounter.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.# Swift SDK for Discovery API

This repository provides a Swift SDK for the Discovery API, which allows developers to interact with various services and retrieve information in a structured format. The SDK includes models and methods for making API requests, handling responses, and managing authentication.

## Major Components

### Models

The SDK defines several Swift models that represent the data structures used in the API:

1. **Training Example List**: Represents a list of training examples used to train the machine learning models.
2. **Query Evidence**: Contains details about the evidence related to queries made to the API.
3. **Source Schedule**: Represents the schedule and configuration for data sources.
4. **Credential Details**: Holds the necessary credentials to access the API securely.
5. **Document Management**: Includes models for managing documents, such as uploading and updating document details.
6. **Aggregation Results**: Models for handling the results of aggregated data queries.
7. **Notices**: Represents alerts or notifications related to the API's usage.

### Key Features

- **Custom String Convertible**: Each model conforms to `CustomStringConvertible` and `CustomDebugStringConvertible` protocols, allowing for easy string representation for debugging purposes.
- ** Codable Compliance**: The models are compliant with Swift's `Codable` protocol for seamless encoding and decoding of JSON data.
- **API Requests**: The SDK provides functionalities to make requests to the API and handle responses effectively.

## Installation

To use the Swift SDK for Discovery API in your project, follow these steps:

1. **Carthage Installation**:
   Add the following line to your `Cartfile`:

   ```plaintext
   github "YourGitHubUsername/swift-sdk"
   ```

2. **Run Carthage**:
   Open a terminal and run:

   ```bash
   carthage update --platform iOS
   ```

3. **Link the Framework**:
   After the build process completes, add the built framework to your Xcode project by dragging it into the "Frameworks" folder.

4. **Import the SDK**:
   In your Swift files, import the SDK with:

   ```swift
   import DiscoverySDK
   ```

## Usage

Once installed, you can utilize the SDK to interact with the Discovery API. Below are some basic examples of how to use the major features.

### Example: Retrieving Training Examples

```swift
let trainingExampleList = TrainingExampleList()
trainingExampleList.get { result in
    switch result {
    case .success(let examples):
        print("Training examples retrieved: \(examples)")
    case .failure(let error):
        print("Error retrieving training examples: \(error)")
    }
}
```

### Example: Authenticating with Credentials

```swift
let credentials = CredentialDetails(apiKey: "YOUR_API_KEY", username: "YOUR_USERNAME", password: "YOUR_PASSWORD")
credentials.authenticate { success in
    if success {
        print("Authentication successful!")
    } else {
        print("Authentication failed.")
    }
}
```

### Example: Querying for Evidence

```swift
let queryEvidence = QueryEvidence()
queryEvidence.performQuery { result in
    switch result {
    case .success(let evidence):
        print("Query evidence: \(evidence)")
    case .failure(let error):
        print("Error querying evidence: \(error)")
    }
}
```

## Conclusion

This Swift SDK provides a comprehensive way to interact with the Discovery API, making it easier for developers to manage training examples, queries, documents, and credentials. For more detailed documentation, please refer to the API documentation provided by the service. 

Feel free to contribute to the SDK by submitting issues or pull requests!# Swift SDK for Discovery API

This repository contains a Swift SDK for the Discovery API, designed to allow developers to integrate and utilize Discovery services in their applications efficiently. The SDK provides various models and functions to interact with the API, facilitating tasks such as searching, enriching data, and managing configurations.

## Major Components

### Models
The SDK includes several models that represent different entities in the Discovery API:

- **Filter**: Represents a filter for queries, encapsulating logic for coding keys and encoding/decoding.
- **DeleteConfigurationResponse**: Handles the response for delete configuration requests, including status and coding keys.
- **Field**: Represents a field in the Discovery API, with properties related to its type and name.
- **TrainingQuery**: A model for training queries that includes examples, filters, and natural language processing capabilities.
- **TrainingStatus**: Represents the status of a training operation, detailing attributes like total examples and notices.
- **Document Response Models**: Includes models for handling responses related to document operations, such as creating, deleting, and updating documents.
- **Enrichment Models**: Models for managing enrichment operations, including semantic roles and keywords.

### Utilities
The SDK provides utility functions to assist with encoding and decoding data, which are essential for interacting with the API.

## Installation

To use the Swift SDK for Discovery API, follow these installation steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/swift-sdk.git
   cd swift-sdk
   ```

2. **Install Dependencies**:
   Make sure to have [CocoaPods](https://cocoapods.org/) installed. Then run:
   ```bash
   pod install
   ```

3. **Open the Project**:
   Open the `.xcworkspace` file in Xcode:
   ```bash
   open swift-sdk.xcworkspace
   ```

## Usage Instructions

### Importing the SDK

To use the SDK in your Swift project, import it at the top of your Swift files:

```swift
import DiscoverySDK
```

### Example Usage

Here’s a basic example of how to utilize the SDK to create a new query:

```swift
// Create a new training query
let trainingQuery = TrainingQuery(queryID: "exampleID", naturalLanguage: "What is the latest news?", examples: [Example(...)])
    
// Perform the query
trainingQuery.execute { response, error in
    if let error = error {
        print("Error: \(error)")
    } else if let response = response {
        print("Response: \(response)")
    }
}
```

### Working with Filters

To apply filters in your queries:

```swift
let filter = Filter(condition: "status:active")
trainingQuery.filter = filter
```

### Handling Responses

The SDK provides models to handle responses from the API effectively. Use the appropriate model based on the API response you expect.

### Note

Make sure to refer to the official Discovery API documentation for specific API details and parameters that you can use with this SDK.

## Conclusion

This Swift SDK for Discovery API simplifies the integration of Discovery's powerful features into your Swift applications. By following the installation and usage instructions, you can quickly set up and start utilizing the Discovery API services in your projects.# Discovery SDK

The Discovery SDK is a Swift-based library designed for integrating with the Discovery API. The SDK provides functionality for managing various components such as environments, queries, expansions, normalizations, and document statuses.

## Major Components

### 1. **Models**
The SDK defines several models that represent different entities in the Discovery API. These include:
- **NormalizationOperation**: Handles the normalization of data.
- **Expansions**: Manages expansions used in queries.
- **QueryEntities**: Represents entities in a query context.
- **DocumentStatus**: Represents the status of documents processed in the API.
- **TrainingExample**: Represents examples used for training models.
- **NluEnrichmentCategories**: Defines categories for natural language understanding enrichments.
- **TokenDictRule**: Represents rules for token dictionary entries.

### 2. **Operations**
The SDK provides various operations for managing configurations:
- **Create, Update, Delete Operations**: For environments, gateways, collections, and documents.
- **Query Operations**: For retrieving metrics, training examples, and document statuses.

### 3. **Error Handling**
The SDK includes error handling mechanisms for managing various API responses and errors.

## Installation

To install the Discovery SDK, you will need to use [CocoaPods](https://cocoapods.org/) or [Carthage](https://github.com/Carthage/Carthage). Follow the instructions below based on your preferred dependency manager.

### CocoaPods
1. Add the following line to your Podfile:
   ```ruby
   pod 'DiscoverySDK'
   ```
2. Run `pod install` to install the SDK.

### Carthage
1. Add the following line to your Cartfile:
   ```
   github "your-repo/discovery-sdk"
   ```
2. Run `carthage update` to build the SDK.

## Usage

To use the Discovery SDK, follow these steps:

1. **Import the SDK**:
   In your Swift file, import the Discovery SDK:
   ```swift
   import DiscoverySDK
   ```

2. **Initialize the API Client**:
   Create an instance of the API client:
   ```swift
   let client = DiscoveryClient(apiKey: "YOUR_API_KEY")
   ```

3. **Perform Operations**:
   You can now utilize the operations provided by the SDK. For example, to create a new environment:
   ```swift
   let environment = Environment(name: "New Environment", description: "A test environment")
   client.createEnvironment(environment) { result in
       switch result {
       case .success(let response):
           print("Environment created: \(response)")
       case .failure(let error):
           print("Error creating environment: \(error.localizedDescription)")
       }
   }
   ```

4. **Error Handling**:
   Make sure to handle errors appropriately in your application by checking the result of your API calls.

## Contributing

Contributions to the Discovery SDK are welcome! Please submit a pull request or open an issue on GitHub for any improvements or bug fixes.

## License

This SDK is licensed under the MIT License. See the LICENSE file for more details.

---

By following the instructions above, you should be able to effectively install and use the Discovery SDK in your Swift applications.# Assistant SDK

The Assistant SDK enables developers to integrate IBM Watson Assistant functionalities into their applications. This README provides an overview of the major components of the SDK, installation instructions, and usage examples.

## Major Components

1. **Models**: The SDK includes a variety of models representing aspects of the Watson Assistant API, including:
   - **MessageRequest**: Handles input messages sent to the Assistant.
   - **MessageResponse**: Represents responses received from the Assistant.
   - **Log**: Captures logs for requests and responses to assist in debugging.

2. **Operations**: The SDK provides operations for:
   - Creating, updating, and deleting workspaces, intents, entities, examples, and dialog nodes.
   - Listing workspaces, intents, entities, synonyms, examples, and logs.
   - Managing user data and session configurations.

3. **Utilities**: Helper functions and properties are included to simplify common tasks, such as managing headers, handling responses, and accessing various properties of models.

## Installation

To install the Assistant SDK, you can use CocoaPods or Carthage. Below are instructions for both methods.

### CocoaPods

1. Add the following line to your Podfile:

   ```ruby
   pod 'AssistantSDK'
   ```

2. Run the following command to install the pod:

   ```bash
   pod install
   ```

### Carthage

1. Add the following line to your Cartfile:

   ```bash
   github "IBM/AssistantSDK"
   ```

2. Run the following command to build the framework:

   ```bash
   carthage update --platform iOS
   ```

## Usage

After installing the SDK, you can start using it in your application.

### Initializing the Assistant

```swift
import AssistantSDK

let assistant = Assistant(apiKey: "YOUR_API_KEY", serviceURL: "YOUR_SERVICE_URL")
```

### Sending a Message

To send a message to the Assistant and receive a response:

```swift
let messageRequest = MessageRequest(input: InputData(text: "Hello"))

assistant.message(workspaceID: "YOUR_WORKSPACE_ID", request: messageRequest) { response, error in
    if let error = error {
        print("Error: \(error)")
    } else if let response = response {
        print("Response: \(response.output.text)")
    }
}
```

### Managing Intents and Entities

You can create, update, or delete intents and entities as follows:

```swift
let newIntent = Intent(name: "greeting", description: "A greeting intent")

assistant.createIntent(workspaceID: "YOUR_WORKSPACE_ID", intent: newIntent) { response, error in
    // Handle response or error
}
```

### Logging

To log interactions with the Assistant, use the logging functionality:

```swift
let logRequest = LogRequest(/* Add log parameters */)

assistant.log(request: logRequest) { response, error in
    // Handle logging response or error
}
```

## Conclusion

The Assistant SDK provides a powerful way to integrate Watson Assistant into your applications. Follow the installation and usage instructions above to get started. For more detailed information about specific methods and models, refer to the official documentation.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.# Assistant SDK

The Assistant SDK is a Swift-based library designed to facilitate interaction with an AI assistant. This SDK provides various models and functions for managing entities, intents, and dialog nodes, allowing developers to create robust applications with conversational capabilities.

## Major Components

1. **Models**:
   - **Entities**: Represent concepts that the assistant can recognize and distinguish in user inputs.
   - **Intents**: Define the purpose of a user's input and help direct the conversation.
   - **Dialog Nodes**: Control the flow of the conversation based on user input and context.
   - **Suggestions**: Provide potential responses or actions that the assistant can take based on user queries.
   - **Pagination**: Manage the retrieval of large datasets in a manageable way.
   - **Counterexamples**: Help improve the assistant's understanding by providing examples of incorrect interpretations.

2. **Context Management**: 
   - The SDK includes methods to manage context, which is crucial for maintaining the state of the conversation and ensuring the assistant responds appropriately based on previous interactions.

3. **Utilities**: 
   - Helper functions for encoding and decoding various data structures, ensuring smooth data handling during API interactions.

## Installation

To install the Assistant SDK, follow these steps:

### Using CocoaPods

1. Add the following line to your Podfile:
   ```ruby
   pod 'AssistantSDK'
   ```

2. Run the following command in your terminal:
   ```bash
   pod install
   ```

### Using Carthage

1. Add the following line to your Cartfile:
   ```swift
   github "your-repo/AssistantSDK"
   ```

2. Run the following command in your terminal:
   ```bash
   carthage update
   ```

### Using Swift Package Manager

1. Add the package dependency to your `Package.swift` file:
   ```swift
   .package(url: "https://github.com/your-repo/AssistantSDK.git", from: "1.0.0")
   ```

2. Add the package to your target dependencies.

## Usage Instructions

### Example Initialization

To use the Assistant SDK, you first need to import the module and create an instance of the assistant:

```swift
import AssistantSDK

let assistant = Assistant()
```

### Managing Entities

You can create, update, and retrieve entities as follows:

```swift
// Create an entity
let newEntity = Entity(name: "ExampleEntity", values: ["Value1", "Value2"])
assistant.createEntity(entity: newEntity)

// Update an entity
newEntity.values.append("Value3")
assistant.updateEntity(entity: newEntity)

// Retrieve an entity
let retrievedEntity = assistant.getEntity(name: "ExampleEntity")
```

### Handling Intents

You can manage intents similarly:

```swift
// Create an intent
let newIntent = Intent(name: "ExampleIntent", examples: ["Example input"])
assistant.createIntent(intent: newIntent)

// Update an intent
newIntent.examples.append("Another example input")
assistant.updateIntent(intent: newIntent)

// Retrieve an intent
let retrievedIntent = assistant.getIntent(name: "ExampleIntent")
```

### Dialog Node Management

Managing dialog nodes involves creating and updating nodes based on user interactions:

```swift
// Create a dialog node
let dialogNode = DialogNode(title: "Example Node", conditions: "true")
assistant.createDialogNode(node: dialogNode)

// Update a dialog node
dialogNode.title = "Updated Node Title"
assistant.updateDialogNode(node: dialogNode)

// Retrieve a dialog node
let retrievedNode = assistant.getDialogNode(title: "Example Node")
```

### Pagination Handling

For handling large datasets, utilize pagination:

```swift
let paginatedResults = assistant.getEntities(pagination: Pagination(limit: 10, offset: 0))
```

## Conclusion

The Assistant SDK provides a comprehensive set of tools for building conversational AI applications. By leveraging the models and utilities provided, developers can create rich and interactive experiences for users. For more detailed documentation, please refer to the specific model and method documentation within the SDK.# Assistant SDK for Swift

This repository contains the Assistant SDK for Swift, which provides convenient access to the Assistant API. The SDK simplifies the process of integrating conversational AI capabilities into your Swift applications.

## Major Components

1. **Models**: The SDK includes various models that represent different entities and structures used in the Assistant API. Key models include:
   - `WorkspaceSystemSettingsDisambiguation`: Handles settings related to disambiguation in conversation flows.
   - `Context`: Represents the context of a conversation, including metadata and additional properties.
   - `UpdateExample`: Represents an update to an example used in training the Assistant.
   - `DialogNodeOutput`: Represents the output of a dialog node, including actions and responses.
   - `Intent`: Represents an intent that the Assistant can recognize and respond to.
   - `Pagination`: Handles pagination for responses when dealing with collections of intents, synonyms, or dialog nodes.
   - `LogMessage`: Represents log messages generated during the operation of the Assistant.

2. **CodingKeys**: Each model contains nested `CodingKeys` structures that define how properties map to JSON keys, allowing for easy encoding and decoding of instances to and from JSON format.

3. **Protocols**: The SDK implements various protocols, including `CustomStringConvertible` and `CustomDebugStringConvertible`, to provide meaningful string representations of the models for debugging and logging purposes.

4. **Decoding and Encoding**: The SDK provides methods to decode JSON responses from the Assistant API into Swift structures and to encode Swift structures back into JSON for requests.

## Installation

To install the Assistant SDK for Swift, you can use [CocoaPods](https://cocoapods.org/):

1. Add the following line to your Podfile:

   ```ruby
   pod 'AssistantSDK'
   ```

2. Run the following command to install the SDK:

   ```bash
   pod install
   ```

Alternatively, you can use [Carthage](https://github.com/Carthage/Carthage):

1. Add the following line to your Cartfile:

   ```swift
   github "YourGitHub/AssistantSDK"
   ```

2. Run the following command to build the SDK:

   ```bash
   carthage update --platform iOS
   ```

## Usage Instructions

1. Import the Assistant SDK in your Swift files:

   ```swift
   import AssistantSDK
   ```

2. Create an instance of the Assistant client and configure it with your credentials:

   ```swift
   let assistant = Assistant(apiKey: "YOUR_API_KEY")
   ```

3. Call methods on the Assistant client to interact with the API. For example, to send a message and receive a response:

   ```swift
   assistant.sendMessage("Hello, Assistant!") { response in
       print("Assistant response: \(response)")
   }
   ```

4. Utilize the models to manage intents, examples, and dialog nodes. For example, to create a new intent:

   ```swift
   let newIntent = Intent(intentName: "greet", examples: ["Hello", "Hi"])
   assistant.createIntent(newIntent) { result in
       switch result {
       case .success(let response):
           print("Intent created: \(response)")
       case .failure(let error):
           print("Error creating intent: \(error)")
       }
   }
   ```

5. Make use of pagination when dealing with large collections of items:

   ```swift
   assistant.listIntents(pageLimit: 10, includeCount: true) { result in
       switch result {
       case .success(let intents):
           print("Fetched intents: \(intents)")
       case .failure(let error):
           print("Error fetching intents: \(error)")
       }
   }
   ```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

By following these instructions, you should be able to set up and start using the Assistant SDK for Swift in your projects. If you encounter any issues, please refer to the documentation or open an issue in the repository for assistance.# Swift SDK for Watson Assistant

This repository provides a Swift SDK for integrating with IBM Watson Assistant, allowing developers to build conversational interfaces into their applications.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Code Structure](#code-structure)
- [Contributing](#contributing)
- [License](#license)

## Features
- Create, update, and delete intents and entities.
- Manage workspaces and sessions.
- Send messages to Watson Assistant and receive responses.
- Handle contextual information and maintain conversation state.

## Installation

To install the Swift SDK for Watson Assistant, follow these steps:

1. **Carthage (recommended)**:
   - Add the following line to your `Cartfile`:
     ```
     github "watson-developer-cloud/swift-sdk"
     ```
   - Run `carthage update` to build the framework.

2. **Swift Package Manager**:
   - Add the following dependency to your `Package.swift`:
     ```swift
     .package(url: "https://github.com/watson-developer-cloud/swift-sdk.git", from: "2.3.0")
     ```

3. **CocoaPods**:
   - Add the following line to your `Podfile`:
     ```ruby
     pod 'WatsonAssistantV1', '~> 2.3.0'
     ```
   - Run `pod install` to install the dependency.

## Usage

To use the SDK, follow the instructions below:

1. **Import the SDK**:
   ```swift
   import WatsonAssistantV1
   ```

2. **Initialize the Assistant**:
   ```swift
   let assistant = Assistant(version: "2021-06-14", apiKey: "<YOUR_API_KEY>")
   ```

3. **Create a Session**:
   ```swift
   assistant.createSession(assistantID: "<YOUR_ASSISTANT_ID>") { response, error in
       guard let sessionID = response?.sessionID else {
           print("Error creating session: \(error?.localizedDescription ?? "Unknown error")")
           return
       }
       print("Session created with ID: \(sessionID)")
   }
   ```

4. **Send a Message**:
   ```swift
   let messageInput = MessageInput(text: "Hello, Watson!")
   assistant.message(assistantID: "<YOUR_ASSISTANT_ID>", sessionID: "<YOUR_SESSION_ID>", input: messageInput) { response, error in
       if let response = response {
           print("Response: \(response.output.generic.first?.text ?? "No response")")
       } else {
           print("Error sending message: \(error?.localizedDescription ?? "Unknown error")")
       }
   }
   ```

5. **Handle Cleanup**:
   - Remember to delete the session when done:
   ```swift
   assistant.deleteSession(assistantID: "<YOUR_ASSISTANT_ID>", sessionID: "<YOUR_SESSION_ID>") { error in
       if let error = error {
           print("Error deleting session: \(error.localizedDescription)")
       } else {
           print("Session deleted successfully.")
       }
   }
   ```

## Code Structure

The main components of the SDK include:
- **Models**: Define the data structures used for requests and responses (e.g., `MessageInput`, `MessageResponse`, `Intent`, `Entity`).
- **Services**: Handle API calls for various functionalities like managing intents, entities, and sessions.
- **Utilities**: Helper functions for managing authentication, error handling, etc.

### Key Files
- `Assistant.swift`: Main class for interacting with Watson Assistant APIs.
- `MessageInput.swift`: Model for sending messages to Watson.
- `MessageResponse.swift`: Model for processing responses from Watson.
- `InsecureConnection.swift`: Handles SSL verification settings.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This SDK is licensed under the MIT License. See the `LICENSE` file for more details.

---

This README provides a clear structure for understanding the SDK, how to install it, and how to get started with using its features. Encourage users to explore the code and contribute to its development.# Assistant SDK

## Overview

The Assistant SDK provides a set of tools for interacting with AI assistants. This SDK allows developers to manage skills, entity recognition, dialog management, and more within their applications. The codebase includes models for handling various aspects of dialog nodes, runtime entities, user contexts, and session management. 

## Major Components

1. **Skills Management**:
   - **skills.modify**: Modify existing skills.
   - **skills.set**: Set skills for a specific context.
   - **skills.get**: Retrieve existing skills.

2. **Global Context Management**:
   - **global.modify**: Modify global contexts.
   - **global.set**: Set global context values.
   - **global.get**: Retrieve values from the global context.

3. **Runtime Entities**:
   - **entity.modify**: Modify runtime entities.
   - **entity.set**: Set values for runtime entities.
   - **entity.get**: Retrieve information about runtime entities.

4. **Dialog Management**:
   - **DialogNodeOutputOptionsElement**: Manage dialog node output options, including actions and responses.
   - **MessageResponseContext**: Provides context for messages, including skills and global attributes.

5. **Session Management**:
   - **SessionResponse**: Handles user sessions and maintains state across interactions.
   - **MessageRequest**: Facilitates message requests to the assistant, including intents and entities.

6. **Utilities**:
   - Various utility functions for encoding and decoding JSON data related to the assistant's responses and requests.

## Installation

To install the Assistant SDK, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/assistant-sdk.git
   cd assistant-sdk
   ```

2. **Install Dependencies**:
   Use [CocoaPods](https://cocoapods.org/) or [Carthage](https://github.com/Carthage/Carthage) to manage dependencies.
   - For CocoaPods, add the following line to your `Podfile`:
     ```ruby
     pod 'AssistantSDK'
     ```
   - For Carthage, add the following to your `Cartfile`:
     ```ogdl
     github "yourusername/assistant-sdk"
     ```

3. **Build the Project**:
   Run the following command to build the project:
   ```bash
   carthage update --platform iOS
   ```

## Usage

To use the Assistant SDK in your project, follow these steps:

1. **Import the SDK**:
   Make sure to import the SDK in your Swift files:
   ```swift
   import AssistantSDK
   ```

2. **Initialize the Assistant**:
   Create an instance of the assistant and configure it:
   ```swift
   let assistant = Assistant()
   assistant.initialize(apiKey: "YOUR_API_KEY")
   ```

3. **Manage Skills**:
   You can modify or retrieve skills:
   ```swift
   assistant.skills.set(skill: "greeting", value: "Hello, how can I assist you?")
   let greetingSkill = assistant.skills.get(skill: "greeting")
   ```

4. **Handle Dialogs**:
   Create a dialog and manage responses:
   ```swift
   let responseContext = MessageResponseContext()
   responseContext.skills.modify(skill: "greeting")
   ```

5. **Manage Sessions**:
   Handle user sessions:
   ```swift
   let sessionResponse = SessionResponse()
   sessionResponse.sessionID.set(value: "12345")
   ```

## Contributing

If you'd like to contribute to the Assistant SDK, please fork the repository and submit a pull request. Ensure that your code is well-tested and follows the project's coding standards.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 

---

Feel free to further customize the README based on specific implementation details, additional features, or examples pertinent to your particular project.# README.md

## Overview

This repository contains a Swift framework for handling network requests using the RestKit library, as well as the Starscream library for WebSocket communication. The framework supports various authentication methods, including IAM (Identity Access Management) and API Key authentication, and provides a structure for managing tokens and requests.

## Major Components

### 1. IAM Authentication

- **IAMToken**: Manages the IAM tokens used for authentication, including methods for retrieving, refreshing, and storing tokens.
- **IAMAuthentication**: Handles the authentication process, including requesting and refreshing tokens.

### 2. API Key Authentication

- **APIKeyAuthentication**: Implements authentication using API keys. It defines the structure for managing API key locations and configurations.

### 3. Basic Authentication

- **BasicAuthentication**: Provides methods for authenticating requests with basic authentication credentials.

### 4. Request and Response Handling

- **Request**: Represents a network request and includes methods for sending requests and handling responses.
- **Response**: Represents the response received from the network request, including handling success and error responses.

### 5. WebSocket Communication

- **WebSocket**: Utilizes the Starscream library to manage WebSocket connections, enabling real-time communication with the server.

## Installation

To install the framework, follow these steps:

### Using CocoaPods

1. Add the following line to your `Podfile`:

   ```ruby
   pod 'YourFrameworkName'
   ```

2. Run `pod install` to install the dependencies.

### Using Carthage

1. Add the following line to your `Cartfile`:

   ```
   github "YourRepositoryName"
   ```

2. Run `carthage update` to install the dependencies.

### Manual Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/yourrepository.git
   ```

2. Drag the `YourFrameworkName.xcodeproj` into your Xcode project.

3. Link the framework to your project and ensure you have the necessary permissions for network access.

## Usage Instructions

### IAM Authentication

To use IAM authentication, initialize the `IAMAuthentication` class and request a token:

```swift
let iamAuth = IAMAuthentication()
iamAuth.requestToken { (token, error) in
    if let error = error {
        print("Error: \(error)")
    } else if let token = token {
        print("Received token: \(token.accessToken)")
    }
}
```

### API Key Authentication

For API key authentication, initialize the `APIKeyAuthentication` class and use the API key:

```swift
let apiKeyAuth = APIKeyAuthentication(apiKey: "YOUR_API_KEY")
apiKeyAuth.authenticate(request: yourRequest)
```

### Basic Authentication

For basic authentication, use the `BasicAuthentication` class and provide your credentials:

```swift
let basicAuth = BasicAuthentication(username: "yourUsername", password: "yourPassword")
basicAuth.authenticate(request: yourRequest)
```

### WebSocket Communication

To establish a WebSocket connection, initialize the `WebSocket` class and connect:

```swift
let webSocket = WebSocket(url: URL(string: "wss://yourwebsocketurl")!)
webSocket.connect()

webSocket.onText = { text in
    print("Received text: \(text)")
}

webSocket.onDisconnect = { error in
    print("Disconnected: \(error?.localizedDescription ?? "No error")")
}
```

## License

This project is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for details.

---

*Make sure to replace placeholders like `YourFrameworkName`, `YourRepositoryName`, and `YOUR_API_KEY` with actual values relevant to your project.*# Opus Codec Implementation

## Overview
The Opus Codec is designed for interactive speech and audio transmission over the Internet. This implementation provides functions for encoding and decoding audio data using the Opus codec, supporting a variety of applications including VoIP, music streaming, and real-time communication.

## Major Components
1. **Opus Encoder**: 
   - The encoder state is created using `opus_encoder_create()` and can be initialized with `opus_encoder_init()`.
   - Audio frames can be encoded using `opus_encode()` or `opus_encode_float()`.
   - Various configurations can be set via `opus_encoder_ctl()` for bitrate, complexity, and signal type.

2. **Opus Decoder**: 
   - Decoder state is created using `opus_decoder_create()` and initialized with `opus_decoder_init()`.
   - The decoder uses `opus_decode()` or `opus_decode_float()` to decode packets back into audio frames.
   - The decoder can be configured similarly to the encoder using `opus_decoder_ctl()`.

3. **Multistream Support**: 
   - Functions for handling multiple Opus streams in a single packet are provided.
   - Use `opus_multistream_encoder_create()` and `opus_multistream_decoder_create()` for encoding and decoding respectively.
   - Additional control functions for multistream operations are available via `opus_multistream_encoder_ctl()` and `opus_multistream_decoder_ctl()`.

4. **Repacketization**: 
   - The repacketizer allows merging multiple Opus packets into a single packet or splitting them.
   - Use `opus_repacketizer_cat()` to add packets and `opus_repacketizer_out()` to retrieve the merged packets.

## Installation
To use the Opus codec implementation, follow these steps:

1. **Clone the Repository**:
   ```
   git clone https://github.com/YOUR_REPOSITORY_URL.git
   cd YOUR_REPOSITORY_NAME
   ```

2. **Build the Library**:
   - Ensure you have the necessary build tools installed (e.g., CMake, make).
   - Run the build command:
   ```
   mkdir build
   cd build
   cmake ..
   make
   ```

3. **Linking the Library**:
   - After building, link the library to your project. Include the header files and link against the built library in your build configuration.

## Usage Instructions

### Encoding Audio
1. Create and initialize the encoder:
   ```c
   OpusEncoder *encoder;
   int error;
   encoder = opus_encoder_create(48000, 1, OPUS_APPLICATION_AUDIO, &error);
   ```

2. Encode an audio frame:
   ```c
   opus_int16 audio_frame[480]; // example audio frame
   unsigned char encoded_data[4000]; // buffer for encoded data
   int encoded_length = opus_encode(encoder, audio_frame, 480, encoded_data, sizeof(encoded_data));
   ```

### Decoding Audio
1. Create and initialize the decoder:
   ```c
   OpusDecoder *decoder;
   int error;
   decoder = opus_decoder_create(48000, 1, &error);
   ```

2. Decode an encoded packet:
   ```c
   unsigned char encoded_data[4000]; // your encoded data
   opus_int16 decoded_audio[480]; // buffer for decoded audio
   int decoded_length = opus_decode(decoder, encoded_data, encoded_length, decoded_audio, sizeof(decoded_audio), 0);
   ```

### Multistream Encoding and Decoding
1. Create a multistream encoder:
   ```c
   OpusMSEncoder *ms_encoder;
   unsigned char mapping[2] = {0, 1}; // mapping for two streams
   ms_encoder = opus_multistream_encoder_create(48000, 2, 2, 0, mapping, OPUS_APPLICATION_AUDIO, &error);
   ```

2. Multistream encode:
   ```c
   int ms_encoded_length = opus_multistream_encode(ms_encoder, audio_frame, 480, encoded_data, sizeof(encoded_data));
   ```

3. Create a multistream decoder:
   ```c
   OpusMSDecoder *ms_decoder;
   ms_decoder = opus_multistream_decoder_create(48000, 2, 2, 0, mapping, &error);
   ```

4. Multistream decode:
   ```c
   int ms_decoded_length = opus_multistream_decode(ms_decoder, encoded_data, ms_encoded_length, decoded_audio, 480, 0);
   ```

## Conclusion
This Opus codec implementation provides a robust solution for encoding and decoding audio data with support for multistreams. Utilize the provided functions to integrate Opus into your audio applications effectively. For further details, refer to the extensive comments and documentation in the code.# Natural Language Classifier V1

This repository contains the implementation of the Natural Language Classifier (NLC) V1, which is part of IBM Watson's suite of AI services. The NLC service allows developers to build applications that can classify text into categories based on training data.

## Major Components

### 1. Type Definitions

The code defines various Swift types for handling vectors of different dimensions (2, 3, and 4) for both floating-point and integer types. This allows for easy manipulation of numerical data commonly used in machine learning applications.

### 2. Swift Attribute Macros

Several macros are defined to handle Swift attributes such as `objc_runtime_name`, `swift_name`, and others. These macros help ensure that the Swift interface is correctly mapped to Objective-C and provide additional functionality like availability checks and deprecation warnings.

### 3. Framework Module Declaration

The code includes declarations for framework modules like `NaturalLanguageClassifierV1`, `AssistantV2`, and `Starscream`. Each module has an umbrella header that exports the necessary public headers for use in an application.

### 4. PList Configuration

Property list (plist) files are included to define metadata for the framework, such as the bundle identifier, versioning information, and supported platforms.

## Installation

To install the Natural Language Classifier, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/NaturalLanguageClassifierV1.git
   cd NaturalLanguageClassifierV1
   ```

2. Integrate the framework into your Xcode project:
   - Drag and drop the `NaturalLanguageClassifierV1.xcodeproj` file into your Xcode project.
   - In your project's settings, add `NaturalLanguageClassifierV1.framework` to the "Link Binary With Libraries" section.

3. Install dependencies:
   - Make sure you have CocoaPods installed.
   - Create a `Podfile` and include the necessary pods, then run `pod install`.

## Usage

To use the Natural Language Classifier in your application, follow these steps:

1. Import the framework:
   ```swift
   import NaturalLanguageClassifierV1
   ```

2. Create an instance of the classifier:
   ```swift
   let classifier = NaturalLanguageClassifierV1(apiKey: "your_api_key")
   ```

3. Train the classifier with your datasets:
   ```swift
   classifier.train(trainingData: yourTrainingData) { response in
       // Handle the response
   }
   ```

4. Classify text using the trained classifier:
   ```swift
   classifier.classify(text: "Your text here") { response in
       // Handle the classification response
   }
   ```

5. Handle any errors that may occur during the process.

## Conclusion

The Natural Language Classifier V1 provides a robust framework for building applications that require text classification. By following the installation and usage instructions, developers can quickly integrate and utilize the capabilities of this service in their projects. For more details, please refer to the official IBM Watson documentation.