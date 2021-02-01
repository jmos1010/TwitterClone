//
//  NotificationViewModel.swift
//  TwitterClone
//
//  Created by MacBook Pro on 25/01/2021.
//

import UIKit

struct NotificationViewModel {
    
    // MARK: - Properties
    
    private let notification: Notification
    private let type: NotificationType
    private let user: User
    
    var notificationMessage: String {
        switch type {
        case .follow:   return " started following you"
        case .like:     return " liked your tweet"
        case .reply:    return " replied to your tweet"
        case .retweet:  return " retweeted your tweet"
        case .mention:  return " mentioned you in tweet"
        }
    }

    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: notification.timestamp, to: now) ?? ""
    }
    
    var notificationText: NSAttributedString? {
        let title = NSMutableAttributedString(string: user.username, attributes: [.font: UIFont.boldSystemFont(ofSize: 12)])
        title.append(NSAttributedString(string: notificationMessage, attributes: [.font: UIFont.systemFont(ofSize: 12)]))
        title.append(NSAttributedString(string: " \(timestamp)", attributes: [.font : UIFont.systemFont(ofSize: 12),
                                                                              .foregroundColor: UIColor.lightGray]))
        return title
    }
    
    var profileImageUrl: URL? {
        return user.profileImageUrl
    }
    
    var shouldHideFollowButton: Bool {
        return type != .follow
    }
    
    var followButtonText: String {
        return user.isFollowed ? "Following" : "Follow"
    }
    
    // MARK: - Lifecycle
    
    init(notification: Notification, type: NotificationType) {
        self.notification = notification
        self.type = type
        self.user = notification.user
    }
    
}
