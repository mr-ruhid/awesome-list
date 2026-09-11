<div align="center">
  <!-- Replace with your actual AwesomeList logo if available -->
  <img src="https://via.placeholder.com/250x100?text=AwesomeList+Logo" alt="AwesomeList Logo" width="250"/>
  <h1>🌟 AwesomeList</h1>
  <p><b>A modern Flutter application that curates and categorizes the most useful links and resources from around the web.</b></p>

<br><br>

  <p>
    <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"></a>
    <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"></a>
  </p>
</div>

<br>

## 📌 About the Project

**AwesomeList** is a collaborative platform built with Flutter, designed to gather the best links and resources on various topics in one easily accessible application. Categories and subcategories are meticulously organized, allowing users to find what they need quickly.

The project welcomes contributions from everyone. If you have a valuable resource, you can easily add it to the database!

---

## ✨ Key Features

| Feature | Description |
|:---|:---|
| 🗂️ **Categorized Links** | Resources are neatly organized into intuitive categories and subcategories (managed in `lib/screen`). |
| 🤝 **Community Driven** | Anyone can contribute by submitting their favorite links via a simple JSON format. |
| 🔍 **Searchable Tags** | Each entry includes tags, making it easy to find specific tools or information. |
| 🎨 **Modern UI** | Built with Flutter for a smooth, responsive, and visually appealing experience across devices. |

---

## 🛠️ Tech Stack

| Category | Technology |
|:---|:---|
| **Framework** | Flutter (Dart) |
| **Data Structure** | JSON |
| **(Add other packages used)** | E.g., `url_launcher`, `shared_preferences`, etc. |

---

## 📂 Project Structure

\```text
AwesomeList/
├── lib/
│   ├── screen/          <-- Categories and subcategories are managed here
│   ├── models/
│   ├── widgets/
│   └── main.dart
├── assets/
│   └── (Images, fonts, etc.)
├── pubspec.yaml
└── README.md
\```

## 🙋‍♂️ How to Contribute

We encourage everyone to add useful links to the AwesomeList! Please follow these simple steps to contribute:

### 1. Identify the Category
First, check the `lib/screen` folder to find the appropriate `sub_category_id` and `sub_category_name` for your link.

### 2. Prepare the Data
Format your resource information using this JSON structure:

\```json
{
  "sub_category_id": "id_from_lib_screen",
  "sub_category_name": "Name from lib/screen",
  "items": [
    {
      "id": "your_unique_id",
      "title": "Resource Name",
      "description": "Brief description of the resource.",
      "url": "https://your-link.com",
      "image_url": "https://your-link.com/image.png",
      "tags": ["tag1", "tag2"]
    }
  ]
}
\```

### 3. Submit
Choose one of the following ways to submit your entry:

* **Method 1 (Preferred):** Paste your JSON block into our [AwesomeList Submission Doc](https://docs.google.com/document/d/166BDgrbDCe-QSNrPWbgUODkGDtrhtMo_uyjogg4039Q/edit?usp=sharing&authuser=3).
* **Method 2:** Email your JSON snippet to `ruhidjavadoff@gmail.com` with the subject "AwesomeList - New Link".

## 🖥️ How to Build

### 1. Install Dependencies
\```bash
flutter pub get
\```

### 2. Run the App
\```bash
flutter run
\```

## 📄 License
License: © 2026 AwesomeList. All rights reserved.

## 👨‍💻 Author
Ruhid Javadov (Mr-Ruhid)

* GitHub: [mr-ruhid](https://github.com/mr-ruhid)

<div align="center">
  <h2>🌟 Support & Donate</h2>
  <p>If you appreciate the time and effort put into building this app, consider supporting the development. Your motivation keeps this project alive!</p>

  <br>

  <!-- Main Badges -->
  <a href="https://kofe.al/@ruhidjavadoff">
    <img src="https://kofe.al/assets/images/kofeal-logo.svg" height="40" alt="Support on Kofe.al" style="background-color: white; padding: 5px; border-radius: 5px;">
  </a>
  &nbsp;&nbsp;
  <a href="https://www.paypal.com/paypalme/ruhidjavadoff">
    <img src="https://img.shields.io/badge/Donate%20via-PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="Donate via PayPal" height="40">
  </a>

<br><br>

  <!-- Additional Links in a clean list format -->
  <p align="center">
    ☕ <b>Kofe.al:</b> <a href="https://kofe.al/@ruhidjavadoff">@ruhidjavadoff</a> <br>
    🍵 <b>Çayvoy:</b> <a href="https://cayvoy.com/donate/ruhid4715">ruhid4715</a> <br>
    💳 <b>PayPal:</b> <code>ruhidjavadoff@gmail.com</code> <br>
    🪙 <b>Crypto (USDT - BNB Smart Chain):</b> <br>
    <code>0x9a4AD41762D6B07B8C266b312Cf0dBe31FAd890c</code>
  </p>
</div>
