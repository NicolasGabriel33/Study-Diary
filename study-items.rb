class StudyItem
    
    attr_accessor :tema, :categoria, :lingua, :lista_estudos

    def initialize (cadastrado:[])
        @cadastrados = cadastrado
    end

    def self.listagem(tema, categoria)
        @tema = tema
        @categoria = StudyCategory.new(categoria)
        @lingua = @categoria.linguagem
        [@tema, @lingua]
    end

    def self.cadastro(item)
        StudyItem.new
        @cadastrados =  "#{item[0]} - #{item[1]}"
    end

end