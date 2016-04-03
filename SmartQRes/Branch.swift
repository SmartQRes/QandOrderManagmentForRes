//
//  Branch.swift
//  SmartQ
//
//  Created by Worayut Traiworadecha on 2/3/2558 BE.
//  Copyright (c) 2558 BlueSeed. All rights reserved.
//

@objc public class Branch : NSObject, CDTDataObject {
    
    var bra_id : NSNumber = 0
    var bra_res_id : NSNumber = 0
    var bra_sho_id : NSNumber = 0
    var bra_name : NSString = ""
    var bra_status : NSNumber = 0
    var bra_location : NSString = ""
    var bra_service_time : NSString = ""
    var bra_contact_no : NSString = ""
    var bra_ty_a_min : NSNumber = 0
    var bra_ty_a_max : NSNumber = 4
    var bra_ty_a_turnover : NSNumber = 3
    var bra_ty_b_min : NSNumber = 5
    var bra_ty_b_max : NSNumber = 8
    var bra_ty_b_turnover : NSNumber = 6
    var bra_ty_c_min : NSNumber = 9
    var bra_ty_c_max : NSNumber = 12
    var bra_ty_c_turnover : NSNumber = 8
    var bra_ty_d_min : NSNumber = 13
    var bra_ty_d_max : NSNumber = 20
    var bra_ty_d_turnover : NSNumber = 10

    var bra_noti_1 : NSNumber = 0
    var bra_noti_2 : NSNumber = 0
    var bra_noti_3 : NSNumber = 0
    
    var bra_res_name : NSString = ""
    
    var bra_shop_name : NSString = ""
    
    var bra_status_name : NSString = ""
    
    public var metadata:CDTDataObjectMetadata?
    
    override init(){
    }
    
    init(
        bra_id: NSNumber,
        bra_name: NSString,
        bra_res_id : NSNumber,
        bra_res_name : NSString,
        bra_shop_name : NSString,
        bra_status_name: NSString,
        bra_location: NSString,
        bra_service_time: NSString,
        bra_contact_no : NSString,
        bra_ty_a_min: NSNumber,
        bra_ty_a_max: NSNumber,
        bra_ty_a_turnover: NSNumber,
        bra_ty_b_min: NSNumber,
        bra_ty_b_max: NSNumber,
        bra_ty_b_turnover: NSNumber,
        bra_ty_c_min: NSNumber,
        bra_ty_c_max: NSNumber,
        bra_ty_c_turnover: NSNumber,
        bra_ty_d_min: NSNumber,
        bra_ty_d_max: NSNumber,
        bra_ty_d_turnover: NSNumber,
        bra_noti_1: NSNumber,
        bra_noti_2: NSNumber,
        bra_noti_3: NSNumber){
            self.bra_id = bra_id
            self.bra_name = bra_name
            self.bra_res_id = bra_res_id
            self.bra_res_name = bra_res_name
            self.bra_shop_name = bra_shop_name
            self.bra_status_name = bra_status_name
            self.bra_location = bra_location
            self.bra_service_time = bra_service_time
            self.bra_contact_no = bra_contact_no
            self.bra_ty_a_min =  bra_ty_a_min
            self.bra_ty_a_max = bra_ty_a_max
            self.bra_ty_a_turnover = bra_ty_a_turnover
            self.bra_ty_b_min = bra_ty_b_min
            self.bra_ty_b_max = bra_ty_b_max
            self.bra_ty_b_turnover = bra_ty_b_turnover
            self.bra_ty_c_min = bra_ty_c_min
            self.bra_ty_c_max = bra_ty_c_max
            self.bra_ty_c_turnover = bra_ty_c_turnover
            self.bra_ty_d_min = bra_ty_d_min
            self.bra_ty_d_max = bra_ty_d_max
            self.bra_ty_d_turnover = bra_ty_d_turnover
            self.bra_noti_1 = bra_noti_1
            self.bra_noti_2 = bra_noti_2
            self.bra_noti_3 = bra_noti_3
            
    }
    
    
}