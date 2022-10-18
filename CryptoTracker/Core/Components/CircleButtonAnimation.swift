//
//  CircleButtonAnimation.swift
//  CryptoTracker
//
//  Created by Udin Rajkarnikar on 10/13/22.
//

import SwiftUI

struct CircleButtonAnimation: View {
    
    @Binding var animate : Bool
    
    var body: some View {
             Circle()
                    .stroke(lineWidth: 1)
                    .scale(animate ? 1.5 : 0.0)
                    .opacity(animate ? 0 : 1)
                    .animation(animate ? Animation.easeInOut(duration: 3.0) : .none, value: animate)
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(false))
    }
}
