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



