# StfalconFixturer

A simple light-weight way to add autofilling fixtures to UITextFields for debug.

![Stfalcon Fixturer](https://i.imgur.com/Jo01gtY.gif)

### Who we are
Need iOS and Android apps, MVP development or prototyping? Contact us via info@stfalcon.com. We develop software since 2009, and we're known experts in this field. Check out our [portfolio](https://stfalcon.com/en/portfolio) and see more libraries from [stfalcon-studio](https://stfalcon-studio.github.io/).

### Download

Download via Cocoapods:
```pod
 pod 'StfalconFixturer', '0.1.0'
```

### Usage

1. Create json file with fixtures as in example:
```json
[
  {
    "tag": "email",
    "group": "account",
    "values": [
      "user1@test.com",
      "user2@test.com",
      "user3@test.com"
    ]
  },
  {
    "tag": "password",
    "group": "account",
    "values": [
      "mypassword1",
      "superpassword2",
      "mysuperpassword3"
    ]
  },
  {
    "tag": "city",
    "values": [
      "Kyiv, Ukraine",
      "San Francisco, California"
    ]
  }
]
```
Here  
`tag` means the type of fixtures. You are able to specify any type you need.  
`values` is the array of fixtures for the particular tag.  
`group` (optionally) allows you to implement autofilling. That means if you choose a fixture #2 for any of the fixtured fields, 
all the other fields of that group will be autofilled with fixture #2 according to their tag.

2. Specify your json source file's name to Fixturer in AppDelegate:
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  // Override point for customization after application launch.
  #if DEBUG
    Fixturer.shared.specify(source: "fixtures")
  #endif
  
  return true
}
```

3. Specify tag for particular `UITextField` easily in `didSet`:
```swift
@IBOutlet private weak var emailTextInput: UITextField! {
  didSet { emailTextInput.setFixtureTag("email") }
}
```

4. Now on triple tapping your `UITextField` controller will present action sheet with all the available fixtures 
according to the tag of `UITextField`.

### License 

```
Copyright 2018 stfalcon.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
