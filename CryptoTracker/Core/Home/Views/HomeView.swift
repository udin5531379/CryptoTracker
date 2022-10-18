//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Udin Rajkarnikar on 10/13/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio = false
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            VStack{
                
                homeheader
                
                
                if !showPortfolio {
                    allCoinList
                } else {
                    portifolioCoinList
                }
                
                
                Spacer(minLength: 0)
            }
        }
    }
}

extension HomeView {
        
    private var homeheader: some View {
            HStack {
                                    
                ZStack {
                    
                    CircleButtonAnimation(animate: $showPortfolio)
                    
                    CircleButtonView(imageName: showPortfolio ? "plus" : "info")
                    
                }.frame(width: 25, height: 25)
                
                Spacer()
                
                Text(showPortfolio ? "Portfolio" : "Live Prices")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                
                Spacer()
                
                CircleButtonView(imageName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? -180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showPortfolio.toggle()
                        }
                    }
                
            }.padding(.horizontal, 40)
        }
    
    private var allCoinList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(isHoldingShown: false, coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.transition(.move(edge: .leading)) //false huney bela list hataunu paryo teui bhayera teransition function haleyko
            .listStyle(PlainListStyle())
    }
    
    private var portifolioCoinList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(isHoldingShown: false, coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.transition(.move(edge: .trailing))
            .listStyle(PlainListStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
                .environmentObject(dev.vm)
        }
    }
}
