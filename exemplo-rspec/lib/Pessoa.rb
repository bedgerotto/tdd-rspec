class Pessoa
  attr_accessor :nome, :idade
  attr_reader :status

  def feliz!
    @status = 'Sentindo-se Feliz!'
  end

  def contente!
    @status = 'Sentindo-se Contente!'
  end

  def triste!
    @status = 'Sentindo-se Triste!'
  end
end
