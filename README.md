# USA ZIP Code Lookup SPA

This is a simple Single Page Application (SPA) that allows users to search for information about their city and state based on their ZIP code (USA ZIP codes only). In addition to displaying city and state information, the app captures IP address, User Agent data, and HTTP Referer and UTM tags if the user comes from an outside source.

## Demo

[You can try the live demo here](https://krisplanka.github.io/zip-app-vue/)

[Demo with UTM parameters](https://krisplanka.github.io/zip-app-vue/?utm_source=github&utm_medium=link&utm_campaign=test)

## Technology Stack
- Front-end: Vue.js, Bootstrap 5
- API: Free public APIs for ZIP code and IP data

## Usage
The flow of the app is as follows:

1. The user enters their ZIP code into the input field and presses the "Render" button.
2. The app requests data based on the entered ZIP code.
3. The app displays the requested data, including city, state, IP address, and User Agent.

## Installation

1. Clone zip-app-vue:

``` console
https://github.com/KrisPlanka/zip-app-vue.git
```

2. Type following commands:
``` console
npm install
```

3. Run npm start
``` console
npm run dev
```

## Limitations
Please note that this app is designed to work only with USA ZIP codes.

