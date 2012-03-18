Cordova-LocalNotification
=======
### The [Cordova][] ⇆ LocalNotification plugin

`Cordova-LocalNotification` Exposes the iOS LocalNotifications to a Cordova Application via an easy, simple js interface.

Installation
------------

Copy `LocalNotification.h` and `LocalNotification.m` to the Plugins Folder of your Cordova Application.
Under the "Plugins" section of `Cordova.plist` add "LocalNotification" and set it equal to "LocalNotification"
Then copy the .js file to your `www` folder

API Usage
------------

The `Cordova-LocalNotification` plugin exposes 3 simple methods. 

#### LocalNotification.add(options)

Adds a notification to the OS queue.
Accepts 1 argument, an options object
Options may consist of any combination the following:

* date - A javascript date containing the exact time at which the OS should present the notification to the user
* message - The message to accompany the notification
* id - The id to assign the notification
* hasAction - Should the notification contain a action button
* badge - Badge the application icon with text or a number
* sound - The filename of a sound file to play when the notification is presented.

#### LocalNotification.cancel(id)

Cancels a scheduled notification with the id given

#### LocalNotification.cancelAll(id)

Cancels all scheduled notifications by the parent app

Getting Involved
---------------------------

If you're looking to get involved with improving this plugin feel free to open issues, or push requests with any valuable input.

[Cordova]: http://incubator.apache.org/projects/callback.html