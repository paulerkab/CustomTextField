//
//  NewTextField.swift
//  CustomTextField
//
//  Created by Ivan Kvasov on 06.05.2021.
//

import SwiftUI

struct newTextField: View {
    
    @State var email = ""
    @State var date = ""
    @State var password = ""
    
    @State var dateD = Date()
    
    @Namespace var animation
    
    var body: some View {
        
        VStack{
            
            Spacer(minLength: 0)
            
           
            CustomTextField(title: "Email", value: $email, animation: animation)
            
            CustomTextField(title: "Password", value: $password, animation: animation)
                .isSecureTextField(true)
            
            CustomTextField(title: "Date", value: $date, animation: animation)
                .rightView(
                    {
                        ZStack {
                            DatePicker("label", selection: $dateD, displayedComponents: [.date])
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                                .onChange(of: dateD) { (str) in
                                    date = DateFormatter.formate.string(from: dateD)
                                }
                            Image(systemName: "calendar.badge.exclamationmark")
                                .userInteractionDisabled()
                        }.frame(width: 22, height: 22, alignment: .center)
                    }
                )
                        
            Spacer(minLength: 0)
            

        }
        
    }
    
}


extension DateFormatter {
    static var formate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }
}

struct NoHitTesting: ViewModifier {
    func body(content: Content) -> some View {
        SwiftUIWrapper { content }.allowsHitTesting(false)
    }
}

extension View {
    func userInteractionDisabled() -> some View {
        self.modifier(NoHitTesting())
    }
}

struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}
