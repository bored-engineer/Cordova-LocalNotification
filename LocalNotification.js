//
//  LocalNotification.js
//
//  Created by Luke Young (innoying) on 3/18/2012.
// 	Inspiration from original plugin from Greg Allen
//  Copyright 2012 innoying.com
//  Released under MIT license
//

var LocalNotification = function(){}

LocalNotification.prototype.add = function(options) {
     var defaultValues = {
            date: false,
            message: '',
            hasAction: true,
            action: 'View',
            badge: 0,
            id: 0,
			sound:'',
			background:'',
			foreground:''
    }    
    for (var key in defaultValues) {
    	if (options[key] != "undefined"){
        	options[key] = defaultValues[key];
        }
    }
	if (typeof options.date == 'object') {
		options.date = Math.round(options.date.getTime()/1000);
	}
	Cordova.exec("LocalNotification.addNotification", defaults);
};
LocalNotification.prototype.cancel = function(id) {
	Cordova.exec("LocalNotification.cancelNotification", id);
};
	
LocalNotification.prototype.cancelAll = function(id) {
    Cordova.exec("LocalNotification.cancelAllNotifications");
};

Cordova.addConstructor(function() {
	if(!window.plugins){
		window.plugins = {};
	}
	if(!window.plugins.LocalNotification) {
		window.plugins.LocalNotification = new LocalNotification();
	}
}