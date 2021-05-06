//
//  NewTextField.swift
//  CustomTextField
//
//  Created by Ivan Kvasov on 06.05.2021.
//

import SwiftUI

struct newTextField: View {
    
    @State var labelMotconsu = ""
    @State var dateMotconsu = ""
    
    @State var dateMotconsuDate = Date()
    
    @Namespace var animation
    
    var body: some View {
        
        VStack{
            
            Spacer(minLength: 0)
            
           
            CustomTextField(title: "Название записи", value: $labelMotconsu, animation: animation)
            
            CustomTextField(title: "Дата записи", value: $dateMotconsu, animation: animation)
                .rightView(
                    {
                        ZStack {
                            DatePicker("label", selection: $dateMotconsuDate, displayedComponents: [.date])
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                                .onChange(of: dateMotconsuDate) { (date) in
                                    dateMotconsu = DateFormatter.formate.string(from: dateMotconsuDate)
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
