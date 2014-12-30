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

