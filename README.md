# @capacitor/toast: toast hidden under a presented view controller on iOS

Minimal repro: `Toast.show()` draws nothing while a view controller is presented over the webview. Here the presented view controller is `@capacitor/browser`.

Versions: `@capacitor/core` / `@capacitor/ios` 8.6.2, `@capacitor/toast` 8.0.1, `@capacitor/browser` 8.0.5.

## Run

```sh
pnpm install
pnpm build
npx cap sync ios
npx cap run ios
```

## Steps

1. Tap **1. Show toast**. The toast shows.
2. Tap **2. Open Browser, show toast after 3s**. The Browser opens. After 3 s the app calls `Toast.show()`, but no toast appears.
3. Close the Browser. The page shows when `Toast.show()` was called and when it resolved: `called at 3.1s, resolved at 3.1s`. A visible long toast resolves about 4 s after the call, so this one was never on screen.

The `with-fix` branch patches `@capacitor/toast` (`pnpm patch`) to show the toast in the topmost presented view controller. With it, the toast shows over the Browser and resolves at about 7.4 s.

The same thing happens with any view controller presented over the webview, for example an in-app browser plugin.
