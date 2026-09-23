# Lezvaget (Լեզվագետ)

A web app for Eastern Armenian language tooling — starting with spellchecking, with a
verb conjugator planned next.

## Status

Early scaffold. Currently working:

- Rails app with PostgreSQL
- `SpellChecker` service wrapping Hunspell via `ffi-hunspell`, using the vendored
  `hy_AM` (Eastern Armenian) dictionary

Not yet built: web UI, conjugation engine, custom-word extension table.

## Built with

- Ruby on Rails
- PostgreSQL
- [ffi-hunspell](https://github.com/postmodern/ffi-hunspell) for spellchecking
- RSpec for testing

## Dictionary

The Hunspell dictionary (`lib/dictionaries/hy_AM/`) is vendored from
[martakert/hyspell](https://github.com/martakert/hyspell) (CC0-1.0). See
`lib/dictionaries/hy_AM/SOURCE.md` for pull date and details.

## Dependencies

Docker

## Setup

```bash
docker compose run --rm -- web
# inside container:
bundle install
bin/rails db:create db:migrate
bin/rails console
```

## Spellchecker

```ruby
SpellChecker.new.check("տուն")  # => true
SpellChecker.new.check_text("Բարև ինչպես ես") 
# => [{word: "Բարև", valid: true}, {word: "ինչպես", valid: true}, {word: "ես", valid: true}]
```

## Conjugator
```ruby
# seed some lemmas
Lemma.create!(word: "գրել", part_of_speech: "verb", conjugation_class: "e_conjugation")
Lemma.create!(word: "խաղալ", part_of_speech: "verb", conjugation_class: "a_conjugation")
# conjugate verbs
Conjugator.new.present_tense(Lemma.find_by(word: "գրել"))
Conjugator.new.present_tense(Lemma.find_by(word: "խաղալ"))
```

## TODO

- [ ] Web UI for pasting text and highlighting misspelled words
- [ ] `CustomWord` model for user-added proper nouns/names
- [X] `Conjugator` service for generating verb paradigms
- [ ] Rule-based guessing for regular verbs (`def guess_class(word)`), 
      database only for exceptions, should work without saying what the conjugation_class is
- [ ] Public deployment