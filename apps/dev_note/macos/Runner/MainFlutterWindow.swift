import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    flutterViewController.backgroundColor = .clear
    
    // Natywne ustawienie rozmiaru okna na 1440x900
    let windowSize = NSSize(width: 1440, height: 900)
    self.setContentSize(windowSize)
    
    // Centrowanie okna na ekranie
    if let screen = NSScreen.main {
      let screenFrame = screen.visibleFrame
      let windowFrame = NSRect(
        x: screenFrame.midX - windowSize.width / 1.5,
        y: screenFrame.midY - windowSize.height / 1.5,
        width: windowSize.width,
        height: windowSize.height
      )
      self.minSize = NSSize(width: 1366, height: 768)

      self.setFrame(windowFrame, display: true)
    }
    
    self.contentViewController = flutterViewController
    
    // Tylko podstawowe ustawienia dla przezroczystości
    self.isOpaque = false
    self.backgroundColor = NSColor.clear
    
    // Natywne ustawienia Swift aby ukryć pasek nawigacji
    self.styleMask.insert(.fullSizeContentView)  // Pełny rozmiar zawartości
    self.titlebarAppearsTransparent = true        // Przezroczysty pasek tytułu
    self.titleVisibility = .hidden                // Ukryj tytuł
    self.standardWindowButton(.closeButton)?.isHidden = false      // Pokaż przycisk zamknięcia
    self.standardWindowButton(.miniaturizeButton)?.isHidden = false // Pokaż przycisk minimalizacji
    self.standardWindowButton(.zoomButton)?.isHidden = false        // Pokaż przycisk powiększenia
    
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
