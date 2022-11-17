import Foundation

struct CartProductResult {
    var id: Int
    var title: String
    var quantity: Int
}

let cartProducts = [
    CartProductResult(id: 1, title: "nike shoe 1", quantity: 5), CartProductResult(id: 2, title: "nike shoe 2", quantity: 2), CartProductResult(id: 3, title: "soap", quantity: 6)
]

cartProducts.forEach { productResult in
    print(productResult)
}

extension CartProductResult: CustomStringConvertible {
    var description: String {
        "* \(id) - \(title)"
    }
}
