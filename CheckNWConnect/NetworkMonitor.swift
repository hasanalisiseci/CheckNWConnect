//
//  NetworkMonitor.swift
//  CheckNWConnect
//
//  Created by Hasan Ali Şişeci on 11.12.2020.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
    }
    
}
