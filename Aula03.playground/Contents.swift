// Propriedades

class Conta {
    // Propriedades armazenadas
    // Atributos variáveis que assumem valor na inicialização e podem ser alterados
    var nome: String
    
    // Observadores de propriedade
    var saldo: Double {
        willSet(novoValor) {
            print("Saldo será alterado, novo valor de \(novoValor)")
        }
        didSet {
            print("Saldo foi alterado, valor antigo era \(oldValue)")
        }
    }
    
    // Propriedade computada
    // Atributo da instância, executa o bloco ao ser chamado
    var negativado: Bool {
        return saldo < 0
    }
    
    // Propriedade estática
    // Atributo da classe, não da instância. Não pode ser alterado
    static let taxaTransferencia: Double = 0.10
    
    init(nome: String, saldo: Double = 0.0) {
        self.nome = nome
        self.saldo = saldo
    }
    
    func depositar(_ valor: Double) {
        self.saldo += valor
    }
    
    func sacar(_ valor: Double) {
        self.saldo -= valor
    }
}

var contaAlex = Conta(nome: "Alex")
print(contaAlex.saldo)
print(contaAlex.negativado)
contaAlex.sacar(20)
print(contaAlex.saldo)
print(contaAlex.negativado)
contaAlex.depositar(100)
print(contaAlex.saldo)
print(contaAlex.negativado)
print(Conta.taxaTransferencia)

// Desafio - Propriedades computadas

struct Pessoa {
    var nome: String
    var idade: Int
    var altura: Double
    var peso: Double
    
    // usamos a palavra-chave private antes de métodos/atributos para torna-los de uso restrito, somente interno
    private var imc: Double {
        return self.peso / (self.altura * self.altura)
    }
    
    var adulto: Bool {
        return idade >= 18
    }
}

var alexPessoa = Pessoa(nome: "Alex", idade: 28, altura: 1.73, peso: 63.0)
//print("IMC: \(alexPessoa.imc)") ERRO devido uso do private
print("\(alexPessoa.nome) é adulto? \(alexPessoa.adulto ? "Sim" : "Não")!")

// Desafio - Observadores de propriedades

class Empregado {
    var nome: String
    var salario: Double {
        willSet {
            if newValue > salario {
                print("Parabéns, você recebeu uma promoção!")
            } else if newValue == salario {
                print("Parece que não houve uma promoção dessa vez.")
            }
        }
        didSet {
            if oldValue > salario {
                print("O novo salário não pode ser menor do que era anteriormente.")
                salario = oldValue
            }
        }
    }
    
    init(nome: String, salario: Double) {
        self.nome = nome
        self.salario = salario
    }
    
}


var alexEmpregado = Empregado(nome: "Alex", salario: 1000)
alexEmpregado.salario = 1000
print(alexEmpregado.salario)
alexEmpregado.salario = 900
print(alexEmpregado.salario)
