//
//  TextFieldNotifier.swift
//  CustomTextField
//
//  Created by Ivan Kvasov on 06.05.2021.
//

import SwiftUI

class TextFieldNotifier: ObservableObject {
    
    // Views
    @Published var leftView: AnyView?
    @Published var rightView: AnyView?
    
    // Other
    @Published var isSecureTextField: Bool = false

}
