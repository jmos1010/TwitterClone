//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by MacBook Pro on 15/01/2021.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    // MARK: - Properties
    
    private let user: User
    
    let usernameText: String
    
    var bioLabelText: String {
        return user.bio ?? ""
    }
    
    var followingString: NSAttributedString? {
        let following = user.stats?.following ?? 0
        return attributedText(withValue: following, text: "following")
    }
    
    var followersString: NSAttributedString? {
        let followers = user.stats?.followers ?? 0
        return attributedText(withValue: followers, text: "followers")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit profile"
        }
        
        if !user.isCurrentUser && !user.isFollowed {
            return "Follow"
        }
        
        if user.isFollowed {
            return "Following"
        }
        
        return "Loading"
    }
    
    // MARK: - Lifecycle

    
    init(user: User) {
        self.user = user
        self.usernameText = "@" + user.username
    }
    
    // MARK: - Helpers
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: " \(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
    
}
