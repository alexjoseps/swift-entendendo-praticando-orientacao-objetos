// Herança e Polimorfismo

class Conta {
    var saldo: Double
    var nome: String

    init(saldo: Double = 0.0, nome: String) {
        self.saldo = saldo
        self.nome = nome
    }
    
    func depositar(_ valor: Double) {
        self.saldo += valor
    }
    
    func sacar(_ valor: Double) {
        self.saldo -= valor
    }
}

class ContaCorrente: Conta {
    func solicitaEmprestimo(_ valor: Double) {
        print("Solicitando empréstimo no valor de \(valor)")
        super.depositar(valor)
    }
    
    override func sacar(_ valor: Double) {
        self.saldo -= valor + 5
    }
}

class ContaPoupanca: Conta {
    var possuiCartaoDebito: Bool
    
    init(nome: String, possuiCartaoDebito: Bool) {
        self.possuiCartaoDebito = possuiCartaoDebito
        super.init(nome: nome)
    }

    func solicitaCartaoDebito() {
        self.possuiCartaoDebito = true
        print("Solicitando cartão de débito")
    }
    
    override func sacar(_ valor: Double) {
        self.saldo -= valor  + 10
    }
    
}


let contaCorrenteAlex = ContaCorrente(nome: "Alex Corrente")
print(contaCorrenteAlex.saldo)
contaCorrenteAlex.depositar(500)
print(contaCorrenteAlex.saldo)
contaCorrenteAlex.solicitaEmprestimo(20000)
print(contaCorrenteAlex.saldo)
contaCorrenteAlex.sacar(350)
print(contaCorrenteAlex.saldo)

let contaPoupancaAlex = ContaPoupanca(nome: "Alex Poupança", possuiCartaoDebito: false)
print(contaPoupancaAlex.saldo)
contaPoupancaAlex.depositar(100)
print(contaPoupancaAlex.saldo)
contaPoupancaAlex.solicitaCartaoDebito
contaPoupancaAlex.sacar(50)
print(contaPoupancaAlex.saldo)

final class Pessoa {
    var nome: String
    
    init(nome: String) {
        self.nome = nome
    }
}

// ERRO
//class Estudante: Pessoa {
//    
//}

print("####")

func exibeSaldo(_ conta: Conta) {
    if conta is ContaCorrente {
        print("Conta corrente recebida")
    }
    
    if let contaCorrente = conta as? ContaCorrente {
        contaCorrente.solicitaEmprestimo(100)
    }
    
    guard let contaPoupanca = conta as? ContaPoupanca else {
        print(conta.saldo)

        return
    }
    
    print("Possui cartão débito: \(contaPoupanca.possuiCartaoDebito)")
    print(conta.saldo)

    // Forçar os desembrulho, não fazer
//    var contaCorrente2 = conta as! ContaCorrente
//    contaCorrente2.solicitaEmprestimo(100)
}

exibeSaldo(contaCorrenteAlex)
exibeSaldo(contaPoupancaAlex)
