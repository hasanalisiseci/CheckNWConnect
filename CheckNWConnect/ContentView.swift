//
//  ContentView.swift
//  CheckNWConnect
//
//  Created by Hasan Ali Şişeci on 11.12.2020.
//

import SwiftUI
 
struct ContentView: View {
    
    //Oluşturduğumuz sınıftan izlenebilir bir nesne yarattık
    @ObservedObject var monitor = NetworkMonitor()
    @State private var showAlertSheet = false
    
    var body: some View {
        VStack {
            //Ekranımıza ağ erişiminin durumunu gösterecek bir ikon ve yazı ekliyoruz.
            //Basit if kontrolü ile gösterilecek ikonu ve yazıyı belirliyoruz
            Image(systemName: monitor.isConnected ? "wifi" : "wifi.slash")
                .font(.system(size: 70))
            Text(monitor.isConnected ? "Connected" : "Not Connected")
                .padding()
            
            //Ağ isteği gerçekleştirecek bir buton ekliyoruz. monitor üzerinde gerçekleştirdiği isteğin durumuna ekranımızda alert gösteriyor.
            Button("Perform Network Request") {
                self.showAlertSheet = true
                }
            }.alert(isPresented: $showAlertSheet, content: {
                if monitor.isConnected {
                    return Alert(title: Text("Success!"), message: Text("The network request can be perfomed"), dismissButton: .default(Text("Ok")))
                } else {
                    return Alert(title: Text("Not Connected!"), message: Text("Please enable Wifi or Cellular Data"), dismissButton: .default(Text("Cancel")))
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

