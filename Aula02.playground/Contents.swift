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

// Desafio - Registrando o empregado e gerente

class Empregado {
    var nome: String
    var salario: Double
    
    init(nome: String, salario: Double) {
        self.nome = nome
        self.salario = salario
    }
}

class Gerente: Empregado {
    var departamento: String
    
    init(nome: String, salario: Double, departamento: String) {
        self.departamento = departamento
        super.init(nome: nome, salario: salario)
    }
}

var alexEmpregado = Empregado(nome: "Alex", salario: 5100.90)
var alexGerente = Gerente(nome: "Alex Gerente", salario: 25000, departamento: "TI")

// Desafio - Calculando o salário do vendedor

class Vendedor: Empregado {
    func percentualComissao(_ quantidadeVendas: Int) -> Double {
        var valorPorVenda = 50.0
        var valorComissao = Double(quantidadeVendas) * (valorPorVenda * 0.10)

        return self.salario + valorComissao
    }
}

var alexVendedor = Vendedor(nome: "Alex Vendedor", salario: 1500)
print(alexVendedor.percentualComissao(10))

// Desafio - Verificando tipos

func verificaTipo(_ empregado: Empregado) {
    if let gerente = empregado as? Gerente {
        print("O(a) empregado(a) \(gerente.nome) é um(a) gerente e está no departamento \(gerente.departamento).")
    } else if let vendedor = empregado as? Vendedor {
        print("O(a) empregado(a) \(vendedor.nome) é um(a) vendedor.")
    } else {
        print("\(empregado.nome) é um empregado.")
    }
}

verificaTipo(alexGerente)
verificaTipo(alexVendedor)
verificaTipo(alexEmpregado)
