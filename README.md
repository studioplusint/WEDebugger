![WEDebugger](https://github.com/Ekhoo/WEDebugger/blob/master/Source/Asset/Logo.png)

[![Version](https://img.shields.io/cocoapods/v/WEDebugger.svg?style=flat)](http://cocoapods.org/pods/WEDebugger)
[![License](https://img.shields.io/cocoapods/l/WEDebugger.svg?style=flat)](http://cocoapods.org/pods/WEDebugger)
[![Platform](https://img.shields.io/cocoapods/p/WEDebugger.svg?style=flat)](http://cocoapods.org/pods/WEDebugger)
![](https://img.shields.io/badge/Supported-iOS7-4BC51D.svg?style=flat-square)

Simple and light weight debugger tool.

# Demo
![WEDebugger](https://github.com/Ekhoo/WEDebugger/blob/master/Source/Asset/demo01.png)
![WEDebugger](https://github.com/Ekhoo/WEDebugger/blob/master/Source/Asset/demo02.png)

# Installation
## CocoaPods
WEDebugger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "WEDebugger", '~> 0.0.1'
```

# Usage
## Log
The library will log following this format: `{time}: [{class} {method}] => ({file}:{line}): {text}`

```objective-c
#import "WEDebugger.h"

- (void)loadView {
    WELog(@"Hello");
}
```

## Display logs
```objective-c
#import "WEDebuggerViewController.h"

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated]
    
    [self.navigationController pushViewController:[WEDebuggerViewController new] animated:YES];
}
```

## Close logs
Swipe to the right in order to close the logs controller.

# Author
Lucas Ortis:
- me@lucas-ortis.com
- [@LucasEkhoo](https://twitter.com/LucasEkhoo)
- [Linkedin](https://fr.linkedin.com/in/lucasortis)

# License

WEDebugger is available under the MIT license. See the LICENSE file for more info.
