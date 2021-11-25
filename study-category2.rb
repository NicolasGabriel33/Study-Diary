class StudyCategory2
  def initialize(lista_categorias)
    @lista_categorias = lista_categorias
  end
  def consulta_linguagem(input)
      @lista_categorias.fetch(:"#{input}") {|outrange| "Linguagem inválida"}
  end
end