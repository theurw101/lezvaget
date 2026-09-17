# app/services/spell_checker.rb
class SpellChecker
  def initialize
    FFI::Hunspell.directories << Rails.root.join("lib/dictionaries", "hy_AM").to_s
    @dict = FFI::Hunspell.dict("hy_AM")
  end

  def check(word)
    @dict.check?(word)
  end

  def check_text(text)
    text.split(/\s+/).map do |word|
      { word: word, valid: check(word) }
    end
  end
end
