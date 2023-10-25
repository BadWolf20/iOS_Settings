//
//  Canvas.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import SwiftUI

struct myViewCanvas: PreviewProvider {
    static var previews: some View {
        ContView()
    }

    struct ContView: UIViewControllerRepresentable{

        func makeUIViewController(context: Context) -> some MainViewController {
            return MainViewController()
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }

    }

}
