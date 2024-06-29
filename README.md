# Astronomy pic of the day

This is an iOS App which shows the best Astronomy pics of the week.

## Screenshots

![1](https://github.com/Pratik-7i/Planets/assets/96768526/ec17225b-b29e-423a-a1f2-f7647d42e10d)
![2](https://github.com/Pratik-7i/Planets/assets/96768526/22f0fa1d-ff9c-4942-aa94-8f0b38eaeaf2)
![3](https://github.com/Pratik-7i/Planets/assets/96768526/77580956-e078-4ffd-87df-01c0d9189b40)
![4](https://github.com/Pratik-7i/Planets/assets/96768526/667b5c4e-53b4-4d7a-8f6c-98a28a138995)
![5](https://github.com/Pratik-7i/Planets/assets/96768526/08568986-dc37-40d5-a3e7-2b17dd8607ff)
![6](https://github.com/Pratik-7i/Planets/assets/96768526/93992d2c-fda6-4734-a3a2-8b5994ec8616)
<img width="372" alt="7" src="https://github.com/Pratik-7i/Planets/assets/96768526/b9943497-9929-4b97-b4b9-1ceda7142cf2">

## Basic details
- Deployment target: **iOS 15.0**
- Supported device: **iPhone & iPad**
- User interface: **SwiftUI**
- Code architecture: **MVVM**
- `async await` is used for concurrency
-  I have used `throw` as method of error handling. No more `Result` enums 
- `Swift Packgae Manager` (SPM) is used to manage project dependencies

## What is covered
- Astronomy articles of last 7 days
- Detail screen which shows the selected article
- Generic Testable network layer (Mock URLProtocol)
- Unit Test Cases
- Error handling with human readable message, retry on error
- Dark mode support

## Note
- All our environments (Local, Staging, and Production) are `https`, so I assigned default value to `scheme` inside `Endpoint`. If our `Development` environment is still `http`, we can assign it later when we define endpoints.
- If `token` is empty, it will not be set for `Authorization` header field. For the sake of demo, we are not using `token`. If we want to use token, we just need to fetch token from User defaults (or any storage) and set it there.
- View model is `Observale` object and its instance is used with `ObservableObject` property wrapper, so we do not need any mechanism (e.g. delagates, closures, Box pattern, or RxSwift) to update `view` when `view model` changes, its `@published` properties will automatically publish value and `SwiftUI` views will be automatically updated.
- If the `mediaType` is `video`, then the video URL is URL of a YouTube video. In that case, the thumbnail URL is generated to show as a thumbnail. For the sake of demo, video is not played.

