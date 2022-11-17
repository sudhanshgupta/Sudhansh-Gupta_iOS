import Foundation

struct CartProductResult {
    var id: Int
    var title: String
    var quantity: Int
}

let cartProducts = [
CartProductResult(id: 1, title: "nike shoe 1", quantity: 5), CartProductResult(id: 2, title: "nike shoe 2", quantity: 2), CartProductResult(id: 3, title: "soap", quantity: 6)
]

func printWithDelay(product1: CartProductResult, product2: CartProductResult, completion: (@escaping ()-> Void)) {
    print("Wait 1 second")
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
        print(product1)
        print("Wait 1 second")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            print(product2)
            completion()
        })
    })
}

printWithDelay(product1: cartProducts[0], product2: cartProducts[1]) {
    print("Done printing products")
}

extension CartProductResult: CustomStringConvertible {
    var description: String {
        "* \(id) - \(title)"
    }
}
