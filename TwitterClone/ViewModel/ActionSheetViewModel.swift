//
//  ActionSheetViewModel.swift
//  TwitterClone
//
//  Created by MacBook Pro on 23/01/2021.
//

import Foundation

struct ActionSheetViewModel {
    
    // MARK: - Properties
    
    private let user: User
        
    var options: [ActionSheetOptions] {
        var results = [ActionSheetOptions]()
  
        if user.isCurrentUser {
            results.append(.delete)
        } else {
            let followOption: ActionSheetOptions = user.isFollowed ? .unFollow(user) : .follow(user)
            results.append(followOption)
        }
        
        results.append(.report)
        
        return results
    }
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
    }
    
    // MARK: - Helpers
    
}

enum ActionSheetOptions {
    case follow(User)
    case unFollow(User)
    case delete
    case report
    
    var description: String {
        
        switch self {
        case .follow(let user): return "Follow @\(user.username)"
        case .unFollow(let user): return "Unfollow @\(user.username)"
        case .delete: return "Delete Tweet"
        case .report: return "Report Tweet"
        }
    }
}
