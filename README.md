# Flutter Challenge - Francesco La Forgia

This project was created for the challenge requested by Deliveristo for the open position for Flutter Developer

## Getting Started

For starting the project there's no configuration need.
Just run the following commands:
1. `flutter pub get`
2. `flutter run`
   this will automatically pick the first available device, 
   add `-d $deviceId` for a specific one

## Technical info

The app is based on a mix of mvvm and clean architecture (of the Uncle Bob, the uncle of all programmers).

The main packages are used all serves a purpose as follows:

- [flutter_displaymode](https://pub.dev/packages/flutter_displaymode): Enables the developer to change the refresh rate and resolution of the device (Used only for android, iOS, MacOS, Web, Linux, and Windows automatically supports high refresh rate)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): Reactive state management, my favourite
- [go_router](https://pub.dev/packages/go_router): Routing powered by google, safest and fastest choice for a clean and efficient routing for all platform
- [dio](https://pub.dev/packages/dio): Networking package, used by everyone for it's ease of use
- [slang](https://pub.dev/packages/slang): Localization solution, highly maintained, my favourite
- [json_annotation](https://pub.dev/packages/json_annotation): Json serialization and deserialization, used for easily generating models that needs it
- [lottie](https://pub.dev/packages/lottie): After effects animation renderer

All the dev-dependencies are the ones needed to build and lint the app.

## E2E - Testing

- No breed selected, getting a random image
    - Expected Behavior: Error: Select a breed
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- No breed selected, getting all images
    - Expected Behavior: Error: Select a breed
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- Breed selected, getting a random image
    - Expected Behavior: Push new page, get image
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- Breed selected, getting all images
    - Expected Behavior: Push new page, get images
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- Breed and Sub-breed selected, getting a random image
    - Expected Behavior: Push new page, get image
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- Breed and Sub-breed selected, getting all images
    - Expected Behavior: Push new page, get images
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- No network
    - Expected Behavior: Error page with retry
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- Results page, no network
    - Expected Behavior: Error page with retry
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)
- Results page, wrong breed
    - Expected Behavior: Error page with retry
      ![](https://github.com/feduke-nukem/animated_glitch/assets/72284940/979b98b9-ea21-476e-92c4-cd01e5cecd4f)