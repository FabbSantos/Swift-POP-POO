import UIKit

// protocol
protocol MusicalInstrument {
    var name: String { get }
    func makeSound() -> String
    func play()
}

// struch
struct Guitar: MusicalInstrument {
    var name: String
    func makeSound() -> String {
        return "Strum"
    }
    func play() {
        print("\(name) goes \(makeSound())")
    }
}

//enum
enum Drum: MusicalInstrument {
case snare, bass, cymbal
    
    var name: String {
        switch self {
        case .snare:
            return "Snare Drum"
        case .bass:
            return "Bass Drum"
        case .cymbal:
            return "Cymbal"
        }
        
    }
    
    func makeSound() -> String {
        switch self {
        case .snare:
            return "Bang"
        case .bass:
            return "Boom"
        case .cymbal:
            return "Crash"
        }
    }
    
    func play() {
        print("\(name) goes \(makeSound())")
    }
}

//colecao
var instruments: [MusicalInstrument] = [
    Guitar(name: "Fender Stratocaster"),
    Drum.snare,
    Drum.bass,
    Drum.cymbal
]

//controle de fluxo
for instrument in instruments {
    instrument.play()
}

//closure
let sortInstruments = {
    instruments.sorted {$0.name < $1.name}
}

//concorrencia

DispatchQueue.global().async {
    let sortedInstruments = sortInstruments()
    DispatchQueue.main.async {
        for instrument in sortedInstruments {
            instrument.play()
        }
    }
}
