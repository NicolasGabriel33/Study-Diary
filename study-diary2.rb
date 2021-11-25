require 'io/console'
require_relative 'study-item2'

REGISTER  = 1
LIST_ALL  = 2
SEARCH    = 3
ERASE     = 4
EXIT      = 5

def menu
  print <<~MENU
  ___________________________________
  [#{REGISTER}] Cadastrar itens de estudo.
  [#{LIST_ALL}] Ver todos itens cadastrados.
  [#{SEARCH}] Buscar itens de estudo,
  [#{ERASE}] Apagar itens selecionados.
  [#{EXIT}] Sair.
  ___________________________________
  MENU
end

def menu_categorias
  print <<-MENU_CATEGORIAS
    #{StudyItem2.categories}
  MENU_CATEGORIAS
end

def wait_and_clear
  puts "\nPressione qualquer tecla para continuar."
  STDIN.getch
  system 'clear'
end

system 'clear'
puts "Bem-vindo ao Diário de estudos!"
loop do
  print menu 
  print "\nDigite a opção desejada: "
  option = gets.to_i

  case option
  when REGISTER
    item = []
    print "Digite o TEMA de estudo: "
    tema = gets.chomp()
    menu_categorias
    print "Opção selecionada: "
    categoria = gets.to_i
    item = StudyItem2.new(tema,categoria)
    print "Item '#{item.tema}' da categoria '#{item.categoria}' cadastrado com sucesso!"
  when LIST_ALL
    StudyItem2.listagem
  when SEARCH
    print "Digite o termo que deseja busca: "
    busca = gets.chomp
    StudyItem2.busca(busca)
  when ERASE
    puts "Escolha a linha que deseja apagar:"
    StudyItem2.listagem
    print "Linha: "
    delete = gets.to_i
    delete -= 1
    StudyItem2.erase(delete)
  when EXIT
    puts "Obrigado por usar o Diário de Estudos!"
  break
  else
    puts "Opção inválida."
  end
  wait_and_clear
end