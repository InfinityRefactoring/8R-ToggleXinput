# 8R-ToggleXinput

## What is it?

This is a set of utilities script for enables/disables a input using the command xinput.

## Using 8R-ToggleXinput

[Download](https://github.com/InfinityRefactoring/8R-ToggleXinput/archive/master.zip) the source code

Extract to the `/opt/8R-ToggleXinput/` folder

Add a shortcut key for each desired script. See the scripts in the inputs folder.

*Note*: If you desire change the default config you can change the variables defined in the script files.

## Available inputs

* Touchpad
* PowerButton

## Tested on

* Linux mint - 18.2

## Creating your own toggleXinput

Create your script file in the `/opt/8R-ToggleXinput/inputs` folder with the script bellow:

```
#!/bin/bash

cd "/opt/8R-ToggleXinput/inputs"

sh ToggleXinput.sh "XINPUT_NAME" "/path/to/icon/image";
```
*Note*: Replace the text `XINPUT_NAME` by the desired input name as well as the text `/path/to/icon/image` by the path of desired icon. This icon will be displayed on notification.

## Licensing

**8R-ToggleXinput** is provided and distributed under the [Apache Software License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Refer to *LICENSE* for more information.
