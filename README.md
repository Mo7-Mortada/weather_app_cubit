# 🌤️ Weather App - Flutter Cubit

[English](#english-version) | [العربية](#النسخة-العربية)

---

## English Version <a name="english-version"></a>

A professional weather application built with **Flutter**, following Clean Architecture principles and using **Cubit** for state management. The app features a dynamic coloring system that updates the UI theme based on the current weather status.

### ✨ Key Features
* **🔍 Search:** Search for any city worldwide to get real-time weather data.
* **🎨 Dynamic Theme:** The entire app theme (AppBar, Progress Indicator, etc.) changes according to the weather (Sunny, Cloudy, Rainy, etc.).
* **🛡️ Error Handling:** * Detects "No Internet Connection".
    * Handles "Connection Timeout".
    * Alerts for "City Not Found".
* **🔄 Retry Mechanism:** A built-in retry button for technical connection errors.

### 🛠️ Tech Stack
* **Flutter & Bloc/Cubit**
* **Dio** (HTTP Client)
* **OpenWeatherMap API**
* **Material 3 Design**

---

## النسخة العربية <a name="النسخة-العربية"></a>

تطبيق طقس احترافي مبني باستخدام **Flutter**، يتبع معايير المعمارية النظيفة ويعتمد على **Cubit** لإدارة الحالة. يتميز التطبيق بنظام ألوان ديناميكي يغير واجهة المستخدم تلقائياً بناءً على حالة الطقس.

### ✨ المميزات الرئيسية
* **🔍 بحث شامل:** ابحث عن أي مدينة للحصول على بيانات الطقس في الوقت الفعلي.
* **🎨 ثيم ديناميكي:** ألوان التطبيق تتغير (AppBar، دائرة التحميل) لتناسب جو المدينة (مشمس، غائم، ممطر).
* **🛡️ معالجة الأخطاء:**
    * كشف انقطاع الإنترنت.
    * التعامل مع تأخر استجابة السيرفر.
    * التنبيه عند عدم العثور على المدينة.
* **🔄 زر إعادة المحاولة:** حل سريع للمشاكل التقنية دون الحاجة لإعادة كتابة اسم المدينة.

### 🛠️ التقنيات المستخدمة
* **فلاتر و بلوك (Cubit)**
* **Dio** (للتواصل مع الـ API)
* **OpenWeatherMap API**
* **Material 3 Design**

---

## 📸 Screenshots | لقطات من التطبيق

| Dynamic Theme (Clouds)

![Clouds](https://github.com/Mo7-Mortada/weather_app_cubit/blob/main/screenshots/Dynamic%20Theme%20(Clouds)%20Screenshot.jpg?raw=true)

| Error Handling (No Internet)

![Error](https://github.com/Mo7-Mortada/weather_app_cubit/blob/main/screenshots/Error%20Handling%20(No%20Internet)%20Screenshot.jpg?raw=true)

| Home View (Searching Now)

![Home](https://github.com/Mo7-Mortada/weather_app_cubit/blob/main/screenshots/Home%20View%20Screenshot.jpg?raw=true)
## 🚀 How to Run | كيف تشغل المشروع

1. **Clone the repo | تحميل المشروع:**
```Bash
git clone [https://github.com/Mo7-Mortada/weather_app_cubit.git](https://github.com/Mo7-Mortada/weather_app_cubit.git)
```
3. **Install dependencies | تثبيت المكتبات:**
```Dart
flutter pub get
```
3. Run the app | تشغيل التطبيق:
```Dart
flutter run
```
Made with ❤️ by [Mo7-Mortada]
