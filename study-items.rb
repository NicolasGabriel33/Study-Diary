class StudyItem

    attr_accessor :tema, :categoria, :solicitaçao_cadastro, :lingua, :lista_estudos

    def initialize (tema, categoria, solicitaçao_cadastro:'Vazia', lingua:"")
        @tema = tema
        @categoria = StudyCategory.new(categoria)
        @lingua = @categoria.linguagem
        @solicitaçao_cadastro = "#{@tema} - #{@lingua}"
    
    end

end