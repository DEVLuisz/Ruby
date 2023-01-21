def welcome
  puts
  puts "        P  /_\\  P                              "
  puts "       /_\\_|_|_/_\\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        "
  puts "        \\__|_|__/                              "
  puts "             Made by Shrieker                    "
  puts
  puts "Qual o seu nome?"
  nome = gets.strip
  puts "Começaremos o jogo para você, #{nome}"
  puts
  return nome
end

def dificuldades
  puts "Qual o nível de dificuldade deseja?"
  puts "1 - GG Easy (Normie Beta), 2 - TryHard, 3 - Sem Piedade, 4 - Suprema Divindade, 5 - Sigma Transcendental"
  dificuldade = gets.to_i
end

def escolhe_numero_seceto(dificulade)
  case dificulade
  when 1
    maximo = 35
  when 2
    maximo = 70
  when 3
    maximo = 140
  when 4
    maximo = 220
    else
    maximo = 300
  end


  puts "Escolhendo um número secreto entre 1 e #{maximo}."
  numero_sorteado = rand(maximo) + 1
  puts
  return numero_sorteado
end

def numero(chutes, tentativa, attemps_limit)
  puts
  puts "Tentativa: #{tentativa} de #{attemps_limit}"
  puts "Chutes até agora: #{chutes}"
  puts "Chute um número"
  chute = gets.strip
  puts "Você chutou: #{chute}"
  return  chute.to_i
end

def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

def win_or_lose(numero_secreto, chute)
  winner = numero_secreto == chute

  if winner
    ganhou
    return true
  else
    maior = numero_secreto > chute
    if maior
      puts "O número secreto é maior!"
      return false
    else
      puts "O número secreto é menor!"
      return false
    end
  end
end

def lets_play (nome, dificuldade)
  numero_secreto = escolhe_numero_seceto(dificuldade)

  pontos = 1000
  attemps_limit = 5
  chutes = []

  for tentativa in 1..attemps_limit

    chute = numero(chutes, tentativa, attemps_limit)
    chutes << chute

    # if nome == "Shrieker"
    #   ganhou
    #   break
    # end

    pontos_perdidos = (chute - numero_secreto).abs / 2.0
    pontos -= pontos_perdidos

    if win_or_lose(numero_secreto, chute)
      break
    end

  end

  puts
  puts "O número secreto era: #{numero_secreto}."
  puts "#{nome}. Você ganhou: #{pontos} pontos."
end

def wanna_play
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "S"
end

nome = welcome
dificuldade = dificuldades

loop do
  lets_play(nome, dificuldade)
  if !wanna_play
    break
  end
end

