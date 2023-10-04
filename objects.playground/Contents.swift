import UIKit

//classe base
class MusicalInstrument {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func makeSound() -> String {
        return ""
    }
    func play () {
        print("\(name) goes \(makeSound())")
    }
}

//subclasse

class Guitar: MusicalInstrument {
    override func makeSound() -> String {
        return "Strum"
    }
}

//subclasse

class Drum: MusicalInstrument {
    var type: String
    
    init(type: String) {
        self.type = type
        super.init( name: type + " Drum")
    }
    override func makeSound() -> String {
        switch type {
        case "Snare":
            return "Bang"
        case "Bass":
            return "Boom"
        case "Cymbal":
            return "Crash"
        default:
            return ""
        }
    }
}

//colecao

var instruments: [MusicalInstrument] = [
    Guitar(name:"Fender Stratocaster"),
    Drum( type: "Snare" ),
    Drum( type: "Bass" ),
    Drum( type: "Cymbal" )
]


//controle de fluxo

for instrument in instruments {
    instrument.play()
}

//closure

let sortedInstruments = {
    instruments.sorted {$0.name < $1.name}
}

//concorrencia

DispatchQueue.global().async {
    let sortedInstruments = sortedInstruments()
    DispatchQueue.main.async {
        for instrument in sortedInstruments {
            instrument.play()
        }
    }
}
