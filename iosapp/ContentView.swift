
import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var password2: String = ""

    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    @State var sliderValue: Double = 0
    @State var selectedDate = Date();

    var previewOptions = ["Always", "When Unlocked", "Never"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("CREATE PROFILE")) {
                    TextField("Enter Your Username", text: $username)
                    TextField("Enter Your Password", text: $password)
                    TextField("Re-Enter Your Password", text: $password2)


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
                Section(header: Text("DATE OF BIRTH")){
                    VStack {
                                DatePicker("When is your birthday?", selection: $selectedDate,displayedComponents: .date)

                            }.padding()
                }
                Section(header: Text("HORIZONTAL SLIDER & SCROLL")){
                    VStack {
                        Slider(value: $sliderValue, in: 0...100)
                                Text("Current slider value: \(sliderValue, specifier: "%.2f")")
                            }.padding()
                    
                    ScrollView(.horizontal) {
                                    HStack(spacing: 10) {
                                        ForEach(0..<10) { index in
                                            Circle()
                                                .fill(Color.green)
                                                .frame(width: 70, height: 70)
                                                                              }
                                    }.padding()
                                }.frame(height: 100)

                    Link("Submit", destination: URL(string: "https://quicktech.in/")!).padding()
                }
                
            }
            .navigationBarTitle("QuickTech")
            
       

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
