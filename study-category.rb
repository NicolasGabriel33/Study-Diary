class StudyCategory 
   
    attr_accessor :categoria, :linguagem
    
    def initialize (categoria, linguagem: "")
        @categoria = categoria

        if @categoria == 1
            @linguagem = "Ruby"
        elsif @categoria == 2
            @linguagem = "Rails"
        elsif @categoria == 3
            @linguagem = "HTML"
        else
            @linguagem = "Linguagem Indefinida"
        end
    end
end