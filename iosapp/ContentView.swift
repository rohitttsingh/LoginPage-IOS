//
//  ContentView.swift
//  iosapp
//
//  Created by Rohit Singh on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    @State var sliderValue: Double = 0

    var previewOptions = ["Always", "When Unlocked", "Never"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Username", text: $username)
                    TextField("Password", text: $username)

                    Toggle(isOn: $isPrivate) {
                        Text("Private Account")
                    }
                }
                
                Section(header: Text("NOTIFICATIONS")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enabled")
                    }
                    Picker(selection: $previewIndex, label: Text("Show Previews")) {
                        ForEach(0 ..< previewOptions.count) {
                            Text(self.previewOptions[$0])
                        }
                    }
                }
                VStack {
                            Slider(value: $sliderValue, in: 0...20)
                            Text("Current slider value: \(sliderValue, specifier: "%.2f")")
                        }.padding()
                ZStack {
                            
                }
                ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    ForEach(0..<10) { index in
                                        Circle()
                                            .fill(Color.yellow)
                                            .frame(width: 70, height: 70)
                                                                          }
                                }.padding()
                            }.frame(height: 100)

                Link("Submit", destination: URL(string: "https://github.com/rohitttsingh")!).padding()
            }
            .navigationBarTitle("Create Account")
            
       

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
