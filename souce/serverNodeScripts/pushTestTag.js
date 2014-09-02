exports.get = function(request, response) {
    var azure = require('azure');
    var notificationHubService = azure.createNotificationHubService('NotificationHubName', 
                        'NotificationHubFullSharedAccessSignature');
    notificationHubService.apns.send('MyTag',        
        {
            alert: "Hello MyTag",
            payload: {
                inAppMessage: "Hello MyTag!"
            }
        }
        ,
        function (error)
        {
            if (!error) {
                console.warn("Notification successful");
            }
        }
    );
    response.send(statusCodes.OK, { message : 'Notification Sent' });
};