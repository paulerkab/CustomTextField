//
//  TextField.swift
//  CustomTextField
//
//  Created by Ivan Kvasov on 06.05.2021.
//

import SwiftUI

struct CustomTextField: View {
    
    var title: String
    @Binding var value: String
    
    var animation: Namespace.ID
    
    @ObservedObject var notifier = TextFieldNotifier()
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(alignment: .bottom, spacing: 15){
                    
                    notifier.leftView
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        if value != ""{
                            
                            Text(title)
                                .font(.caption)
                                .foregroundColor(.black)
                                .matchedGeometryEffect(id: title, in: animation)
                        }
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            
                            if value == ""{
                                
                                Text(title)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .matchedGeometryEffect(id: title, in: animation)
                            }
                            
                            if notifier.isSecureTextField{
                                
                                SecureField("", text: $value)
                            }
                            else{
                                TextField("", text: $value)
                               
                            }
                        } //ZStack
                    } //VStack3
                    
                    notifier.rightView
                    
                } //HStack
                Rectangle()
                    .fill(value == "" ? Color.gray : Color.black)
                    .frame(height: 1)
                    .padding(.top, 10)
            } //VStack2
            
            if value == ""{
                
                Divider()
            }
        } //VStack1
        .padding(.horizontal)
        .padding(.vertical,10)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(value == "" ? 0 : 0.1), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(value == "" ? 0 : 0.05), radius: 5, x: -5, y: -5)
        .padding(.horizontal)
        .padding(.top)
        .animation(.linear)
    }
}


extension CustomTextField {
    // left view.
    public func leftView<LRView: View>(@ViewBuilder _ view: @escaping () -> LRView) -> Self {
        notifier.leftView = AnyView(view())
        return self
    }
    
    // right view.
    public func rightView<LRView: View>(@ViewBuilder _ view: @escaping () -> LRView) -> Self {
        notifier.rightView = AnyView(view())
        return self
    }
}

extension CustomTextField {

    public func isSecureTextField(_ isSecure: Bool) -> Self {
        notifier.isSecureTextField = isSecure
        return self
    }

}
