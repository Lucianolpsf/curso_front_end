programa{
  /*  Aula 110: Jogo da velha com fun��es e procedimentos.
   *   
   *     |  |
   *   --------
   *     |  |
   *   --------
   *     |  |
   * 
   * Escrito por Wagner Gaspar
   * Mar�o de 2021
  */

  // vari�veis globais
  caracter jogo[3][3]
  inteiro linha, coluna, l, c

  funcao inicializarJogo(){
    para(l = 0; l < 3; l++){
      para(c = 0; c < 3; c++)
        jogo[l][c] = ' '
    }
  }

  // procedimento para imprimir o jogo
  funcao imprimirJogo(){
    escreva("\n\n 0   1    2\n\n")
    para(l = 0; l < 3; l++){
      para(c = 0; c < 3; c++){
        escreva(" ", jogo[l][c])
        se(c < 2)
          escreva(" | ")
        se(c == 2)
          escreva("  ", l)
      }
      se(l < 2)
        escreva("\n------------")
      escreva("\n")
    }
  }

  // procedimento para ler as coordenadas digitadas pelo usu�rio
  funcao lerCoordenadas(inteiro jogador){
    faca{
      faca{
        escreva("\nJogador ",jogador, " digite linha e coluna da posi��o desejada: ")
        leia(linha, coluna)
      }enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
    }enquanto(jogo[linha][coluna] != ' ')
  }

  // fun��o para atualizar o jogador
  funcao inteiro atualizarJogador(inteiro jogador){
    se(jogador == 1)
      jogador = 2
    senao
      jogador = 1
    retorne jogador
  }

  // fun��o para salvar uma jogada
  funcao inteiro salvarJogada(inteiro jogador){
    se(jogador == 1)
      jogo[linha][coluna] = '0'
    senao
      jogo[linha][coluna] = 'X'
    retorne 1
  }

  // fun��o que verifica se jogador ganhou por linha
  funcao inteiro ganhouPorLinha(caracter c){
    para(l = 0; l < 3; l++){
      se(jogo[l][0] == c e jogo[l][1] == c e jogo[l][2] == c)
        retorne 1 // jogador ganhou
    }
    retorne 0 // jogador n�o ganhou
  }

  // fun��o que utiliza a fun��o anterior para os dois jogadores
  funcao inteiro ganhouPorLinhas(){
    se(ganhouPorLinha('0') == 1)
      retorne 1 // jogador 1 ganhou
    se(ganhouPorLinha('X') == 1)
      retorne 2 // jogador 2 ganhou
    retorne 0 // ningu�m ganhou
  }

  // fun��o que verifica se algu�m ganhou por coluna
  funcao inteiro ganhouPorColuna(caracter s){
    para(c = 0; c < 3; c++){
      se(jogo[0][c] == s e jogo[1][c] == s e jogo[2][c] == s)
        retorne 1 // jogador ganhou
    }
    retorne 0 // ningu�m ganhou
  }

  // fun��o que faz uso da fun��o anterior para verificar vit�ria em todas as colunas
  funcao inteiro ganhouPorColunas(){
    se(ganhouPorColuna('0') == 1)
      retorne 1 // jogador 1 venceu
    se(ganhouPorColuna('X') == 1)
      retorne 2 // jogador 2 venceu
    retorne 0 // ningu�m venceu ainda
  }

  // fun��o que verifica se algu�m ganhou na diagonal principal
  funcao inteiro ganhouNaDiagPrincipal(caracter s){
    se(jogo[0][0] == s e jogo[1][1] == s e jogo[2][2] == s)
      retorne 1
    retorne 0
  }

  // fun��o que retornar quem foi o ganhador pela diagonal principal
  funcao inteiro ganhadorDiagPrincipal(){
    se(ganhouNaDiagPrincipal('0') == 1)
      retorne 1
    se(ganhouNaDiagPrincipal('X') == 1)
      retorne 2
    retorne 0
  }

  // fun��o que verifica se algu�m ganhou na dig secund�ria
  funcao inteiro ganhouDiagSecundaria(caracter s){
    se(jogo[0][2] == s e jogo[1][1] == s e jogo[2][0] == s)
      retorne 1
    retorne 0
  }

  // fun��o que retornar quem foi o ganhador pela diagonal secund�ria
  funcao inteiro ganhadorDiagSecundaria(){
    se(ganhouDiagSecundaria('0') == 1)
      retorne 1
    se(ganhouDiagSecundaria('X') == 1)
      retorne 2
    retorne 0
  }

  // fun��o para o loop do jogo
  funcao inteiro jogar(inteiro jogador, inteiro jogadas, inteiro ganhou){
    faca{
      imprimirJogo() // impress�o do tabuleiro
      lerCoordenadas(jogador) // ler coordenadas
      
      // salvar cordenadas
      jogadas += salvarJogada(jogador)
      jogador = atualizarJogador(jogador)
      
      ganhou += ganhouPorLinhas()// verificar ganhador por linhas
      ganhou += ganhouPorColunas()// verificar ganhador por colunas
      ganhou += ganhadorDiagPrincipal()// verificar ganhador na diagonal principal      
      ganhou += ganhadorDiagSecundaria()// verificar ganhador na diagonal secund�ria
    }enquanto(ganhou == 0 e jogadas < 9)

    retorne ganhou
  }
  
  
  funcao inicio(){

    inteiro jogador, ganhou, jogadas, opcao

    faca{
      jogador = 1
      ganhou = 0
      jogadas = 0

      inicializarJogo()
  
      ganhou = jogar(jogador, jogadas, ganhou)
  
      // impress�o do tabuleiro
      imprimirJogo()
  
      se(ganhou == 1)
        escreva("\n\tParab�ns Jogador 1. Voc� ganhou!\n\n")

      se(ganhou == 2)
        escreva("\n\tParab�ns Jogador 2. Voc� ganhou!\n\n")
  
      escreva("Digite 1 para jogar novamente: ")
      leia(opcao)
    }enquanto(opcao == 1)
  }
}