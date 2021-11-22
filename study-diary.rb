$lista_estudos = []
class StudyDiary
    require_relative 'study-items'
    require_relative 'study-category'
    
    def initialize ()
    end
    
    while @option != 6
        puts "  \nBem-vindo ao diário de estudos! Seu companheiro para estudar!"
        puts "  [1] Cadastrar um item para estudar."
        puts "  [2] Verificar todos os itens cadastrados."
        puts "  [3] Buscar um item de estudo."
        puts "  [4] Listar por Categoria."
        puts "  [5] Apagar um item."
        puts "  [6] Sair."
        print " Escolha uma opção para iniciar: "

        @option = gets.chomp().to_i

    
        if @option<=0 || @option>=7
            puts " \n Por favor utilize uma opção válida."
            print "\n pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 1
            puts "\n Por favor, digite o tema de estudos: "
            @tema = gets.chomp()
            puts "Agora a categoria de estudo."
            puts "[1] Ruby"
            puts "[2] Rails"
            puts "[3] HTML"
            @categoria = gets.chomp().to_i
            item = StudyItem.listagem(@tema,@categoria)
            puts "Item #{item[0]} da categoria #{item[1]} cadastrado com sucesso!"
            
            $lista_estudos << StudyItem.cadastro(item)
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 2
            puts "Segue lista de itens cadastrados:"
            $lista_estudos.each {|item| puts item}
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 3
            puts "Digite a palavra que deseja procurar:"
            busca = gets.chomp()
            @resultado_busca = []
            
            $lista_estudos.each_with_index do |item, i| 
                if item.include? busca
                @resultado_busca << "#{i+1} - #{item}"
            end
                             
            end
            puts "#{@resultado_busca.size} resultado(s) encontrado(s) com #{busca}"
            puts "Posição - Titulo - Linguagem"
            puts @resultado_busca
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 4
            puts "Digite a categoria que deseja procurar:"
            puts "[1] Ruby"
            puts "[2] Rails"
            puts "[3] HTML"
            print "Linguagem:  "
            categoria_busca = gets.chomp().to_i
            linguagem = StudyCategory.new(categoria_busca)
            lingua = linguagem.linguagem()

            @resultado = []
            
            $lista_estudos.each_with_index do |item, i| 
                if item.include? linguagem.linguagem()
                @resultado << "#{i+1} - #{item}"
            end
                             
            end
            puts "#{@resultado.size} resultado(s) encontrado(s) com '#{linguagem.linguagem()}':"
            puts "Posição - Titulo - Linguagem"
            puts @resultado
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 6
            puts "Obrigado por usar o Diário de Estudos!"
        end
    end
end