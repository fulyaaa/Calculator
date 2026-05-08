# Calculator 📱

A functional calculator project developed while learning Swift. It focuses on core UIKit elements, basic state management, and simple arithmetic logic.

## ✨ Features
- **Basic Operations:** Addition, subtraction, multiplication, and division.
- **Advanced Logic:** Includes modulus (%) and sign change (+/-) functions.
- **Smart Formatting:** Uses `NumberFormatter` for localized decimal separators (comma/point) and digit grouping.

## 🛠 Technologies
- **Language:** Swift 5.0+
- **Framework:** UIKit
- **Design Pattern:** MVC

## 📸 Preview

| Main Screen | Operations |
| :---: | :---: |
| ![Screen1](https://your-image-link-here.com) | ![Screen2](https://your-image-link-here.com) |

## 💻 Code Highlight: Formatted Display
The app uses a custom `NumberFormatter` to ensure a professional look for decimal numbers:

```swift
private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    formatter.numberStyle = .decimal
    return formatter
}()
```

---
Created by [Fulya Akan]
