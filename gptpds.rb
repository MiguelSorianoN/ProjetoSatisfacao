# Inicializa um hash vazio para armazenar as respostas
respostas = {}

# Gera um código único para o cliente
def gerar_codigo
  rand(1000000..9999999).to_s
end

# Pergunta ao usuário o nome dele
puts "Olá! Qual é o seu nome?"
nome = gets.chomp

# Verifica se o cliente já respondeu à pesquisa hoje
if respostas.values.any? { |r| r[:nome] == nome && r[:data] == Date.today }
  puts "Desculpe, #{nome}, mas você já respondeu à pesquisa hoje. Obrigado de qualquer forma!"
else
  # Gera um código único para o cliente
  codigo = gerar_codigo

  # Pergunta ao usuário o quão satisfeito ele está com um produto/serviço
  puts "Olá, #{nome}! Em uma escala de 1 a 10, o quão satisfeito você está com nosso produto/serviço?"
  puts "Digite um número de 1 a 10, onde 1 a 3 são Ruim, 4 a 6 são Mediano, 7 e 8 são Bom e 9 a 10 são Excelente."
  satisfacao = gets.chomp.to_i

  # Verifica se o número inserido pelo usuário é válido
  while satisfacao < 1 || satisfacao > 10
    puts "Por favor, digite um número de 1 a 10."
    satisfacao = gets.chomp.to_i
  end

  # Categoriza a resposta do usuário com base na escala
  case satisfacao
  when 1..3
    categoria = "Ruim"
  when 4..6
    categoria = "Mediano"
  when 7..8
    categoria = "Bom"
  else
    categoria = "Excelente"
  end

  # Adiciona a resposta do usuário ao hash de respostas
  respostas[codigo] = { nome: nome, satisfacao: satisfacao, categoria: categoria}

  # Agradece ao usuário pela participação na pesquisa e exibe o código único
  puts "Obrigado por nos informar sua satisfação, #{nome}!"
  puts "Seu código único de resposta é: #{codigo}"
end

# Exibe as respostas do dia
puts "Respostas de hoje:"
respostas.select .each do |codigo, resposta|
  puts "#{resposta[:nome]} (Código: #{codigo}) - #{resposta[:categoria]}"
end
# { |_, r| r[:data] == Date.today }
# , data: Date.today 
