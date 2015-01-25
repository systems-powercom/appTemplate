appTemplate
===========

iOS app template.

## author's name etc.

- author's name is taken from login user name.
- organization name is set in the project start screen.
- date format is taken from login user's preference.

## app icons

- 12 files are needed.
- image convert service.

http://makeappicon.com/

- add files to Images.xcassets.

## add code snippets

1. Select source code to make snippets
2. Drag and drop it to code snippets panel
3. Edit it

- make place holder with the following description <# place holder #>

## Launch screen

From iOS8, launch screen is defined as LaunchScreen.xib.

## Application launch process

1. application willFinishLaunchingWithOptions
2. application didFinishLaunchingWithOptions
3. viewDidLoad
4. viewWillAppear
5. viewDidAppear
6. application applicationDidBecomeActive

## Switch views process

1. secondView viewDidLoad
2. secondView viewWillAppear
3. firstView viewWillDisappear -- set variables to NSUserDefaults
4. firstView viewDidDisappear
5. secondView viewDidAppear -- get variables from NSUserDefaults

## How to debug

### Change XCode preferences

To show variables when entering debug mode.

### Set breakpoint

Click the head of the line to set breakpoint.

### Run the app and see the values of variables

You can see the values of variables in the left bottom area.
Step in button will show you the change of values.

## NSLog replacement

1. Add new file named PrefixHeader.pch to the project
2. Add these lines to the file

```
#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#define LOG_PRINTF(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define LOG_METHOD NSLog(@"%s", __func__)
#define LOG_METHOD_AND_ABORT LOG_METHOD; abort()
#else
#define LOG(...)
#define LOG_PRINTF(FORMAT, ...)
#define LOG_METHOD
#define LOG_METHOD_AND_ABORT
#endif
```

3. Add this file to the project's Build Setting

4. Use them in the source files

like

```
LOG_METHOD;
```

or

```
LOG(@"message");
```

## How to use NSUserDefaults

NSUserDefaults is a convinient way to keep values in the project.

to write values,

```
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:firstTextField.text forKey:@"key"];
    [ud synchronize];
```

to read values,

```
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString * labelText = [ud objectForKey:@"key"];
```

|Object type|save method|read method|
|---|---|---|
|id|setObject: forKey:|objectForKey:|
|NSString|setObject: forKey:|stringForKey:|
|NSArray|setObject: forKey:|arrayForKey:|
|NSArray(String)|setObject: forKey:|stringArrayForKey:|
|NSDictionary|setObject: forKey:|dictionaryForKey:|
|NSData|setObject: forKey:|dataForKey:|
|NSInteger|setInteger: forKey:|integerForKey:|
|float|setFloat: forKey:|floatForKey:|
|double|setDouble: forKey:|doubleForKey:|
|BOOL|setBool: forKey:|boolForKey:|
|NSURL|setURL: forKey:|URLForKey:|

## appledoc

To write class document, we can use appledoc.

### How to install

```
git clone git://github.com/tomaz/appledoc.git
```

compile it in the folder

```
sudo mkdir /usr/local/bin
sudo sh install-appledoc.sh
```

### How to create files

In the terminal with its folder, type the following.

appledoc --project-name appTemplate --project-company systems-power --company-id com.systems-power --create-docset --output ./docs/ -h appTemplate

It is convinient to make it to shell script file like appledoc.sh.

#### Global Setting

You can use general file to set project name etc.

Create ~/.appledoc file for store global settings.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>--project-company</key>
    <string>Systems-Power</string>
    <key>--company-id</key>
    <string>com.systems-power</string>
    <key>--create-html</key>
    <true/>
    <key>--create-docset</key>
    <true/>
    <key>--install-docset</key>
    <false/>
</dict>
</plist>
```

But they make some errors. I will give up using this file.

### How to read files

Open doc folder, you will see the file named "docset-installed.txt".
So the documents are installed XCode.

In XCode, option click on the name of the class, you can select reference.

## How to use cocoapod

### How to install

```
sudo gem install cocoapods
pod setup
```

## How to use

Create Podfile like this.

```
platform :ios
pod 'JSONKit'
```

Run the following command.

```
pod install
```

Open project with Xcode workspace file.

## Learn how to debug programs

## Analyze project

- Select Product - Analyse in menu
- Check the result

## How to localize apps

Localization is very important for local users. I will summerise about localization of iOS apps.

### storyboard and launch screen (labels, buttons)

1. Add language in XCode project info
2. Select Main.storyboard and push localize button
3. Check language to localize
4. Input localizable strings to Main.storyboard of each language
5. Preview in Assistant Editor

### localize programatically

You can use Localizable.strings file

1. Add file named Localizable.strings
2. Select Localizable.strings and push localize button
3. Check language to localize
4. Input localizable strings to Localizable.strings of each language

### app name

1. Add file named InfoPlist.strings
2. Select InfoPlist.strings and push localize button
3. Check language to localize
4. Input localizable strings to InfoPlist.strings of each language

#### export and import localizable strings

Editor -> Export For Localization

You will see xliff files.

iOS simulator does not display localized strings. Use real device to check them.

#### app store page

app name, description, keywords, support email address, support URL, marketing URL, privacy policy URL, screen shots

#### translation services

You can use these services to translate strings

https://www.wordcrafts.de/

https://crowdin.com/page/tour

## Settings screen

To add settings screen, add Settings.bundle to the project.
In the Settings.bundle folder, you can see Root.plist and Root.strings files.
In the Root.plist, you can add items. the name is defined in the Root.strings file.

To localize the strings, open the project folder in finder, select Settings.bundle file and right click and open package.

Add folder named local language like ja.lproj and copy Root.strings file to the folder.

## Adjust Text position

### for UILabel

Use sizeWithFont:constrainedToSize:lineBreakMode: method to get size, and change height frame.

### for UITextView

Use contentSize property to get size.

## Check logs in a device

use iConsole to check logs in a device.

## Unit test

You can run unit test with menu Product - Test or command U.

Create test case in projectTests file. XCTAssertTrue can identify the boolean value.

## UI test

You can run UI test with automation tool.
The test case should be written in javascript.

## Check Memory Leak

Select Product -> Profile and Run Leak.
Check memory leak.

## Storyboard unwind

From iOS6 and Xcode 4.5, you can unwind viewControllers.

Add unwind method to main view controller, and call this method from
second view controller with button to connect exit.

## TabBar Application

By Embedding tabbar, you can create tabbar application.

## TableView Application

The basic technique to use tableview is,

- Add tableViewController
- Add navigationController
- Add detailViewController
- Define prepareForSegue

## key-value observing

I tried to use but unsolved error happened.

But I have defined observed object in advance, no error happened.

## How to use SQLite

- Create project
- Create Podfile

```
pod 'FMDB'
```

- run pod install

```
pod install
```

Open sqlitetest.xcworkspace to open project.

Add libsqlite3.0.dylib to project

### How to check db contents in mac

- install firefox
- install SQLite Manager, addon
- open home folder in finder
- select view - view option 
- check to display library folder
- open SQLite Manager
- open db

### select data from database

see source files.

FMResultSet has many methods to retrieve data in an appropriate format:

intForColumn:
longForColumn:
longLongIntForColumn:
boolForColumn:
doubleForColumn:
stringForColumn:
dateForColumn:
dataForColumn:
dataNoCopyForColumn:
UTF8StringForColumnName:
objectForColumnName:

## How to use JSON

No additional library is need to use JSON data

JSON String is described as following,

```
 str = @"[{\"title\":\"aaa\", \"content\":\"bbb\"}, {\"title\":\"ccc\", \"content\":\"ddd\"}]";
```

### from JSON String to array

translate NSString to  NSData and NSArray

```
NSData *jsonData = [str dataUsingEncoding:NSUnicodeStringEncoding];
NSError *error;
NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
```

get obj from array
    
```
for (NSDictionary *obj in array)
{
    NSLog(@"title = %@", [obj objectForKey:@"title"]);
}

### from JSON data to NSString 

```
jsonData = [NSJSONSerialization dataWithJSONObject:array
                                           options:NSJSONWritingPrettyPrinted
                                             error:&error];
NSString* jsonDataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
NSLog(@"jsonData string: %@", jsonDataString);
```

## Use XML Data

add delegate to .h file

```
<NSXMLParserDelegate>
```

### parse xml data

```
    NSString* xmlString = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><users><user name=\"hoge\" age=\"20\" /><user name=\"fuga\" age=\"30\" /></users>";
    NSData *xmlData = [xmlString dataUsingEncoding:NSUnicodeStringEncoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:xmlData];
    [parser setDelegate:self];
    [parser parse];
```

### add delegate method

```
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) {
        elementName = qName;
    }
    if ([elementName isEqualToString:@"user"]) {
        NSLog(@"Name is %@ , Age is %@", [attributeDict objectForKey:@"name"], [attributeDict objectForKey:@"age"]);
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (qName) {
        elementName = qName;
    }
}
```

## How to load HTML document

- Add UIWebViewDelegate to header file.
- Add UIWebView to storyboard.
- Make connection from UIWebView to header file (outlet).
- Add source to method file

```
    NSURL * url = [NSURL URLWithString:@"http://www.oreilly.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    _webView.delegate = self;
    [_webView loadRequest:request];
```

Run this project, you will see the page is loaded.

Add this method to method file.

```
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webview did finish load");
    NSString * title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title = %@", title);
}
```

## How to use basic auth

- Add NSURLConnectionDelegate to header file.
- Add source to method file

```
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
    [connection start];
```

- Add method to method file.

```
-(void)connection:(NSURLConnection*)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    NSLog(@"willSendRequestForAuthenticationChallenge");
    
    if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodHTTPBasic) {
        if (challenge.previousFailureCount == 0) {
            NSURLCredential *creds = [[NSURLCredential alloc] initWithUser:@"username" password:@"password" persistence:NSURLCredentialPersistenceForSession];
            [challenge.sender useCredential:creds forAuthenticationChallenge:challenge];
        }
    }else{
        [[challenge sender] cancelAuthenticationChallenge:challenge];
        NSLog(@"invalid username or password");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"invalid credentials");
            
        });
    }
}
```




