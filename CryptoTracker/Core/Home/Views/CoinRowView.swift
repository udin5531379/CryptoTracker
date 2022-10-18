//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Udin Rajkarnikar on 10/14/22.
//

import SwiftUI

struct CoinRowView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State var isHoldingShown: Bool
    let coin: CoinModel
    
    var body: some View {
        HStack {
            
            leftColumn
            
            Spacer()
            
            if isHoldingShown {
                midColumn
            }
            
            rightColumn
            
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(isHoldingShown: true, coin: dev.coin)
            .environmentObject(dev.vm)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView {
    
    var leftColumn: some View {
        HStack {
            Text("\(coin.rank)")
                .font(.body)
                .frame(minWidth: 30)
                .foregroundColor(Color.theme.secondary)
            
            Circle()
                .frame(width: 25, height: 25)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
        }
    }
    
    var midColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingValue.currencyToString())
                .fontWeight(.bold)
            Text(coin.currentHoldings?.numberFormatter() ?? "0.00")
        }.foregroundColor(Color.theme.accent)
     }
    
    var rightColumn: some View {
        
        VStack(alignment: .trailing){
            Text(coin.currentPrice.currencyToString())
                .foregroundColor(Color.theme.accent
            )
            
            Text(coin.priceChangePercentage24H?.percentageToString() ?? "0%")
                .foregroundColor( (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }.padding(.leading)
        
    }
    
}
