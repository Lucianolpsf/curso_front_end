programa {
  inclua biblioteca Matematica --> mat

  funcao calcula_porcentagem(real numero_porcento, real porcentagem){
    retorne  (numero_porcento * porcentagem)/100
  }

  funcao multiplicacao(real numero, real numero2){
    retorne numero * numero2
  }
  funcao divisao(real numero, real numero2){
    retorne numero / numero2
  }

  funcao raiz_quadrada(inteiro numero){
    retorne mat.raiz(numero, 2)
  }

  funcao valor_de_pi () {
    retorne  mat.PI
  }

  funcao menu (){
    escreva("\nInforme o que deseja realizar. \n")
    escreva("01 - soma \n")
    escreva("02 - subtra��o \n")
    escreva("03 - multiplica��o \n")
    escreva("04 - divis�o \n")
    escreva("05 - raiz quadrada \n")
    escreva("06 - porcentagem \n")
    escreva("07 - valor de pi \n")
    escreva("99 - Sair \n")
  }

  funcao inicio() {
    inteiro opcao, raiz
    real numero_porcento, porcentagem, numero, numero2
    real numero_somado = 0

    enquanto (opcao != 99){
    menu()
    leia(opcao)

    se (opcao == 01){
      limpa()
        enquanto(numero != 00){      
          escreva("informe o numero a ser somado: ")
          leia(numero)
          numero_somado += numero
          escreva(numero_somado, "\n")
        }
    }
    senao se (opcao == 02){
      limpa()
        enquanto(numero != 00){      
          escreva("informe o numero a ser subtraido: ")
          leia(numero)
          numero_somado -= numero
          escreva(numero_somado, "\n")
        }
    }
    senao se (opcao == 03){
      limpa()
      escreva("Informe o numero a ser multiplicado: ")
      leia(numero)
      escreva("Informe o multiplicador: ")
      leia(numero2)
      limpa()
      escreva(multiplicacao(numero, numero2))
    }

    senao se (opcao == 04){
      limpa()
      escreva("Informe o numero a ser dividido: ")
      leia(numero)
      escreva("Informe o divisor: ")
      leia(numero2)
      limpa()
        se (numero == 0 ou numero2 == 0){
          escreva("N�o � possivel divis�es com 0 ")
        }
        senao {
            escreva(divisao(numero, numero2))
        }
      }

    senao se (opcao == 05){
      limpa()
      escreva("Infome o valor que deseja saber a raiz: ")
      leia(raiz)
      limpa()
      escreva(raiz_quadrada(raiz))
    }
    senao se (opcao == 06){
      limpa()
      escreva("Informe o numero desejado: ")
      leia(numero_porcento)
      escreva("\nQual porcentagem deseja saber: ")
      leia(porcentagem)
      limpa()
      escreva(calcula_porcentagem(numero_porcento, porcentagem))
    }
    senao se (opcao == 07){
      limpa()
      escreva(valor_de_pi())
    }

    senao 
    {
      limpa()
      escreva("Informe uma op��o valida! \n")
    }
    }

  }
}
