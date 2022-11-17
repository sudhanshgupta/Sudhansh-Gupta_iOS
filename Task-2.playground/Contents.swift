import Foundation

struct CartProductResult {
    var id: Int
    var title: String
    var quantity: Int
}

let cartProducts = [
    CartProductResult(id: 1, title: "nike shoe 1", quantity: 5), CartProductResult(id: 2, title: "nike shoe 2", quantity: 2), CartProductResult(id: 3, title: "soap", quantity: 6)
]

struct SearchProductResult {
    var id: Int
    var title: String
    var position: Int
}

let productList: [SearchProductResult] = [ SearchProductResult(id: 4, title: "nike shoe 3", position: 1), SearchProductResult(id: 5, title: "pen", position: 2)
]

private func printProducts(_ data: [CustomStringConvertible]) {
    data.forEach { productResult in
        print(productResult)
    }    
}

extension CartProductResult: CustomStringConvertible {
    var description: String {
        "* \(id) - \(title)"
    }
}

extension SearchProductResult: CustomStringConvertible {
    var description: String {
        "* \(id) - \(title)"
    }
}

printProducts(cartProducts)
printProducts(productList)
