# Column
*Call 'em*

Column is a phone directory app using [Google Places API](https://developers.google.com/places/web-service/intro) to search, get details for, and ultimately, call, places. Although the app focuses on hotels and car rental agencies, other places and even addresses are searchable.

## Getting Started
### Prerequisites
To run this project, you will need Xcode 10.2 or greater.

### Installing
This app doesn't use any external libraries or frameworks, so installation is straighforward. Just clone it!

```
git clone https://github.com/thedeagler/Column.git
cd Column
```

### Setting up an API key
1. Get your Google Places API key. If you don't have one, you can follow [these instructions](https://developers.google.com/places/web-service/get-api-key) to create one.
2. Navigate to `~/Column/Core/Config/`
3. Copy `secrets.example.xcconfig` into a new file named `secrets.xcconfig`
4. For `GOOGLE_PLACES_API_KEY`, replace `YOUR_SECRETS_HERE` with your api key.

### Running
Pick a device and hit run.
