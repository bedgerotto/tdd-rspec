$counter = 0

describe "let" do
  ordem_de_invocacao = []

  let!(:contador) do
    ordem_de_invocacao << :let!
    $counter += 1
  end

  it 'chama o metodo helper antes do teste' do
    ordem_de_invocacao << :exemplo

    expect(ordem_de_invocacao).to eq([:let!, :exemplo])
    expect(contador).to eq(1)
  end
end
