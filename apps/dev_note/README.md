# dev_note

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Przezroczyste okno z blur tła na macOS

### Przegląd

Aplikacja implementuje przezroczyste okno na macOS z efektem blur tła za oknem. Używa natywnych macOS API (`NSVisualEffectView`) do osiągnięcia profesjonalnego wyglądu podobnego do systemowych aplikacji Apple.

### Funkcjonalności

- ✅ **Przezroczyste tło okna** - widać desktop za oknem
- ✅ **Efekt blur tła** - tapeta/desktop jest rozmyta
- ✅ **Stabilna aplikacja** - bez crashy
- ✅ **Widoczne widgety** - na rozmytym tle
- ✅ **Natywny blur macOS** - używając `NSVisualEffectView`

### Architektura

```
┌─────────────────────────────────────┐
│           MainFlutterWindow         │
│  ┌─────────────────────────────────┐ │
│  │      NSVisualEffectView         │ │ ← Blur tła
│  │      (Material: .hudWindow)     │ │
│  ┌─────────────────────────────────┐ │
│  │     FlutterViewController       │ │ ← Zawartość Flutter
│  │     (backgroundColor: .clear)   │ │
│  └─────────────────────────────────┘ │
└─────────────────────────────────────┘
```

### Implementacja

#### 1. MainFlutterWindow.swift

```swift
import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    flutterViewController.backgroundColor = .clear
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    
    // Tylko podstawowe ustawienia dla przezroczystości
    self.isOpaque = false
    self.backgroundColor = NSColor.clear
    
    // Dodanie NSVisualEffectView dla blur tła
    self.setupVisualEffectView()

    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()
  }
  
  private func setupVisualEffectView() {
    // Tworzenie NSVisualEffectView dla blur tła
    let visualEffectView = NSVisualEffectView()
    visualEffectView.state = .active
    visualEffectView.material = .hudWindow  // Najlepszy blur
    
    // Ustawienie rozmiaru na całe okno
    visualEffectView.frame = self.contentView?.bounds ?? NSRect.zero
    visualEffectView.autoresizingMask = [.width, .height]
    
    // Dodanie do contentView pod Flutter content
    if let contentView = self.contentView {
      contentView.addSubview(visualEffectView, positioned: .below, relativeTo: nil)
    }
  }
}
```

#### 2. main.dart

```dart
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1366, 768),
    center: true,
    skipTaskbar: false,
    windowButtonVisibility: false,
    title: '',
    titleBarStyle: TitleBarStyle.hidden,
  );
  
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0x00000000), // Przezroczyste tło
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

### Konfiguracja

#### Pliki konfiguracyjne

1. **macos/Runner/MainFlutterWindow.swift** - główna implementacja blur
2. **macos/Runner/Base.lproj/MainMenu.xib** - styl okna
3. **macos/Runner/DebugProfile.entitlements** - uprawnienia debug
4. **macos/Runner/Release.entitlements** - uprawnienia release
5. **macos/Runner/Info.plist** - ustawienia aplikacji

#### Ustawienia okna

- `isOpaque = false` - okno nie jest nieprzezroczyste
- `backgroundColor = NSColor.clear` - przezroczyste tło okna
- `titleBarStyle: TitleBarStyle.hidden` - ukryty pasek tytułu
- `backgroundColor: Color(0x00000000)` - przezroczyste tło Flutter

### Dostosowywanie blur

#### Materiały blur (NSVisualEffectView.material)

```swift
// Najlepszy blur (aktualny)
visualEffectView.material = .hudWindow

// Lżejszy blur
visualEffectView.material = .titlebar

// Średni blur
visualEffectView.material = .selection

// Delikatny blur
visualEffectView.material = .menu

// Systemowy blur
visualEffectView.material = .systemThick
```

#### Stany blur (NSVisualEffectView.state)

```swift
// Najsilniejszy blur (aktualny)
visualEffectView.state = .active

// Słabszy blur
visualEffectView.state = .inactive

// Blur w tle
visualEffectView.state = .followsWindowActiveState
```

#### Pozycjonowanie

```swift
// Pod wszystkimi widokami (aktualne)
contentView.addSubview(visualEffectView, positioned: .below, relativeTo: nil)

// Nad wszystkimi widokami
contentView.addSubview(visualEffectView, positioned: .above, relativeTo: nil)

// Pod konkretnym widokiem
contentView.addSubview(visualEffectView, positioned: .below, relativeTo: flutterView)
```

### Rozwiązywanie problemów

#### Aplikacja się zamyka

1. **Sprawdź pliki .entitlements** - upewnij się, że sandbox jest włączony
2. **Sprawdź MainFlutterWindow.swift** - upewnij się, że kod jest poprawny
3. **Sprawdź MainMenu.xib** - upewnij się, że `titled="YES"`

#### Blur nie działa

1. **Sprawdź materiały** - spróbuj `.titlebar` zamiast `.hudWindow`
2. **Sprawdź stany** - spróbuj `.inactive` zamiast `.active`
3. **Sprawdź pozycjonowanie** - upewnij się, że `.below`

#### Wydajność

1. **Użyj .hudWindow** - najlepszy balans między jakością a wydajnością
2. **Unikaj .systemThick** - może być wolniejszy
3. **Sprawdź alphaValue** - niższe wartości = lepsza wydajność

### Wymagania systemowe

- **macOS**: 10.14+ (Mojave)
- **Flutter**: 3.0.0+
- **Xcode**: 12.0+
- **Swift**: 5.0+

### Źródła

- [Zach Waugh - SwiftUI Blurred Window Background](https://zachwaugh.com/posts/swiftui-blurred-window-background-macos)
- [Apple Developer - NSVisualEffectView](https://developer.apple.com/documentation/appkit/nsvisualeffectview)
- [Flutter Desktop](https://docs.flutter.dev/desktop)

### Licencja

Ten projekt jest na licencji MIT. Zobacz plik LICENSE dla szczegółów.

## Implementacja na Windows

### Przegląd

Na Windows można osiągnąć podobny efekt blur tła używając DWM (Desktop Window Manager) API. Implementacja jest bardziej złożona niż na macOS, ale daje podobne rezultaty.

### Funkcjonalności

- ✅ **Przezroczyste tło okna** - widać desktop za oknem
- ✅ **Efekt blur tła** - używając DWM API (Windows 7+)
- ✅ **Przezroczystość okna** - używając SetLayeredWindowAttributes
- ✅ **Rozmiar okna** - 1440x900 (można dostosować)

### Architektura Windows

```
┌─────────────────────────────────────┐
│           FlutterWindow             │
│  ┌─────────────────────────────────┐ │
│  │      DWM Blur Behind           │ │ ← Blur tła (DWM API)
│  │      (DwmEnableBlurBehind)     │ │
│  ┌─────────────────────────────────┐ │
│  │     FlutterViewController       │ │ ← Zawartość Flutter
│  │     (Layered Window)           │ │
│  └─────────────────────────────────┘ │
└─────────────────────────────────────┘
```

### Implementacja Windows

#### 1. main.cpp

```cpp
#include <dwmapi.h>

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  
  // ... inicjalizacja ...
  
  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1440, 900);  // Rozmiar okna
  if (!window.Create(L"dev_note", origin, size)) {
    return EXIT_FAILURE;
  }
  
  // Włączanie blur tła za oknem używając DWM API
  DWM_BLURBEHIND bb = {0};
  bb.dwFlags = DWM_BB_ENABLE;
  bb.fEnable = true;
  
  // Próba włączenia blur tła (Windows 7+)
  HRESULT hr = DwmEnableBlurBehind(window.GetHandle(), &bb);
  if (SUCCEEDED(hr)) {
    // Blur tła został włączony pomyślnie
  }
  
  // Ustawienie przezroczystości okna (Windows 2000+)
  SetLayeredWindowAttributes(window.GetHandle(), 0, 230, LWA_ALPHA); // 230/255 = ~90%
  
  // ... reszta kodu ...
}
```

#### 2. CMakeLists.txt

```cmake
# Dodanie biblioteki DWM
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
```

### Konfiguracja Windows

#### Pliki konfiguracyjne

1. **windows/runner/main.cpp** - główna implementacja blur
2. **windows/runner/CMakeLists.txt** - biblioteki systemowe
3. **windows/runner/runner.exe.manifest** - manifest aplikacji

#### Ustawienia okna

- `DwmEnableBlurBehind()` - blur tła za oknem
- `SetLayeredWindowAttributes()` - przezroczystość okna
- `size(1440, 900)` - rozmiar okna

### Dostosowywanie blur na Windows

#### Intensywność blur

```cpp
// Różne poziomy przezroczystości
SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA); // 100% nieprzezroczystości
SetLayeredWindowAttributes(hwnd, 0, 200, LWA_ALPHA); // 78% nieprzezroczystości
SetLayeredWindowAttributes(hwnd, 0, 150, LWA_ALPHA); // 59% nieprzezroczystości
```

#### Rozmiary okna

```cpp
// Różne rozmiary okna
Win32Window::Size size(1366, 768);   // Laptop
Win32Window::Size size(1440, 900);   // Aktualny
Win32Window::Size size(1920, 1080);  // Full HD
Win32Window::Size size(2560, 1440);  // 2K
```

### Rozwiązywanie problemów na Windows

#### Blur nie działa

1. **Sprawdź wersję Windows** - DWM wymaga Windows 7+
2. **Sprawdź biblioteki** - upewnij się, że `dwmapi.lib` jest dodane
3. **Sprawdź uprawnienia** - może wymagać uprawnień administratora

#### Aplikacja się nie buduje

1. **Sprawdź CMakeLists.txt** - upewnij się, że `dwmapi.lib` jest dodane
2. **Sprawdź include'y** - upewnij się, że `<dwmapi.h>` jest dodane
3. **Sprawdź wersję Visual Studio** - może wymagać nowszej wersji

#### Wydajność

1. **Użyj LWA_ALPHA** - lepsza wydajność niż inne metody
2. **Unikaj częstych zmian** - blur może być kosztowny
3. **Sprawdź hardware acceleration** - może być wymagane

### Wymagania systemowe Windows

- **Windows**: 7+ (dla DWM blur)
- **Visual Studio**: 2019+ (dla C++17)
- **CMake**: 3.14+
- **Flutter**: 3.0.0+

### Różnice między macOS a Windows

| Funkcjonalność | macOS | Windows |
|----------------|-------|---------|
| **Blur tła** | `NSVisualEffectView` | `DwmEnableBlurBehind` |
| **Przezroczystość** | `backgroundColor = .clear` | `SetLayeredWindowAttributes` |
| **Stabilność** | Wysoka | Średnia |
| **Implementacja** | Prosta | Złożona |
| **Wymagania** | macOS 10.14+ | Windows 7+ |

### Źródła Windows

- [Microsoft - DWM API](https://docs.microsoft.com/en-us/windows/win32/dwm/dwm-overview)
- [Microsoft - SetLayeredWindowAttributes](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setlayeredwindowattributes)
- [Flutter Desktop Windows](https://docs.flutter.dev/desktop#windows)
