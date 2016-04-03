//
//  Queue.swift
//  SmartQ
//
//  Created by Worayut Traiworadecha on 2/3/2558 BE.
//  Copyright (c) 2558 BlueSeed. All rights reserved.
//
@objc public class Queue: NSObject, CDTDataObject {
    var que_id : NSNumber =  0
    var que_type : NSNumber = 0
    var que_bra_id : NSNumber = 0
    var que_cus_id : NSNumber = 0
    var que_status : NSNumber = 0
    var que_tb_type : NSString = ""
    var que_no : NSNumber = 0
    var que_no_person : NSNumber = 0
    var que_child_flag : NSString = ""
    var que_wheel_flag : NSString = ""
    var que_confirm_code : NSString = ""
    var que_current_flag : NSString = ""
    var que_call_q_time : NSDate = NSDate()
    var que_complete_time : NSDate = NSDate()
    var que_reserve_time : NSDate = NSDate()
    var que_cancel_time : NSDate = NSDate()
    
    var que_bra_name_display : NSString = ""
    var que_res_name_display : NSString = ""
    public var metadata:CDTDataObjectMetadata?
    
    
    override init(){
        
    }
    
    init(que_id: NSNumber,
        que_type: NSNumber,
        que_bra_id: NSNumber,
        que_cus_id: NSNumber,
        que_status: NSNumber,
        que_tb_type: NSString,
        que_no: NSNumber,
        que_no_person: NSNumber,
        que_child_flag: NSString,
        que_wheel_flag: NSString,
        que_confirm_code: NSString,
        que_current_flag: NSString,
        que_call_q_time: NSDate,
        que_complete_time: NSDate,
        que_reserve_time: NSDate,
        que_cancel_time: NSDate){
            
            self.que_id = que_id
            self.que_type = que_type
            self.que_bra_id = que_bra_id
            self.que_cus_id = que_cus_id
            self.que_status = que_status
            self.que_tb_type = que_tb_type
            self.que_no = que_no
            self.que_no_person = que_no_person
            self.que_child_flag = que_child_flag
            self.que_wheel_flag = que_wheel_flag
            self.que_confirm_code = que_confirm_code
            self.que_current_flag = que_current_flag
            self.que_call_q_time = que_call_q_time
            self.que_complete_time = que_complete_time
            self.que_reserve_time = que_reserve_time
            self.que_cancel_time = que_cancel_time
    }
    
    
}