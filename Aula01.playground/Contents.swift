// Structs

// Atributos == variáveis(var/let) de uma estrutura
// Métodos == funções(func) de uma estrutura
// Adicionar mutating antes de func permite que o método altere os atributos da estrutura

struct ContaCorrenteStruct {
    var saldo = 0.0
    var nome: String
    
    mutating func depositar(_ valor: Double) {
        saldo += valor
    }
    
    mutating func sacar(_ valor: Double) {
        saldo -= valor
    }
}

var contaAlex = ContaCorrenteStruct(nome: "Alex")
contaAlex.depositar(1000)
print(contaAlex.saldo)
contaAlex.sacar(300)
print(contaAlex.saldo)
print(contaAlex.nome)

// Classes

class ContaCorrenteClass {
    var saldo: Double
    var nome: String
    
    init(saldo: Double = 0.0, nome: String) {
        self.saldo = saldo
        self.nome = nome
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
}

let contaVirtualAlex: ContaCorrenteClass = .init(nome: "Alex")
contaVirtualAlex.depositar(1000)
print(contaVirtualAlex.saldo)
contaVirtualAlex.sacar(300)
print(contaVirtualAlex.saldo)
print(contaVirtualAlex.nome)

// Paradigma Orientado a Objetos
// Classe/Struct são modelos de uma entidade, e a partir do modelo podemos criar vários objetos com os mesmos comportamentos, atributos e métodos
// Um paradigma é o estilo/estrutura que nosso programa/código terá
// Exemplos: Imperativo, funcional, orientado a objetos
// Orientação a objetos, representar coisas do mundo real em código

// Diferenças
// Struct não precisa declarar construtor/inicializador
// Struct precisa de mutating quando a função altera atributos
// Objeto de Struct não pode ser atribuido para let
// Struct usa atribuição por valor, Class usa atribuição por referência
// Class possui herança

// Desafio - Calculadora
print("### Desafio - Calculadora")

struct Calculadora {
    var numero1: Double
    var numero2: Double
    
    func soma() -> Double {
        return self.numero1 + self.numero2
    }
    
    func subtrair() -> Double {
        return self.numero1 - self.numero2
    }
    
    func dividir() -> Double {
        return self.numero1 / self.numero2
    }
    
    func multiplicar() -> Double {
        return self.numero1 * self.numero2
    }
}

var calculadora = Calculadora(numero1: 6, numero2: 4)
print("Soma = \(calculadora.soma())")
print("Subtração = \(calculadora.subtrair())")
print("Divisão = \(calculadora.dividir())")
print("Multiplicação = \(calculadora.multiplicar())")

print("###")

// Desafio - Restaurante
print("### Desafio - Restaurante")

struct Restaurante {
    var nome: String
    var tipoComida: String
    var quantidadePedidos: Int = 0
    let valorPorPedido: Int = 35
    
    mutating func recebePedido() {
        self.quantidadePedidos += 1
    }
    
    func calculaTotalPedidos() -> Int {
        return quantidadePedidos * valorPorPedido
    }
}

var restaurante = Restaurante(nome: "Japa Haus", tipoComida: "Japonesa")
restaurante.recebePedido()
restaurante.recebePedido()
restaurante.recebePedido()
print("O total de pedidos foi R$ \(restaurante.calculaTotalPedidos()) reais para \(restaurante.nome)")

print("###")

// Desafio - Restaurante
print("### Desafio - Retângulo")

struct Retangulo {
    var base: Double
    var altura: Double
    
    func calculaArea() -> Double {
        return base * altura
    }
    
    func calculaPerimetro() -> Double {
        return (base + altura) * 2
    }
}

var retangulo = Retangulo(base: 11.5, altura: 8.5)
print("Calculo da área é \(retangulo.calculaArea())")
print("Calculo do perimêtro é \(retangulo.calculaPerimetro())")

print("###")
