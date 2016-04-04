//
//  GlobalVariable.swift
//  SmartQRes
//
//  Created by Pannray Samanphanchai on 4/2/2559 BE.
//  Copyright © 2559 BlueSeed. All rights reserved.
//

import Foundation
struct MyVariables {
    
    static var username :String = "SizzlerSiamCen"
    static var password :String = "password"
    static var branchAdminUserType :Int = 2
    
    static var currentQueueA : Int = 9
    static var currentQueueB : Int = 4
    static var currentQueueC : Int = 2
    static var currentQueueD : Int = 0
    
    static var currentRunningTypeA : Int = 11
    static var currentRunningTypeB : Int = 5
    static var currentRunningTypeC : Int = 2
    static var currentRunningTypeD : Int = 0
    static var currentQueueId : Int = 9
    
    static var defaultBranch : Branch = Branch(
        bra_id: 1,
        bra_name: "Siam Center",
        bra_res_id: 1,
        bra_res_name: "Sizzler",
        bra_shop_name: "Siam Center",
        bra_status_name: "Service",
        bra_location: "4th Floor @Siam Center, Pathumwan, Bangkok",
        bra_service_time: "11:00 - 21:00",
        bra_contact_no: "061-421-1908",
        bra_ty_a_min: 1,
        bra_ty_a_max: 4,
        bra_ty_a_turnover: 3,
        bra_ty_b_min: 5,
        bra_ty_b_max: 8,
        bra_ty_b_turnover: 6,
        bra_ty_c_min: 9,
        bra_ty_c_max: 12,
        bra_ty_c_turnover: 8,
        bra_ty_d_min: 13,
        bra_ty_d_max: 20,
        bra_ty_d_turnover: 10,
        bra_noti_1: 6,
        bra_noti_2: 4,
        bra_noti_3: 2)
    
    static var shoppingMallList : [ShoppingMall] = [
        ShoppingMall(sho_id: 1, sho_name: "Siam Center"),
        ShoppingMall(sho_id: 2, sho_name: "Siam One"),
        ShoppingMall(sho_id: 3, sho_name: "MBK"),
        ShoppingMall(sho_id: 4, sho_name: "Central World")]
    
    
    static var waitingQueueTypeA : [Queue] = [
        Queue(que_id: 1,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 1,
            que_status: Constants.QueueStatus.Waiting,
            que_tb_type: Constants.TableType.A,
            que_no: 9,
            que_no_person: 3,
            que_child_flag: Constants.Flag.YES,
            que_wheel_flag: Constants.Flag.NO,
            que_confirm_code: "941023",
            que_current_flag: Constants.Flag.YES,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate()),
        Queue(que_id: 2,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 2,
            que_status: Constants.QueueStatus.Waiting,
            que_tb_type: Constants.TableType.A,
            que_no: 10,
            que_no_person: 4,
            que_child_flag: Constants.Flag.YES,
            que_wheel_flag: Constants.Flag.YES,
            que_confirm_code: "572101",
            que_current_flag: Constants.Flag.NO,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate()),
        Queue(que_id: 3,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 3,
            que_status: Constants.QueueStatus.Waiting,
            que_tb_type: Constants.TableType.A,
            que_no: 11,
            que_no_person: 4,
            que_child_flag: Constants.Flag.NO,
            que_wheel_flag: Constants.Flag.NO,
            que_confirm_code: "128470",
            que_current_flag: Constants.Flag.NO,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate()),
    
    ]
    
    static var waitingQueueTypeB : [Queue] = [
        Queue(que_id: 4,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 4,
            que_status: Constants.QueueStatus.Waiting,
            que_tb_type: Constants.TableType.B,
            que_no: 4,
            que_no_person: 6,
            que_child_flag: Constants.Flag.YES,
            que_wheel_flag: Constants.Flag.YES,
            que_confirm_code: "771835",
            que_current_flag: Constants.Flag.YES,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate()),
        Queue(que_id: 5,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 5,
            que_status: Constants.QueueStatus.Waiting,
            que_tb_type: Constants.TableType.B,
            que_no: 5,
            que_no_person: 8,
            que_child_flag: Constants.Flag.YES,
            que_wheel_flag: Constants.Flag.NO,
            que_confirm_code: "018475",
            que_current_flag: Constants.Flag.NO,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate())
        
    ]
    
    static var waitingQueueTypeC : [Queue] = [
        Queue(que_id: 6,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 6,
            que_status: Constants.QueueStatus.Waiting,
            que_tb_type: Constants.TableType.C,
            que_no: 2,
            que_no_person: 10,
            que_child_flag: Constants.Flag.YES,
            que_wheel_flag: Constants.Flag.YES,
            que_confirm_code: "543911",
            que_current_flag: Constants.Flag.YES,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate())
    ]
    
    static var waitingQueueTypeD : [Queue] = []
    
    static var noShowQueueTypeA : [Queue] = [
        Queue(que_id: 7,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 7,
            que_status: Constants.QueueStatus.NoShow,
            que_tb_type: Constants.TableType.A,
            que_no: 2,
            que_no_person: 3,
            que_child_flag: Constants.Flag.NO,
            que_wheel_flag: Constants.Flag.NO,
            que_confirm_code: "109238",
            que_current_flag: Constants.Flag.NO,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate()),
        Queue(que_id: 8,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 8,
            que_status: Constants.QueueStatus.NoShow,
            que_tb_type: Constants.TableType.A,
            que_no: 6,
            que_no_person: 2,
            que_child_flag: Constants.Flag.NO,
            que_wheel_flag: Constants.Flag.NO,
            que_confirm_code: "672900",
            que_current_flag: Constants.Flag.NO,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate())
    
    ]
    
    static var noShowQueueTypeB : [Queue] = [
        Queue(que_id: 9,
            que_type: Constants.QueueType.Client,
            que_bra_id: 1,
            que_cus_id: 9,
            que_status: Constants.QueueStatus.NoShow,
            que_tb_type: Constants.TableType.B,
            que_no: 2,
            que_no_person: 6,
            que_child_flag: Constants.Flag.YES,
            que_wheel_flag: Constants.Flag.NO,
            que_confirm_code: "895751",
            que_current_flag: Constants.Flag.NO,
            que_call_q_time: NSDate(),
            que_complete_time: NSDate(),
            que_reserve_time: NSDate(),
            que_cancel_time: NSDate())
    
    ]
    
    static var noShowQueueTypeC : [Queue] = []
    static var noShowQueueTypeD : [Queue] = []
}