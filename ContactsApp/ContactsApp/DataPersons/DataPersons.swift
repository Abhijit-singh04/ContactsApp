import Foundation

final class DataPersons {
    static var nameList = ["Bob",
                     "Amanda",
                     "Ripley",
                     "Jacob",
                     "Artur",
                     "Michael",
                     "Jenifer",
                     "Alex",
                     "Richel",
                     "Felix",
                     "Marco"]
    static var surnameList = ["Quincy",
                    "Tini",
                    "Fe-fe",
                    "Galgine",
                    "Proper",
                    "Kukri",
                    "Ozon",
                    "Chmure",
                    "Lar",
                    "Marli",
                    "Popus"]
    static var emails = ["q@q.com",
                        "w@w.com",
                        "e@e.com",
                        "r@r.com",
                        "t@t.com",
                        "y@y.com",
                        "u@u.com",
                        "i@i.com",
                        "o@o.com",
                        "p@p.com",
                        "a@a.com"]
    static var phones = ["+375 29 6321039",
                        "+375 25 6377439",
                        "+375 22 0980939",
                        "+375 20 6371139",
                        "+375 11 2038472",
                        "+375 29 6372039",
                        "+375 29 7654321",
                        "+48 503591179",
                        "+375 29 6371233",
                        "+375 29 1111233",
                        "+375 29 8475642"]
    
    static var personArray: [Person] = []
    
    static func getRandomPerson() -> Person? {
        if
            let name = nameList.randomElement(),
            let surname = surnameList.randomElement(),
            let email = emails.randomElement(),
            let phone = phones.randomElement()
        {
            let person = Person(name: name, surname: surname, email: email, phone: phone)
            
            guard
                let nameIndex = nameList.firstIndex(of: name),
                let surnameIndex = surnameList.firstIndex(of: surname),
                let emailIndex = emails.firstIndex(of: email),
                let phoneIndex = phones.firstIndex(of: phone)
            else {
                return nil
            }
            
            phones.remove(at: phoneIndex)
            nameList.remove(at: nameIndex)
            emails.remove(at: emailIndex)
            surnameList.remove(at: surnameIndex)
            
            return person
        }
        return nil
    }
    
    static func fillPersonArray() {
        let number = min(nameList.count, surnameList.count, emails.count, phones.count)
        for _ in 1...number {
            if let person = getRandomPerson() { personArray.append(person) }
        }
    }
}
