//
//  ContentView.swift
//  CoffeeOrder
//
//  Created by Atakan Kömürcü on 4.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            
            OrderListView(orders: self.orderListVM.orders)
            
            .sheet(isPresented: $showModal) {
                AddCoffeeOrderView(isPresented: self.$showModal)
            }
            
            .navigationBarTitle("Coffee Orders")
            .navigationBarItems(leading: Button(action: reloadOrders) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(Color.blue)
            }, trailing: Button(action: showAddCoffeeOrderView, label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.blue)
            }))
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
