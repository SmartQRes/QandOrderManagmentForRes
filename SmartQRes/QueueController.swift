//
//  QueueController.swift
//  SmartQ
//
//  Created by Worayut Traiworadecha on 2/3/2558 BE.
//  Copyright (c) 2558 BlueSeed. All rights reserved.
//

import Foundation

class QueueController {
    var replicatorFactory: CDTReplicatorFactory!
    var pushReplication: CDTPushReplication!
    var queryPredicate:NSPredicate!
    var queue = Queue()
    var queueList : [Queue] = []
    var queueListAsc : [Queue] = []
    var filteredListQueue = [Queue]()
    let instance = SingletonClass.shared
    var datastore: CDTStore!
    /*
    init() {
        self.datastore = instance.connectionSmartQDB()
        self.datastore.mapper.setDataType("Queue", forClassName: NSStringFromClass(Queue.classForCoder()))
        self.datastore.createIndexWithName("QueueIndex", fields: ["que_id"], completionHandler: { (error:NSError!) -> Void in
        })
    }*/
    func getCurrentQueueByType(bra_id : NSNumber, type : NSString, uiView : ManageQViewController){
        // A
        if type == "A" {
        var findCurQueInWaitingAList = MyVariables.waitingQueueTypeA.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        var findCurQueInNoShowAList = MyVariables.noShowQueueTypeA.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        if findCurQueInWaitingAList.count == 0 {
            if findCurQueInNoShowAList.count == 0 {
                uiView.btnCurrentTypeA.titleLabel?.text =  "-"
                uiView.btnCurrentTypeA.setTitle("-", forState: UIControlState.Normal)
            }else{
                uiView.curQueueTypeA = findCurQueInNoShowAList[0]
                uiView.btnCurrentTypeA.titleLabel?.text = "A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeA.setTitle("A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        }else{
            uiView.curQueueTypeA = findCurQueInWaitingAList[0]
            uiView.btnCurrentTypeA.titleLabel?.text = "A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
            uiView.btnCurrentTypeA.setTitle("A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
        }
        }
        // B
        if type == "B" {
        var findCurQueInWaitingBList = MyVariables.waitingQueueTypeB.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        var findCurQueInNoShowBList = MyVariables.noShowQueueTypeB.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        if findCurQueInWaitingBList.count == 0 {
            if findCurQueInNoShowBList.count == 0 {
                uiView.btnCurrentTypeB.titleLabel?.text =  "-"
                uiView.btnCurrentTypeB.setTitle("-", forState: UIControlState.Normal)
            }else{
                uiView.curQueueTypeB = findCurQueInNoShowBList[0]
                uiView.btnCurrentTypeB.titleLabel?.text = "B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeB.setTitle("B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        }else{
            uiView.curQueueTypeB = findCurQueInWaitingBList[0]
            uiView.btnCurrentTypeB.titleLabel?.text = "B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
            uiView.btnCurrentTypeB.setTitle("B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
        }
        }
        if type == "C" {
        // C
        var findCurQueInWaitingCList = MyVariables.waitingQueueTypeC.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        var findCurQueInNoShowCList = MyVariables.noShowQueueTypeC.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        if findCurQueInWaitingCList.count == 0 {
            if findCurQueInNoShowCList.count == 0 {
                uiView.btnCurrentTypeC.titleLabel?.text =  "-"
                uiView.btnCurrentTypeC.setTitle("C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }else{
                uiView.curQueueTypeC = findCurQueInNoShowCList[0]
                uiView.btnCurrentTypeC.titleLabel?.text = "C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeC.setTitle("C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        }else{
            uiView.curQueueTypeC = findCurQueInWaitingCList[0]
            uiView.btnCurrentTypeC.titleLabel?.text = "C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
            uiView.btnCurrentTypeC.setTitle("C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        }
        
    
        // D
        if type == "D" {
        var findCurQueInWaitingDList = MyVariables.waitingQueueTypeD.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        var findCurQueInNoShowDList = MyVariables.noShowQueueTypeD.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
        if findCurQueInWaitingDList.count == 0 {
            if findCurQueInNoShowDList.count == 0 {
                uiView.btnCurrentTypeD.titleLabel?.text =  "-"
                uiView.btnCurrentTypeD.setTitle("D", forState: UIControlState.Normal)
            }else{
                uiView.curQueueTypeD = findCurQueInNoShowDList[0]
                uiView.btnCurrentTypeD.titleLabel?.text = "D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeD.setTitle("D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        }else{
            uiView.curQueueTypeD = findCurQueInWaitingDList[0]
            uiView.btnCurrentTypeD.titleLabel?.text = "D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
            uiView.btnCurrentTypeD.setTitle("D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
        }
        }
    
        
        
        /*
        var query : CDTQuery
        self.instance.pullItems()
        self.datastore.createIndexWithName("CurrentQIndex", fields: ["que_bra_id","que_tb_type","que_no","que_current_flag"], completionHandler: { (error:NSError!) -> Void in })
        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ and que_tb_type = %@ and que_current_flag = 'Y')", bra_id, type)
    
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                
                self.queueList = results as! [Queue]
                if(self.queueList.count > 0){
                    self.queue = self.queueList[self.queueList.count-1] as Queue
                    
                    print("<---------------Queue ID : \(self.queue.que_id)------------------>")
                    if(type == Constants.TableType.A){
                        uiView.curQueueTypeA = self.queue
                        uiView.btnCurrentTypeA.titleLabel?.text = "A\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    }else if(type == Constants.TableType.B){
                        uiView.curQueueTypeB = self.queue
                        uiView.btnCurrentTypeB.titleLabel!.text = "B\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    }else if(type == Constants.TableType.C){
                        uiView.curQueueTypeC = self.queue
                        uiView.btnCurrentTypeC.titleLabel!.text = "C\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    }else if(type == Constants.TableType.D){
                        uiView.curQueueTypeD = self.queue
                        uiView.btnCurrentTypeD.titleLabel?.text = "D\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    }
                }else{
                    if(type == Constants.TableType.A){
                        uiView.btnCurrentTypeA.titleLabel?.text =  "-"
                    }else if(type == Constants.TableType.B){
                       uiView.btnCurrentTypeB.titleLabel?.text =  "-"
                    }else if(type == Constants.TableType.C){
                        uiView.btnCurrentTypeC.titleLabel?.text =  "-"
                    }else if(type == Constants.TableType.D){
                        uiView.btnCurrentTypeD.titleLabel?.text = "-"
                    }

                }
            }
            
        })
*/
        
    }
    
    func getAllCurrentQueue(bra_id : NSNumber, uiView : ManageQViewController){
        // A
            var findCurQueInWaitingAList = MyVariables.waitingQueueTypeA.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            var findCurQueInNoShowAList = MyVariables.noShowQueueTypeA.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            if findCurQueInWaitingAList.count == 0 {
                if findCurQueInNoShowAList.count == 0 {
                    uiView.btnCurrentTypeA.titleLabel?.text =  "-"
                    uiView.btnCurrentTypeA.setTitle("-", forState: UIControlState.Normal)
                }else{
                    uiView.curQueueTypeA = findCurQueInNoShowAList[0]
                    uiView.btnCurrentTypeA.titleLabel?.text = "A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    uiView.btnCurrentTypeA.setTitle("A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                }
            }else{
                uiView.curQueueTypeA = findCurQueInWaitingAList[0]
                uiView.btnCurrentTypeA.titleLabel?.text = "A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeA.setTitle("A\(uiView.curQueueTypeA.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        
        // B
            var findCurQueInWaitingBList = MyVariables.waitingQueueTypeB.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            var findCurQueInNoShowBList = MyVariables.noShowQueueTypeB.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            if findCurQueInWaitingBList.count == 0 {
                if findCurQueInNoShowBList.count == 0 {
                    uiView.btnCurrentTypeB.titleLabel?.text =  "-"
                    uiView.btnCurrentTypeB.setTitle("-", forState: UIControlState.Normal)
                }else{
                    uiView.curQueueTypeB = findCurQueInNoShowBList[0]
                    uiView.btnCurrentTypeB.titleLabel?.text = "B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    uiView.btnCurrentTypeB.setTitle("B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                }
            }else{
                uiView.curQueueTypeB = findCurQueInWaitingBList[0]
                uiView.btnCurrentTypeB.titleLabel?.text = "B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeB.setTitle("B\(uiView.curQueueTypeB.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        
            // C
            var findCurQueInWaitingCList = MyVariables.waitingQueueTypeC.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            var findCurQueInNoShowCList = MyVariables.noShowQueueTypeC.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            if findCurQueInWaitingCList.count == 0 {
                if findCurQueInNoShowCList.count == 0 {
                    print("C NO list")
                    uiView.btnCurrentTypeC.titleLabel?.text =  "-"
                    uiView.btnCurrentTypeC.setTitle("-", forState: UIControlState.Normal)
                }else{
                    print("C No Show")
                    uiView.curQueueTypeC = findCurQueInNoShowCList[0]
                    uiView.btnCurrentTypeC.titleLabel?.text = "C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    uiView.btnCurrentTypeC.setTitle("C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                }
            }else{
                print("C Waiting")
                uiView.curQueueTypeC = findCurQueInWaitingCList[0]
                uiView.btnCurrentTypeC.titleLabel?.text = "C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeC.setTitle("C\(uiView.curQueueTypeC.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        
        
        
        // D
            var findCurQueInWaitingDList = MyVariables.waitingQueueTypeD.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            var findCurQueInNoShowDList = MyVariables.noShowQueueTypeD.filter({($0 as Queue).que_current_flag == Constants.Flag.YES})
            if findCurQueInWaitingDList.count == 0 {
                if findCurQueInNoShowDList.count == 0 {
                    print("DDDDDDDD")
                    uiView.btnCurrentTypeD.titleLabel?.text =  "-"
                    uiView.btnCurrentTypeD.setTitle("-", forState: UIControlState.Normal)
                }else{
                    uiView.curQueueTypeD = findCurQueInNoShowDList[0]
                    uiView.btnCurrentTypeD.titleLabel?.text = "D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                    uiView.btnCurrentTypeD.setTitle("D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                }
            }else{
                uiView.curQueueTypeD = findCurQueInWaitingDList[0]
                uiView.btnCurrentTypeD.titleLabel?.text = "D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))"
                uiView.btnCurrentTypeD.setTitle("D\(uiView.curQueueTypeD.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
            }
        
        /*
        var query : CDTQuery
        //self.instance.pullItems()
        self.datastore.createIndexWithName("AllCurrentQIndex", fields: ["que_bra_id","que_no","que_current_flag"], completionHandler: { (error:NSError!) -> Void in })
        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ and que_current_flag = 'Y')", bra_id)
        
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                self.queueList = results as! [Queue]
                // Set default
                uiView.btnCurrentTypeA.titleLabel?.text = "-"
                uiView.btnCurrentTypeB.titleLabel?.text = "-"
                uiView.btnCurrentTypeC.titleLabel?.text = "-"
                uiView.btnCurrentTypeD.titleLabel?.text = "-"
                for i in 0..<self.queueList.count {
                    self.queue = self.queueList[i] as Queue
                    if(self.queue.que_tb_type == Constants.TableType.A){
                        uiView.curQueueTypeA = self.queue
                        uiView.btnCurrentTypeA.setTitle("A\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                    }else if(self.queue.que_tb_type == Constants.TableType.B){
                        uiView.curQueueTypeB = self.queue
                        uiView.btnCurrentTypeB.setTitle("B\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                    }else if(self.queue.que_tb_type == Constants.TableType.C){
                        uiView.curQueueTypeC = self.queue
                        uiView.btnCurrentTypeC.setTitle("C\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                    }else if(self.queue.que_tb_type == Constants.TableType.D){
                        uiView.curQueueTypeD = self.queue
                        uiView.btnCurrentTypeD.setTitle("D\(self.queue.que_no.integerValue.format(Constants.DecimalFormat.Queue))", forState: UIControlState.Normal)
                    }
                    //NSThread.sleepForTimeInterval(0.5)
                }
                //self.getAllWaitingQueueListByType(bra_id, uiView: uiView)

             }
            
        })
        */
        
    }
    
    func getWaitingQueueListByType(bra_id: NSNumber, type : NSString, uiView : ManageQViewController){
        
        /*var query : CDTQuery
        //self.instance.pullItems()
        self.datastore.createIndexWithName("WaitingQIndex", fields: ["que_bra_id","que_tb_type","que_status","que_current_flag"], completionHandler: { (error:NSError!) -> Void in })
        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ and que_tb_type = %@ and que_status = %@ and que_current_flag = 'N')", bra_id,type, Constants.QueueStatus.Waiting)
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)//, sortDescriptors: sortDescriptor)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                self.queueList = results as! [Queue]
                
                var os = NSMutableOrderedSet()
                os.addObjectsFromArray(self.queueList)
                let sd = NSSortDescriptor(key: "que_no", ascending: true)
                os.sortUsingDescriptors([sd])
                self.queueList = os.array as! [Queue]
                if(type == Constants.TableType.A){
                    uiView.listQueueTypeAWaiting = self.queueList
                    uiView.tableViewTypeAWaiting.reloadData()
                }else if(type == Constants.TableType.B){
                    uiView.listQueueTypeBWaiting = self.queueList
                    uiView.tableViewTypeBWaiting.reloadData()
                }else if(type == Constants.TableType.C){
                    uiView.listQueueTypeCWaiting = self.queueList
                    uiView.tableViewTypeCWaiting.reloadData()
                }else if(type == Constants.TableType.D){
                    uiView.listQueueTypeDWaiting = self.queueList
                    uiView.tableViewTypeDWaiting.reloadData()
                }
            }
            
        })*/
    }
    
    func getAllWaitingQueueList(bra_id: NSNumber, uiView : ManageQViewController){
        if(uiView.labelTypeA.hidden == false){
            uiView.listQueueTypeAWaiting = MyVariables.waitingQueueTypeA.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeAWaiting.reloadData()
        }
        //NSThread.sleepForTimeInterval(0.1)
        if(uiView.labelTypeB.hidden == false){
            uiView.listQueueTypeBWaiting = MyVariables.waitingQueueTypeB.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeBWaiting.reloadData()
        }
        //NSThread.sleepForTimeInterval(0.1)
        if(uiView.labelTypeC.hidden == false){
            uiView.listQueueTypeCWaiting = MyVariables.waitingQueueTypeC.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeCWaiting.reloadData()
        }
        //NSThread.sleepForTimeInterval(0.1)
        if(uiView.labelTypeD.hidden == false){
            uiView.listQueueTypeDWaiting = MyVariables.waitingQueueTypeD.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeDWaiting.reloadData()
        }

        /*
        var query : CDTQuery
        //self.instance.pullItems()
        self.datastore.createIndexWithName("WaitingQIndex", fields: ["que_bra_id","que_status","que_current_flag"], completionHandler: { (error:NSError!) -> Void in })
        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ and que_status = %@ and que_current_flag = 'N')", bra_id, Constants.QueueStatus.Waiting)
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)//, sortDescriptors: sortDescriptor)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                var typeA : [Queue] = []
                var typeB : [Queue] = []
                var typeC : [Queue] = []
                var typeD : [Queue] = []
                self.queueList = results as! [Queue]
                var os = NSMutableOrderedSet()
                os.addObjectsFromArray(self.queueList)
                let tbType = NSSortDescriptor(key: "que_tb_type", ascending: true)
                let queueNo = NSSortDescriptor(key: "que_no", ascending: true)
                os.sortUsingDescriptors([tbType, queueNo])
                self.queueList = os.array as! [Queue]
                for i in 0 ..< self.queueList.count {
                    let q = self.queueList[i] as Queue
                    if(q.que_tb_type == Constants.TableType.A){
                        typeA.append(q)
                    }else if(q.que_tb_type == Constants.TableType.B){
                        typeB.append(q)
                    }else if(q.que_tb_type == Constants.TableType.C){
                        typeC.append(q)
                    }else if(q.que_tb_type == Constants.TableType.D){
                        typeD.append(q)
                    }
                }
                if(uiView.labelTypeA.hidden == false){
                    uiView.listQueueTypeAWaiting = typeA
                    uiView.tableViewTypeAWaiting.reloadData()
                }
                //NSThread.sleepForTimeInterval(0.1)
                if(uiView.labelTypeB.hidden == false){
                    uiView.listQueueTypeBWaiting = typeB
                    uiView.tableViewTypeBWaiting.reloadData()
                }
                //NSThread.sleepForTimeInterval(0.1)
                if(uiView.labelTypeC.hidden == false){
                    uiView.listQueueTypeCWaiting = typeC
                    uiView.tableViewTypeCWaiting.reloadData()
                }
                //NSThread.sleepForTimeInterval(0.1)
                if(uiView.labelTypeD.hidden == false){
                    uiView.listQueueTypeDWaiting = typeD
                    uiView.tableViewTypeDWaiting.reloadData()
                }
                //self.getAllNoShowQueueListByType(bra_id, uiView: uiView)
            }
            
        })*/
    }

    
    func getNoShowQueueListByType(bra_id: NSNumber, type : NSString, uiView : ManageQViewController){
        if(type == Constants.TableType.A){
            uiView.listQueueTypeANoShow = MyVariables.noShowQueueTypeA.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeANoShow.reloadData()
        }else if(type == Constants.TableType.B){
           uiView.listQueueTypeBNoShow = MyVariables.noShowQueueTypeB.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeBNoShow.reloadData()
        }else if(type == Constants.TableType.C){
            uiView.listQueueTypeCNoShow = MyVariables.noShowQueueTypeC.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeCNoShow.reloadData()
        }else if(type == Constants.TableType.D){
            uiView.listQueueTypeDNoShow = MyVariables.noShowQueueTypeD.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeDNoShow.reloadData()
            
        }
        /*
        var query : CDTQuery
        //self.instance.pullItems()
        self.datastore.createIndexWithName("NoShowQIndex", fields: ["que_bra_id","que_tb_type","que_status"], completionHandler: { (error:NSError!) -> Void in })
        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ and que_tb_type = %@ and que_status = %@)", bra_id,type, Constants.QueueStatus.NoShow)
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                self.queueList = results as! [Queue]
                var os = NSMutableOrderedSet()
                os.addObjectsFromArray(self.queueList)
                let sd = NSSortDescriptor(key: "que_no", ascending: true)
                os.sortUsingDescriptors([sd])
                self.queueList = os.array as! [Queue]
                if(type == Constants.TableType.A){
                    uiView.listQueueTypeANoShow = self.queueList
                    uiView.tableViewTypeANoShow.reloadData()
                }else if(type == Constants.TableType.B){
                    uiView.listQueueTypeBNoShow = self.queueList
                    uiView.tableViewTypeBNoShow.reloadData()
                }else if(type == Constants.TableType.C){
                    uiView.listQueueTypeCNoShow = self.queueList
                    uiView.tableViewTypeCNoShow.reloadData()
                }else if(type == Constants.TableType.D){
                    uiView.listQueueTypeDNoShow = self.queueList
                    uiView.tableViewTypeDNoShow.reloadData()
                   
                }
            }
        })*/
    }
    func getAllNoShowQueueList(bra_id: NSNumber, uiView : ManageQViewController){
        if(uiView.labelTypeA.hidden == false){
            uiView.listQueueTypeANoShow = MyVariables.noShowQueueTypeA.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeANoShow.reloadData()
        }else if(uiView.labelTypeB.hidden == false){
            uiView.listQueueTypeBNoShow = MyVariables.noShowQueueTypeB.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeBNoShow.reloadData()
        }else if(uiView.labelTypeC.hidden == false){
            uiView.listQueueTypeCNoShow = MyVariables.noShowQueueTypeC.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeCNoShow.reloadData()
        }else if(uiView.labelTypeD.hidden == false){
            uiView.listQueueTypeDNoShow = MyVariables.noShowQueueTypeD.filter({$0.que_current_flag == Constants.Flag.NO})
            uiView.tableViewTypeDNoShow.reloadData()
            
        }
        /*
        var query : CDTQuery
       // self.instance.pullItems()
        self.datastore.createIndexWithName("NoShowQIndex", fields: ["que_bra_id","que_status"], completionHandler: { (error:NSError!) -> Void in })
        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ and que_status = %@)", bra_id, Constants.QueueStatus.NoShow)
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                var typeA : [Queue] = []
                var typeB : [Queue] = []
                var typeC : [Queue] = []
                var typeD : [Queue] = []
                self.queueList = results as! [Queue]
                var os = NSMutableOrderedSet()
                os.addObjectsFromArray(self.queueList)
                let tbType = NSSortDescriptor(key: "que_tb_type", ascending: true)
                let queueNo = NSSortDescriptor(key: "que_no", ascending: true)
                os.sortUsingDescriptors([tbType, queueNo])
                self.queueList = os.array as! [Queue]
                for i in 0 ..< self.queueList.count {
                    let q = self.queueList[i] as Queue
                    if(q.que_tb_type == Constants.TableType.A){
                        typeA.append(q)
                    }else if(q.que_tb_type == Constants.TableType.B){
                        typeB.append(q)
                    }else if(q.que_tb_type == Constants.TableType.C){
                        typeC.append(q)
                    }else if(q.que_tb_type == Constants.TableType.D){
                        typeD.append(q)
                    }
                }
                if(uiView.labelTypeA.hidden == false){
                    uiView.listQueueTypeANoShow = typeA
                    uiView.tableViewTypeANoShow.reloadData()
                }
                //NSThread.sleepForTimeInterval(0.1)
                if(uiView.labelTypeB.hidden == false){
                    uiView.listQueueTypeBNoShow = typeB
                    uiView.tableViewTypeBNoShow.reloadData()
                }
                //NSThread.sleepForTimeInterval(0.1)
                if(uiView.labelTypeC.hidden == false){
                    uiView.listQueueTypeCNoShow = typeC
                    uiView.tableViewTypeCNoShow.reloadData()
                }
                //NSThread.sleepForTimeInterval(0.1)
                if(uiView.labelTypeD.hidden == false){
                    uiView.listQueueTypeDNoShow = typeD
                    uiView.tableViewTypeDNoShow.reloadData()
                }
                
            }
        })*/
    }

    /*
    func getQueueById(que_id : NSNumber, uiView : ManageQViewController) -> Void {
        var query : CDTQuery
        self.instance.pullItems()
        self.queryPredicate = NSPredicate(format: "(que_id = %@)", que_id)!
        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                self.queueList = results as [Queue]
                for i in 0..<self.queueList.count{
                    self.queue = self.queueList[i] as Queue
                    
                    print("<---------------Queue : \(self.queue.que_no) For update")
                    //self.deleteItem(self.queue)
                    //self.queue.que_status = Constants.QueueStatus.Completed
                    //self.queue.que_complete_time = NSDate()
                    //self.updateItem(self.queue)
                }
            }
            
        })
        
    }
    */
    
    func getQueueById(que_id : NSNumber, uiView : MainDetailBranchViewController) -> Void {
        var query : CDTQuery
        self.instance.pullItems()
        //self.queryPredicate = NSPredicate(format: "(que_id = %@)", que_id)!
        query = CDTCloudantQuery(dataType: "Queue")//, withPredicate: self.queryPredicate)
        datastore.performQuery(query, completionHandler: {(results, error) -> Void in
            if((error) != nil){
                print(error)
            }
            else{
                self.queueList = results as! [Queue]
                for i in 0..<self.queueList.count{
                    self.queue = self.queueList[i] as Queue
                    
                    print("<---------------Queue : \(self.queue.que_no) For update")
                    self.deleteItem(self.queue)
                    //self.queue.que_status = Constants.QueueStatus.Completed
                    //self.queue.que_complete_time = NSDate()
                    //self.updateItem(self.queue)
                }
            }
            
        })
        
    }
    
    func loadAllQueueInfo(branchId : NSNumber, uiView : ManageQViewController){
        self.instance.pullItems()
     /*   self.getCurrentQueueByType(branchId, type:Constants.TableType.A, uiView:uiView)
        self.getCurrentQueueByType(branchId, type:Constants.TableType.B, uiView:uiView)
        self.getCurrentQueueByType(branchId, type:Constants.TableType.C, uiView:uiView)
        self.getCurrentQueueByType(branchId, type:Constants.TableType.D, uiView:uiView)*/
        self.getAllCurrentQueue(branchId, uiView: uiView)
        NSThread.sleepForTimeInterval(0.2)
        self.getAllWaitingQueueList(branchId, uiView: uiView)
         NSThread.sleepForTimeInterval(0.2)
        self.getAllNoShowQueueList(branchId, uiView: uiView)
    }
    
    func createQueue(var bra_id : NSNumber,
        var noOfPerson: NSNumber, var childFlag: Bool, var wheelchairFlag: Bool,
        var branch: Branch, var crnObj: CurrentRunningNo, uiView: BookingQViewController){
            
            var toBeQueueNo : Int = 0
            var toBeQueueId : Int = 0
            var q : Queue
            var childFlagString : String
            var wheelChairFlagString : String
            
            if(childFlag){
                childFlagString = Constants.Flag.YES
            }else{
                childFlagString = Constants.Flag.NO
            }
            
            if(wheelchairFlag){
                wheelChairFlagString = Constants.Flag.YES
            }else{
                wheelChairFlagString = Constants.Flag.NO
            }
            
            
            
            if (noOfPerson.integerValue >= MyVariables.defaultBranch.bra_ty_a_min.integerValue &&
                noOfPerson.integerValue <= MyVariables.defaultBranch.bra_ty_a_max.integerValue) {
                    toBeQueueNo = MyVariables.currentRunningTypeA + 1
                    toBeQueueId = MyVariables.currentQueueId + 1
                    //Type A
                    q = Queue(que_id: toBeQueueId,
                        que_type: Constants.QueueType.Front,
                        que_bra_id: 1,
                        que_cus_id: 1,
                        que_status: Constants.QueueStatus.Waiting,
                        que_tb_type: Constants.TableType.A,
                        que_no: toBeQueueNo,
                        que_no_person: noOfPerson,
                        que_child_flag: childFlagString,
                        que_wheel_flag: wheelChairFlagString,
                        que_confirm_code: "358149",
                        que_current_flag: Constants.Flag.NO,
                        que_call_q_time: NSDate(),
                        que_complete_time: NSDate(),
                        que_reserve_time: NSDate(),
                        que_cancel_time: NSDate())
                    
                    MyVariables.waitingQueueTypeA.append(q)
                    MyVariables.currentRunningTypeA = toBeQueueNo
                    MyVariables.currentQueueId = toBeQueueId
            
            }else if (noOfPerson.integerValue >= MyVariables.defaultBranch.bra_ty_b_min.integerValue &&
                      noOfPerson.integerValue <= MyVariables.defaultBranch.bra_ty_b_max.integerValue) {
                    
                    toBeQueueNo = MyVariables.currentRunningTypeB + 1
                    toBeQueueId = MyVariables.currentQueueId + 1
    
                    //Type B
                    q = Queue(que_id: toBeQueueId,
                        que_type: Constants.QueueType.Front,
                        que_bra_id: 1,
                        que_cus_id: 1,
                        que_status: Constants.QueueStatus.Waiting,
                        que_tb_type: Constants.TableType.B,
                        que_no: toBeQueueNo,
                        que_no_person: noOfPerson,
                        que_child_flag: childFlagString,
                        que_wheel_flag: wheelChairFlagString,
                        que_confirm_code: "358149",
                        que_current_flag: Constants.Flag.NO,
                        que_call_q_time: NSDate(),
                        que_complete_time: NSDate(),
                        que_reserve_time: NSDate(),
                        que_cancel_time: NSDate())
                        
                    MyVariables.waitingQueueTypeB.append(q)
                    MyVariables.currentRunningTypeB = toBeQueueNo
                    MyVariables.currentQueueId = toBeQueueId
                        
             
            }else if (noOfPerson.integerValue >= MyVariables.defaultBranch.bra_ty_c_min.integerValue &&
                      noOfPerson.integerValue <= MyVariables.defaultBranch.bra_ty_c_max.integerValue) {
                        
                    toBeQueueNo = MyVariables.currentRunningTypeC + 1
                    toBeQueueId = MyVariables.currentQueueId + 1
                    
                    //Type C
                    q = Queue(que_id: toBeQueueId,
                        que_type: Constants.QueueType.Front,
                        que_bra_id: 1,
                        que_cus_id: 1,
                        que_status: Constants.QueueStatus.Waiting,
                        que_tb_type: Constants.TableType.C,
                        que_no: toBeQueueNo,
                        que_no_person: noOfPerson,
                        que_child_flag: childFlagString,
                        que_wheel_flag: wheelChairFlagString,
                        que_confirm_code: "358149",
                        que_current_flag: Constants.Flag.NO,
                        que_call_q_time: NSDate(),
                        que_complete_time: NSDate(),
                        que_reserve_time: NSDate(),
                        que_cancel_time: NSDate())
    
                    MyVariables.waitingQueueTypeC.append(q)
                    MyVariables.currentRunningTypeC = toBeQueueNo
                    MyVariables.currentQueueId = toBeQueueId
                        

            }else if (noOfPerson.integerValue >= MyVariables.defaultBranch.bra_ty_d_min.integerValue &&
                      noOfPerson.integerValue <= MyVariables.defaultBranch.bra_ty_d_max.integerValue) {
                    
                    toBeQueueNo = MyVariables.currentRunningTypeD + 1
                    toBeQueueId = MyVariables.currentQueueId + 1
    
                    //Type D
                    q = Queue(que_id: toBeQueueId,
                        que_type: Constants.QueueType.Front,
                        que_bra_id: 1,
                        que_cus_id: 1,
                        que_status: Constants.QueueStatus.Waiting,
                        que_tb_type: Constants.TableType.D,
                        que_no: toBeQueueNo,
                        que_no_person: noOfPerson,
                        que_child_flag: childFlagString,
                        que_wheel_flag: wheelChairFlagString,
                        que_confirm_code: "358149",
                        que_current_flag: Constants.Flag.NO,
                        que_call_q_time: NSDate(),
                        que_complete_time: NSDate(),
                        que_reserve_time: NSDate(),
                        que_cancel_time: NSDate())
                    
                    MyVariables.waitingQueueTypeD.append(q)
                    MyVariables.currentRunningTypeD = toBeQueueNo
                    MyVariables.currentQueueId = toBeQueueId
                        
            }
            
            uiView.queue = queue
            
            
//            var queue = Queue()
//            
//            print("BRANCH ID: \(bra_id)")
//            print("NO. Of Person   : \(noOfPerson)")
//            print("Child Flag      : \(childFlag)")
//            print("Wheelchair Flag : \(wheelchairFlag)")
//            
//            print("A RUNNING Result \(crnObj.cur_ty_a)")
//            print("B RUNNING Result \(crnObj.cur_ty_b)")
//            print("C RUNNING Result \(crnObj.cur_ty_c)")
//            print("D RUNNING Result \(crnObj.cur_ty_d)")
//            
//            print("Branch Name :  \(branch.bra_name) --------- ")
//            
//            //Get Maximum ID
//            self.instance.pullItems()
//            
//            var query : CDTQuery
//            query = CDTCloudantQuery(dataType: "Queue")
//            datastore.performQuery(query, completionHandler: {(results, error) -> Void in
//                if((error) != nil){
//                    print("ERROR --> \(error) ")
//                    queue.que_id = 1
//                }
//                else{
//                    
//                    self.queueList = results as! [Queue]
//                    if(self.queueList.count == 0){
//                        queue.que_id = 1
//                    }else{
//                        var os = NSMutableOrderedSet()
//                        os.addObjectsFromArray(self.queueList)
//                        let sd = NSSortDescriptor(key: "que_id", ascending: true)
//                        os.sortUsingDescriptors([sd])
//                        self.queueList = os.array as! [Queue]
//                    
//                        var temp : Queue = Queue()
//                        temp = self.queueList[self.queueList.count-1]
//                        queue.que_id = temp.que_id.integerValue + 1
//                    }
//                    
//                }
//            })
//            NSThread.sleepForTimeInterval(0.5)
//            
//            var queueNo : NSNumber = 0
//            if (noOfPerson.integerValue >= branch.bra_ty_a_min.integerValue && noOfPerson.integerValue <= branch.bra_ty_a_max.integerValue) {
//                
//                //A Type
//                queue.que_tb_type = Constants.TableType.A
//                
//                //Update current running no into table
//                queueNo = crnObj.cur_ty_a.integerValue + 1
//                crnObj.cur_ty_a = queueNo
//                CurrentRunningNoController().updateCurrentRunningNo(crnObj)
//                
//            }else if(noOfPerson.integerValue >= branch.bra_ty_b_min.integerValue && noOfPerson.integerValue <= branch.bra_ty_b_max.integerValue){
//                
//                //B Type
//                queue.que_tb_type = Constants.TableType.B
//                
//                //Update current running no into table
//                queueNo = crnObj.cur_ty_b.integerValue + 1
//                crnObj.cur_ty_b = queueNo
//                CurrentRunningNoController().updateCurrentRunningNo(crnObj)
//                
//            }else if(noOfPerson.integerValue >= branch.bra_ty_c_min.integerValue && noOfPerson.integerValue <= branch.bra_ty_c_max.integerValue){
//                
//                //C Type
//                queue.que_tb_type = Constants.TableType.C
//                
//                //Update current running no into table
//                queueNo = crnObj.cur_ty_c.integerValue + 1
//                crnObj.cur_ty_c = queueNo
//                CurrentRunningNoController().updateCurrentRunningNo(crnObj)
//                
//            }else if(noOfPerson.integerValue >= branch.bra_ty_d_min.integerValue && noOfPerson.integerValue <= branch.bra_ty_d_max.integerValue){
//                
//                //D Type
//                queue.que_tb_type = Constants.TableType.D
//                
//                //Update current running no into table
//                queueNo = crnObj.cur_ty_d.integerValue + 1
//                crnObj.cur_ty_d = queueNo
//                CurrentRunningNoController().updateCurrentRunningNo(crnObj)
//                
//            }
//            
//            print("Get the queue no : \(queue.que_tb_type) \(queueNo)")
//            
//            //Set Queue Attribute
//            queue.que_type = Constants.QueueType.Front //Default performed by customer
//            queue.que_bra_id = branch.bra_id
//            queue.que_status = Constants.QueueStatus.Waiting
//            queue.que_no = queueNo
//            queue.que_no_person = noOfPerson
//            if(childFlag){
//                queue.que_child_flag = Constants.Flag.YES
//            }else{
//                queue.que_child_flag = Constants.Flag.NO
//            }
//            
//            if(wheelchairFlag){
//                queue.que_wheel_flag = Constants.Flag.YES
//            }else{
//                queue.que_wheel_flag = Constants.Flag.NO
//            }
//            
//            
//            print("----- QUEUE ID: \(queue.que_id) ------ ")
//            
//            //            queue.que_id = 20
//            queue.que_bra_name_display = branch.bra_name
//            queue.que_res_name_display = branch.bra_res_name
//            queue.que_current_flag = Constants.Flag.NO
//            queue.que_reserve_time = NSDate()
//            
//            datastore.save(queue, completionHandler: { (object, error) -> Void in
//                if(error != nil){
//                    print("Error on save queue \(error)")
//                    
//                } else {
//                    queue = object as! Queue
//                    print("Save Queue Successfully")
//                    
//                }
//            })
//            
//            self.instance.pushItems()
//            
//            uiView.queue = queue
            
    }
    func getCurrentQueue(var bra_id: NSNumber, var tb_type : String, uiView: ConfirmBookingViewController) {
        print("QUEUE CONTROLLER [getCurrentQueue] tableType: \(tb_type)")
        uiView.currentQA = MyVariables.currentQueueA
        uiView.currentQB = MyVariables.currentQueueB
        uiView.currentQC = MyVariables.currentQueueC
        uiView.currentQD = MyVariables.currentQueueD
        
        
//        self.instance.pullItems()
//        
//        var queue = Queue()
//        var query : CDTQuery
//        
//        self.queryPredicate = NSPredicate(format: "(que_bra_id = %@ AND que_tb_type = %@ AND que_current_flag = 'Y')", bra_id , tb_type)
//        query = CDTCloudantQuery(dataType: "Queue", withPredicate: self.queryPredicate)
//        self.datastore.performQuery(query, completionHandler: {(results, error) -> Void in
//            if((error) != nil){
//                print(error)
//                
//            }
//            else{
//                if(results.count != 1 ){
//                    print("----- Not Found Current Queue ----")
//                    if(tb_type == Constants.TableType.A){
//                        uiView.currentQA = 0
//                    }else if(tb_type == Constants.TableType.B){
//                        uiView.currentQB = 0
//                    }else if(tb_type == Constants.TableType.C){
//                        uiView.currentQC = 0
//                    }else if(tb_type == Constants.TableType.D){
//                        uiView.currentQD = 0
//                    }
//                    
//                }else{
//                    queue = results[0] as! Queue
//                    print("------ Found Queue \(queue.que_tb_type)\(queue.que_no) ----")
//                    if(tb_type == Constants.TableType.A){
//                        uiView.currentQA = queue.que_no
//                        
//                    }else if(tb_type == Constants.TableType.B){
//                        uiView.currentQB = queue.que_no
//                        
//                    }else if(tb_type == Constants.TableType.C){
//                        uiView.currentQC = queue.que_no
//                        
//                    }else if(tb_type == Constants.TableType.D){
//                        uiView.currentQD = queue.que_no
//                        
//                    }
//                    
//                }
//                
//            }
//            
//        })
        
    }
    func calculateRemainQAndWaitingTime(uiView: ConfirmBookingViewController) -> Void{
        print("QUEUE Controller [calculateRemainQAndWaitingTime] ")
        
        var remainQ : Int = 0
        var estTime : Int = 0
        
        if(uiView.queueObj.que_tb_type == Constants.TableType.A){
            print("Current Queue No: [A\(uiView.currentQA)]")
            
            
            remainQ = uiView.queueObj.que_no.integerValue - uiView.currentQA.integerValue - 1
            estTime = (remainQ + 1) * uiView.branchObj.bra_ty_a_turnover.integerValue
            
            print("Remaining Q: \(remainQ) Que")
            print("Estimate Time: \(estTime) Min")
            
        }else if(uiView.queueObj.que_tb_type == Constants.TableType.B){
            print("Current Queue No: [A\(uiView.currentQB)]")
            
            remainQ = uiView.queueObj.que_no.integerValue - uiView.currentQB.integerValue - 1
            estTime = (remainQ + 1) * uiView.branchObj.bra_ty_b_turnover.integerValue
            
            print("Remaining Q: \(remainQ) Que")
            print("Estimate Time: \(estTime) Min")
            
        }else if(uiView.queueObj.que_tb_type == Constants.TableType.C){
            print("Current Queue No: [A\(uiView.currentQC)]")
            
            remainQ = uiView.queueObj.que_no.integerValue - uiView.currentQC.integerValue - 1
            estTime = (remainQ + 1) * uiView.branchObj.bra_ty_c_turnover.integerValue
            
            print("Remaining Q: \(remainQ) Que")
            print("Estimate Time: \(estTime) Min")
            
        }else if(uiView.queueObj.que_tb_type == Constants.TableType.D){
            print("Current Queue No: [A\(uiView.currentQD)]")
            
            remainQ = uiView.queueObj.que_no.integerValue - uiView.currentQD.integerValue - 1
            estTime = (remainQ + 1) * uiView.branchObj.bra_ty_d_turnover.integerValue
            
            print("Remaining Q: \(remainQ) Que")
            print("Estimate Time: \(estTime) Min")
            
        }
        
        uiView.labelRemainQ.text = "\(remainQ)"
        uiView.labelWaitTime.text = "\(estTime)"
        
    }
    
    
    func createItem(item: Queue) {
        
        self.datastore.save(item, completionHandler: { (object, error) -> Void in
            if(error != nil){
                print("create Item failed with error \(error)")
            } else {
                print("Create Queue Successfully")
                self.instance.pushItems()
            }
        })
    }
    
    func deleteItem(item: Queue) {
        
        self.datastore.delete(item, completionHandler: { (deletedObjectId:String!, deletedRevisionId:String!, error:NSError!) -> Void in
            if(error != nil){
                print("delete Item failed with error \(error)")
            } else {
                print("Delete Queue Successfully")
                self.instance.pushItems()
            }
        })
    }
    
    func updateItem(item: Queue) {
        self.datastore.save(item, completionHandler: { (object, error) -> Void in
            if(error != nil){
                print("updateItem failed with error \(error)")
            } else {
                print("Return object \((object as! Queue).que_no)")
                print("Update queue complete")
                self.instance.pushItems()
            }
        })
    }

    func updateCurrentQItem(item: Queue, uiView : ManageQViewController) {
        if(item.que_tb_type == Constants.TableType.A){
            uiView.curQueueTypeA = item as! Queue
        }else if(item.que_tb_type == Constants.TableType.B){
            uiView.curQueueTypeB = item as! Queue
        }else if(item.que_tb_type == Constants.TableType.C){
            uiView.curQueueTypeC = item as! Queue
        }else if(item.que_tb_type == Constants.TableType.D){
            uiView.curQueueTypeD = item as! Queue
        }

        /*
        self.datastore.save(item, completionHandler: { (object, error) -> Void in
            if(error != nil){
                print("updateItem failed with error \(error)")
            } else {
                if(item.que_tb_type == Constants.TableType.A){
                    uiView.curQueueTypeA = object as! Queue
                }else if(item.que_tb_type == Constants.TableType.B){
                    uiView.curQueueTypeB = object as! Queue
                }else if(item.que_tb_type == Constants.TableType.C){
                    uiView.curQueueTypeC = object as! Queue
                }else if(item.que_tb_type == Constants.TableType.D){
                    uiView.curQueueTypeD = object as! Queue
                }
                print("Return object \((object as! Queue).que_no)")
                print("Update queue complete")
                self.instance.pushItems()
            }
        })*/
    }
    

}
