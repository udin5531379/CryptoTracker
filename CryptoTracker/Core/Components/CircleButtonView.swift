//
//  CircleButtonView.swift
//  CryptoTracker
//
//  Created by Udin Rajkarnikar on 10/13/22.
//

import SwiftUI

struct CircleButtonView: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.callout)
            .foregroundColor(Color.theme.accent)
            .frame(width: 15, height: 15)
            .padding()
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
                    .shadow(color: Color.theme.secondary.opacity(0.7), radius: 10))
            
            
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(imageName: "info")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
