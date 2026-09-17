# app/services/spell_checker.rb
class SpellChecker
  def initialize
    FFI::Hunspell.directories << Rails.root.join("lib/dictionaries", "hy_AM").to_s
    @dict = FFI::Hunspell.dict("hy_AM")
  end

  def check(word)
    @dict.check?(word)
  end
end
