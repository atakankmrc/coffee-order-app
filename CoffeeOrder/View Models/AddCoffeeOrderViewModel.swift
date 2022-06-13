//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrder
//
//  Created by Atakan Kömürcü on 8.06.2022.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webservice: Webservice
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webservice = Webservice()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        
        let order = Order(name: self.name, coffeeName: self.coffeeName, size: self.size, total: self.total)
        
        self.webservice.createCoffeeOrder(order: order) { _ in
            //completion of place order
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
}
