//  Extension
// Utilizadas para extender uma classe/struct e agrupar código, facilitando organizando e estruturação de grandes projetos

class Conta {
    var nome: String
    var saldo: Double
    
    init(nome: String, saldo: Double = 0.0) {
        self.nome = nome
        self.saldo = saldo
    }
    
    func sacar(_ valor: Double) {
        self.saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        self.saldo += valor
    }
}

extension Conta {
    func transferir(_ contaDestino: Conta, _ valor: Double) {
        self.sacar(valor)
        contaDestino.depositar(valor)
    }
}

var contaAlex = Conta(nome: "Alex")
var contaCarol = Conta(nome: "Carol")
contaAlex.depositar(100)
print(contaAlex.saldo)
print(contaCarol.saldo)
contaAlex.transferir(contaCarol, 50)
print(contaAlex.saldo)
print(contaCarol.saldo)

func contaCaracteres(_ texto: String) -> Int {
    return texto.count
}

var texto = "Alex"
print(contaCaracteres(texto))

// Não é possível ter propriedade armazenada, apenas computada e estática
extension String {
    
    // var textoAleatorio: String = "" ERRO

    func contaCaracter() -> Int {
        self.count
    }
}

print(texto.contaCaracter())

// Self significa a classe/struct sendo extendida
extension Int {
    func somaNumero(_ com: Self) -> Self {
        return self + com
    }
}

print(10.somaNumero(20))

// Protocolos
// Utilizado para definir métodos e propriedades que precisam ser implementadas quando alguma classe/struct utiliza o protocolo

protocol Account {
    var personName: String { get set }
    var balance: Double { get set }
    
    func deposit(_ amount: Double)
    
    func withdraw(_ amount: Double) -> WithdrawResult
}

enum PaymentType {
    case pix
    case bank_slip
    case account_balance
}

// Associated Values
enum WithdrawResult {
    case success(newBalance: Double)
    case failure(error: String)
}

class CheckingAccount: Account {
    var personName: String
    var balance: Double
    
    init(personName: String, balance: Double = 0.0) {
        self.personName = personName
        self.balance = balance
    }

    func deposit(_ amount: Double) {
        self.balance += amount
    }
    
    func withdraw(_ amount: Double) -> WithdrawResult {
        if amount > self.balance {
            return .failure(error: "Requested amount is greater than account's balance")
        } else {
            self.balance -= amount
            return .success(newBalance: self.balance)
        }
    }
    
    func payCreditCard(_ paymentType: PaymentType) {
        switch paymentType {
        case .pix:
            print("Credit card paid using pix")
        case .bank_slip:
            print("Credit card paid using bank slip")
        case .account_balance:
            print("Credit card paid using account balance")
        }
    }
}

var alexCheckingAccount = CheckingAccount(personName: "Alex", balance: 1000)
print(alexCheckingAccount.balance)
let result = alexCheckingAccount.withdraw(100)

switch result {
case .failure(let error): print(error)
case .success(let newBalance): print("Success! New balance is \(newBalance)")
}

print(alexCheckingAccount.balance)
alexCheckingAccount.payCreditCard(.pix)

// Enumerações

enum Month {
    case january
    case february
    case march, april, may, june, july, august, september, october, november, december
}

var currentMonth = Month.november
var lastMonth: Month = .december

// Raw values
// Valores brutos dos casos de um enum

enum Dinheiro: String {
    case moeda = "Moeda"
    case cedula = "Cédula"
    case virtal = "Virtual"
}

print(Dinheiro.virtal.rawValue)

enum Moeda: Int {
    case um = 1
    case cinco = 5
    case dez = 10
    case vinteCinco = 25
}

print(Moeda.dez.rawValue)

// Desafios - 
