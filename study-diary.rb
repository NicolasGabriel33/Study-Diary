class StudyDiary

    require_relative 'study-items'
    require_relative 'study-category'
    attr_accessor :option, :tema, :categoria, :busca
        
    def initialize (option, tema, categoria, busca)
        @option = option
        @tema = tema
        @categoria = categoria
        @busca = busca 
    end
    
    while @option != 4
        puts "  \nBem-vindo ao diário de estudos! Seu companheiro para estudar!"
        puts "  [1] Cadastrar um item para estudar."
        puts "  [2] Verificar todos os itens cadastrados."
        puts "  [3] Buscar um item de estudo."
        puts "  [4] Sair."
        print " Escolha uma opção para iniciar: "

        @option = gets.chomp().to_i

    
        if @option<=0 || @option>=5
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
            item = StudyItem.new(@tema,@categoria)
            puts "Item #{item.tema} da categoria #{item.lingua} cadastrado com sucesso!"
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 2
            puts "Segue lista de itens cadastrados:"
            #puts lista de cadastrados
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 3
            puts "Digite a palavra que deseja procurar:"
            busca = gets.chomp()
            #função de busca
            puts "Foi encontrado #numero# item com a palavra #{busca}"
            print "pressione ENTER para continuar."
            STDIN.gets
        end

        if @option == 4
            puts "Obrigado por usar o Diário de Estudos!"
        end
    end
end