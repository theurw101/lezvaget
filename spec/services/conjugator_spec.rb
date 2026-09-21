RSpec.describe Conjugator do
  it "conjugates a regular -ել verb in the present tense" do
    lemma = Lemma.new(word: "գրել", conjugation_class: "e_conjugation")
    result = described_class.new.present_tense(lemma)

    expect(result[:first_singular]).to eq("գրում եմ")
    expect(result[:third_plural]).to eq("գրում են")
  end

  it "conjugates a regular -ալ verb in the present tense" do
    lemma = Lemma.new(word: "խաղալ", conjugation_class: "a_conjugation")
    result = described_class.new.present_tense(lemma)

    expect(result[:third_singular]).to eq("խաղում է")
  end

  it "raises for an unknown conjugation class" do
    lemma = Lemma.new(word: "???", conjugation_class: "irregular")
    expect { described_class.new.present_tense(lemma) }.to raise_error(described_class::UnknownConjugationClass)
  end
end
