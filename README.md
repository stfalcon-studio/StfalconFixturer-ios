# Stfalcon Fixturer

A Utility for developers and QAs which helps minimize time wasting on writing the same data for testing over and over again.
You can write fixture in XML one time and use it for build testing. The library can autofill EditText with your fixture data.

### Who we are
Need iOS and Android apps, MVP development or prototyping? Contact us via info@stfalcon.com. We develop software since 2009, and we're known experts in this field. Check out our [portfolio](https://stfalcon.com/en/portfolio) and see more libraries from [stfalcon-studio](https://stfalcon.com/en/opensource).

### Download

Download via Cocoapods:
```pod
 pod 'StfalconFixturer', '0.1.0'
```

### Usage

Create json file in your project.
Example:
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
All entries require `tag` attribute. This tag will be used for binding input fields to fixture.
Also you can put some fixtures in groups. For example `email` and `password` can be marked as group `account`. This two fixtures must have the same item count. And in this case where we will select one fixture from group, it will automatically put data to all bound EditTexts to the same grouped fixtures.  

To initialize library you have to specify your json source file's name to Fixturer in AppDelegate:
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  // Override point for customization after application launch.
  #if DEBUG
    Fixturer.shared.specify(source: "fixtures")
  #endif

  return true
}
```

After that you can bind `Fixture Tag` for particular `UITextField` easily in Interface Builder:  

![Imgur](https://i.imgur.com/rOtB82Q.png)

Run your application and look on magic :) You can call fixtures dialog by triple tap on bound to fixture `UITextField`.

![Imgur](https://i.imgur.com/RAcG4Ct.gif)

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
