# programação base para NPS em empresas de atendimento ao cliente

chapters = []
nota_e = []
nota_m = []
nota_n = []
fimdia = true

while (fimdia) do
    puts "Bem vindo a nossa pesquisa de satisfação!
    Por favor, atribua uma nota, de 0 a 10, para o nosso atendimento:"
    nota = gets.to_f
    break if nota == -1

case nota
when 0..4
    puts "Poxa, que pena que você se sentiu assim. Conte-nos mais sobre sua experiência para que possamos aprimorar nosso atendimento"
    nota_n = gets.chomp
when 5..8
    puts "Daremos o nosso melhor para aprimorar seu próximo atendimento. Pode nos informar em que nós podemos melhorar?"
    nota_m = gets.chomp
when 9..10
    puts "Que bom que se sentiu satisfeito com nosso atendimento, a sua alegria nos faz mais felizes."
    nota_e = gets.chomp
else
    puts "Que pena, essa não é uma nota válida."
end

puts "Informe aqui o nome do funcionário que lhe atendeu"
  input = gets.chomp
  chapters << input


  puts "Chapters: " + chapters.join(", ")
  puts "Notas negativas: " + notas_n.join(", ")
  puts "Notas medianas: " + notas_m.join(", ")
  puts "Notas Positivas: " + notas_e.join(", ")
# puts "Chegamos ao fim do expediente? (S,N)"
#     fimdia = (gets.upcase.strip != "S")
sleep 3
system "clear"
end
puts ""
puts ""
puts ""
puts "Essas foram todas as notas que recebemos:\n#{nota_n, nota_m, nota_e}"
puts "Essa foi a média relacionada as notas que recebemos:\n#{(nota_n, nota_m, nota_e)/(nota_n + nota_m + nota_e)}"
puts "Essas foram as sugestões relacionadas as notas negativas que recebemos:\n#{nota_n}"
puts "Essas foram as sugestões relacionadas as notas medianas que recebemos:\n#{nota_m}"
puts "Esses foram os funcionários que receberam as melhores notas de atendimento:\n#{chapters}"

