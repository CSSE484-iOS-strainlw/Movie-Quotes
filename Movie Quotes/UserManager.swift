//
//  UserManager.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/3/21.
//

import Foundation
import Firebase

let kCollectionUsers = "Users"
let kKeyName = "name"
let kKeyPhotoUrl = "photoUrl"


class UserManager {
    
    var _collectionRef: CollectionReference
    var _document: DocumentSnapshot?
    var _userListener: ListenerRegistration?
    
    static let shared = UserManager()
    
    private init(){
        _collectionRef = Firestore.firestore().collection("Users")
    }
    
    //Create
    func addNewUserMaybe(uid: String, name: String?, photoUrl: String?){
        // Get user to check exsistance
        // Add user only if they dont exsist
        
        let userRef = _collectionRef.document(uid)
        userRef.getDocument { documentSnapshot, error in
            if let error = error{
                print("Error getting user\(error)")
                return
            }
            if let documentSnapshot = documentSnapshot{
                if documentSnapshot.exists{
                    print("There is already a user object for this auth user. Do Nothing")
                    return
                }else{
                    print("Creating a User with document id \(uid)")
                }
                userRef.setData([kKeyName: name ?? "", kKeyPhotoUrl: photoUrl ?? ""])
            }
        }
    }
    //Read
    func beginListening(uid: String, changeListener: () -> Void){
        
    }
    
    func stopListeing(){
        _userListener?.remove()
    }
    
    //Update
    func updateName(name:String){
        
    }
    
    func updatePhotoUrl(photoUrl: String){
        
    }
    
    //Getters
    var name: String {
            if let value = _document?.get(kKeyName){
                return value as! String
            }
        return ""
    }
    
    var photoUrl: String {
            if let value = _document?.get(kKeyPhotoUrl){
                return value as! String
            }
        return ""
    }
    
}
