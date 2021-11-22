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

        if @option == 5
            @tamanho_lista = $lista_estudos.size 
            if @tamanho_lista > 0
                puts "Por favor selecione, da lista, a linha que deseja apagar."
                $lista_estudos.each_with_index {|item, index| puts "#{index+1} - #{item}"}
                print "Apagar linha:"
                linha = gets.chomp().to_i
                delete = linha - 1
                if delete<@tamanho_lista && 0<= delete
                    deletar=$lista_estudos[delete]
                    puts "Deseja realmente apagar #{deletar}? (y/n)"
                    confirmacao = gets.chomp()
                    if confirmacao == "y"
                        $lista_estudos.delete(deletar)
                        puts "Item apagado com sucesso."
                    else
                        puts "Item não apagado."
                    end       
                    print "pressione ENTER para continuar."
                    STDIN.gets
                else
                    puts "Linha inválida, tente novamente."
                end
            else
                puts "Lista Vazia."
                print "pressione ENTER para continuar."
                STDIN.gets
            end
        end

        if @option == 6
            puts "Obrigado por usar o Diário de Estudos!"
        end
    end
end