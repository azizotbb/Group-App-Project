# 💐 bouquetly_app

A modern Flutter-based flower shop app that allows users to browse curated bouquets, place orders, and pick them up from the store. Designed for beauty, performance, and a smooth user experience.

## 📸 Screenshots 

<table>
  <tr>
    <td align="center"><b>Splash Screen</b><br><img src="https://i.postimg.cc/k53zC3bG/Splash.jpg" width="200"/></td>
    <td align="center"><b>Sign In</b><br><img src="https://i.postimg.cc/fWBG9r6q/login.jpg" width="200"/></td>
    <td align="center"><b>Sign Up</b><br><img src="https://i.postimg.cc/rmqHd1gL/Singup.jpg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Explore 1</b><br><img src="https://i.postimg.cc/Hxtf3Zjx/explore1.jpg" width="200"/></td>
    <td align="center"><b>Explore 2</b><br><img src="https://i.postimg.cc/Ghp1gCF1/explore2.jpg" width="200"/></td>
    <td align="center"><b>Drawer Menu</b><br><img src="https://i.postimg.cc/B63rT9Sk/drawer.jpg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Store 1</b><br><img src="https://i.postimg.cc/2yK9XPYz/store1.jpg" width="200"/></td>
    <td align="center"><b>Store 2</b><br><img src="https://i.postimg.cc/SsVvcntY/store2.jpg" width="200"/></td>
    <td align="center"><b>My Bag</b><br><img src="https://i.postimg.cc/X7qTcgWj/mybag.jpg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Order Success</b><br><img src="https://i.postimg.cc/L6JbZ6kh/successful.jpg" width="200"/></td>
    <td align="center"><b>Profile</b><br><img src="https://i.postimg.cc/SRstdmwT/profile-4.jpg" width="200"/></td>
    <td align="center"><b>Account Setting</b><br><img src="https://i.postimg.cc/ZnQg9cPR/Account-Setting.jpg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Change Name</b><br><img src="https://i.postimg.cc/Nj3q02Wg/changename.jpg" width="200"/></td>
    <td align="center"><b>Change Password</b><br><img src="https://i.postimg.cc/7ZGrDnts/change-Password.jpg" width="200"/></td>
    <td align="center"><b>Logout</b><br><img src="https://i.postimg.cc/gk71M6cv/logout.jpg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>About Us</b><br><img src="https://i.postimg.cc/FFp4xRJZ/aboutus.jpg" width="200"/></td>
    <td align="center"><b>Contact Us</b><br><img src="https://i.postimg.cc/KjvCWPg5/contacts.jpg" width="200"/></td>
    <td align="center"><b>Location</b><br><img src="https://i.postimg.cc/FzWwXYyX/location.jpg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Welcome</b><br><img src="https://i.postimg.cc/4NFRrSPH/bouquetly2.jpg" width="200"/></td>
  </tr>
</table>


----- 
## ✨ Features

- 🔐 User Authentication (Sign Up / Login via Supabase)
- 🛒 Cart Management with live updates
- 🌸 Browse curated flower bouquets
- 🗺️ Google Maps integration for pickup location
- 🎠 Carousel-based product browsing
- 👤 User Profile 
- 🎨 Clean UI with Google Fonts and smooth animations


## 🚀 Tech Stack

- **Flutter** (latest stable version)  
- **Dart**  
- **BLoC** (flutter_bloc)  
- **Supabase** (Authentication & Database)  
- **GetIt** (Service Locator for Dependency Injection)  
- **Google Maps Flutter**  
- **Carousel Slider & Smooth Page Indicator**  
- **Google Fonts & Cupertino Icons**  
- **flutter_dotenv** for secure environment variables

## 🧪 Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/bouquetly_app.git

# 2. Navigate to the project folder
cd bouquetly_app

# 3. Install dependencies
flutter pub get

# 4. Set up environment variables
Create a `.env` file and add your Supabase keys:
SUPABASE_URL=your_url  
SUPABASE_ANON_KEY=your_key

# 5. Run the app
flutter run
lib
├── extension/                 # Extensions on classes or Dart core types
├── model/                     # Data models (e.g., User, Product)
├── repo/                      # Repository layer for data management
│   ├── api/                   # API service calls or external services
│   └── layer/                 # Logical layers, e.g., authentication
│       └── auth/              # Authentication-related repo files
├── screen/                    # Application screens (UI)
│   ├── auth/                  # Authentication screens
│   │   ├── signin/            # Sign-in screen
│   │   │   └── bloc/          # Bloc for Sign-in screen
│   │   └── signup/            # Sign-up screen
│   │       └── bloc/          # Bloc for Sign-up screen
│   ├── cart/                  # Cart screen
│   ├── explore/               # Explore screen
│   │   └── bloc/              # Bloc for Explore screen
│   ├── location/              # Location screen
│   │   └── bloc/              # Bloc for Location screen
│   ├── pageview/              # PageView screen
│   │   └── bloc/              # Bloc for PageView screen
│   ├── profile/               # Profile screen
│   ├── splash/                # Splash screen
│   └── store_cart/            # Store Cart screen
│       ├── bloc/              # Bloc for store_cart screen
│       └── order/             # Order screen inside store_cart
│           └── bloc/          # Bloc for Order screen
├── style/                     # Styling files (themes, colors, text styles)
├── utility/                   # Utility/helper functions used app-wide
└── widget/                    # Reusable widgets/components
    ├── auth/                  # Widgets related to authentication UI
    ├── bottomNavigation/      # Bottom navigation widgets
    │   └── bloc/              # Bloc for bottom navigation
    └── profile_widgets/       # Widgets used in Profile screen


```

# 🧭 How to Use
Open the app

Sign in or create an account

Explore bouquets and select your favorite

Add items to your cart

Proceed to checkout

Visit the store to pick up your beautifully prepared bouquet 🌸


# 👥 Team

Norah200@
https://github.com/Norah200

AymanAlzahrani@
https://github.com/AymanAlzahrani

azizotbb@
https://github.com/azizotbb

Raghadalsakhain@
https://github.com/Raghadalsakhain





