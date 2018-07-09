//
//  ViewController.swift
//  NFCDemo
//
//  Created by 王成龙 on 2018/6/27.
//  Copyright © 2018年 charlie. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController ,NFCNDEFReaderSessionDelegate{
//  两个 readerSession 函数会分别告诉我们 NFC 会话成功或失败，成功后则返回 NFCNDEFMessage 格式的通信数据，失败后会返回 error 信息。
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("\(error)")
        print("The session was invalidated:\(error.localizedDescription)")

    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("\(messages)")
    }
    
    private var nfcSession : NFCNDEFReaderSession!
    private var nfcMessage : [[NFCNDEFMessage]] = []
    
    @IBOutlet weak var messageLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//  首先还需要初始化 NFCNDEFReaderSession 并开启 NFC 监听。
    @IBAction func BeginScan(_ sender: Any) {
        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession.begin()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

