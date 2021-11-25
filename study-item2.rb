require_relative 'study-category2'
class StudyItem2
  attr_reader :tema, :categoria, :CATEGORIES
  @@lista_estudos = []

  CATEGORIES = {
    '1': 'Ruby',
    '2': 'Rails',
    '3': 'HTML',
    '4': 'Phyton'
  }

  def initialize(tema, categoria, linguagens: StudyCategory2.new(CATEGORIES))
    @tema = tema
    @categoria = "#{linguagens.consulta_linguagem(categoria)}"
    @@lista_estudos << {tema: @tema, categoria: @categoria}
  end

  def to_s
    @@lista_estudos.each {|item| "#{item(:tema)} - #{item(:categoria)}" }    
  end

  def self.categories
    print "Selecione a linguagem\n"
    CATEGORIES.to_a.each do|numero| 
      print "##{numero[0]} - #{numero[1]}\n"
    end
    print "________________________"
  end

  def self.listagem  
    if @@lista_estudos ==[]
      print "Lista Vazia"
    else
      print <<~RESULTADOS
      Itens encontrados:
      Numero  -   Tema    -  Linguagem
      ---------------------------------
      RESULTADOS
      @@lista_estudos.each.with_index do |item, index|
        puts "##{index+1}  -  #{item.fetch(:tema)}   -   #{item.fetch(:categoria)}"
      end
    end
  end

  def self.busca(busca)
    @resultado_busca = []
    @@lista_estudos.each_with_index do |item, index| 
      if item.fetch(:tema).downcase.include? busca.downcase
      @resultado_busca << "##{index+1}  -  #{item.fetch(:tema)}   -   #{item.fetch(:categoria)}"
      end
    end
    puts "\n#{@resultado_busca.size} resultado(s) encontrado(s) contendo '#{busca}':\n-----------------------------------"
    @resultado_busca.each {|item|puts item}
  end

  def self.erase(delete)
    if @@lista_estudos == []
      puts "Sem itens na lista de estudos."
    elsif delete < 0 || delete >= @@lista_estudos.size
      puts "Linha inválida."
    else
      item_destacado = to_s
      puts "Deseja realmente apagar o item '#{item_destacado}'? (Y/N)"
      confirmacao = gets.chomp.downcase
      if confirmacao == 'y'
        @@lista_estudos.delete_at(delete) {|outrange| puts "Linha inválida."}
        puts "Item apagado com sucessso."
      else
        puts "Item não apagado."
      end
    end
  end
end