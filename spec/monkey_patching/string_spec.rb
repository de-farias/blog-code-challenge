RSpec.describe Post do
  it '#remove_accents' do
    original = 'ÁÂÃÉÊÍÓÔÕÚÇáâãéêíóôõúç'
    expected = 'AAAEEIOOOUCaaaeeiooouc'

    expect(original.remove_accents).to eq expected
  end

  it '#slugify' do
    original = 'As águas de Março'
    expected = 'as-aguas-de-marco'

    expect(original.slugify).to eq expected
  end
end
