//
//  NotificationManager.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()

    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                self.scheduleDailyReminder()
            } else {
                // Handle the error or denial.
            }
        }
    }

    private func scheduleDailyReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Don't forget to write in your journal!"
        content.body = "Take a moment to reflect on your day."

        var dateComponents = DateComponents()
        dateComponents.hour = 19 // Set the hour you want the notification to be at, e.g. 7 PM
        dateComponents.minute = 0 // Set the minute, e.g. 0 for on the hour

        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true) // Trigger daily at the specified time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true) // Repeat every 10 seconds

        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}
