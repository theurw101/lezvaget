class Conjugator
  # UnknownConjugationClass inherited from StandardError class
  class UnknownConjugationClass < StandardError; end

  # gramatical persons as an array of symbols (immutable)
  PRONOUNS = %i[first_singular second_singular third_singular
                first_plural second_plural third_plural].freeze

  # hash of auxiliaries "to be" (եմ) in present tense
  AUXILIARY_PRESENT = {
    first_singular: "եմ",
    second_singular: "ես",
    third_singular: "է",
    first_plural: "ենք",
    second_plural: "եք",
    third_plural: "են"
  }.freeze

  # Registry of conjugation classes. Each entry just needs to know its
  # infinitive ending — both regular classes share the same present-tense
  # formation rule, so adding "a_conjugation" costs one line, not new logic.
  CONJUGATION_CLASSES = {
    "e_conjugation" => { infinitive_ending: "ել" },
    "a_conjugation" => { infinitive_ending: "ալ" }
  }.freeze

  def present_tense(lemma)
    # look up rules for verb's class
    rules = CONJUGATION_CLASSES.fetch(lemma.conjugation_class) do
      # for anything to registered:
      raise UnknownConjugationClass, "No rules for #{lemma.conjugation_class.inspect}"
    end
    # get verb stem by stripping infinitive ending
    stem = strip_ending(lemma.word, rules[:infinitive_ending])
    # build participle
    participle = "#{stem}ում"
    # walk hash, replace each value with the same six keys but full conjugated phrases as values
    AUXILIARY_PRESENT.transform_values { |aux| "#{participle} #{aux}" }
  end

  private

# function to remove the verbs suffix, but error if the suffix isn't there
  def strip_ending(word, ending)
    unless word.end_with?(ending)
      raise ArgumentError, "#{word.inspect} does not end with #{ending.inspect}"
    end
# everything except for length of ending
    word[0...-ending.length]
  end
end
