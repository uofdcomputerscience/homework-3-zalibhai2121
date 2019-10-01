import Foundation
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word
struct ar: Codable {
    var wordbot : [words]
}

struct words: Codable {
    var w : String
}
let urlString = "https://api.noopschallenge.com/wordbot?count=50"

if let url = URL(string: urlString){

    let request = URLRequest(url: url)
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: request) { (data, response, error) in
        print(String(data:data!, encoding: .utf8))
        let List = try! JSONDecoder().decode(words.self, from: data!)
        print(List)
        var reversed = ""
        for b in List.w{
            String(b.reverse())
            print(b)
        }
        print(reversed)
        print(List.words.count)
    }
    task.resume()
}

