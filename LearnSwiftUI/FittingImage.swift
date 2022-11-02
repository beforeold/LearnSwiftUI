//
//  FittingImage.swift
//  LearnSwiftUI
//
//  Created by beforeold on 2022/11/2.
//

import SwiftUI

// documentation
// https://developer.apple.com/documentation/swiftui/fitting-images-into-available-space

private let imageUrl = "https://docs-assets.developer.apple.com/published/9171798f66624fb18c9f216d85d85ad3/SwiftUI-FIIAS-Landscape_4-original.jpg"

struct FittingImage: View {
    var body: some View {
        Image("Landscape_4")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 400, alignment: .topLeading)
            .clipped(antialiased: false)
            .border(.blue)
    }
}

struct FittingImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FittingImage()
        }
    }
}
