import Foundation

let json = """
{
  "id": "1",
  "options": [
    {
      "id": "11",
      "options": [
        {
          "id": "111",
          "options": []
} ]
}, {
      "id": "2",
      "options": [
        {
          "id": "21",
          "options": []
}, {
          "id": "22",
          "options": [
            {
              "id": "221",
              "options": []
} ]
} ]
} ]
}
"""

struct JsonModel: Codable {
    let id: String
    let options: [JsonModel]?
}

if let jsonData = json.data(using: .utf8) {
    do {
        let jsonDict = try JSONDecoder().decode(JsonModel.self, from: jsonData)
        printIDs(model: jsonDict)
    } catch {
        print(error)
    }
}

func printIDs(model: JsonModel) {
    if let options = model.options {
        print(model)
        options.forEach { option in
            printIDs(model: option)
        }
    }
}

extension JsonModel: CustomStringConvertible {
    var description: String {
        "id - \(id)"
    }
}
