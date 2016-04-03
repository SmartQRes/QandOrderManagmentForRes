//
//  ShoppingMall.swift
//  SmartQ
//
//  Created by Worayut Traiworadecha on 2/3/2558 BE.
//  Copyright (c) 2558 BlueSeed. All rights reserved.
//
@objc public class ShoppingMall : NSObject, CDTDataObject{
    
    var sho_id : NSNumber = 0
    var sho_name : NSString  = ""
    
    public var metadata:CDTDataObjectMetadata?

    override init(){
    }
    
    init(sho_id: NSNumber, sho_name: NSString){
        self.sho_id = sho_id
        self.sho_name = sho_name
    }
    
}