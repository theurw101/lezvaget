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

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/rails console
```

```ruby
SpellChecker.new.check("տուն")  # => true
SpellChecker.new.check_text("Բարև ինչպես ես") 
# => [{word: "Բարև", valid: true}, {word: "ինչպես", valid: true}, {word: "ես", valid: true}]
```

## TODO

- [ ] Web UI for pasting text and highlighting misspelled words
- [ ] `CustomWord` model for user-added proper nouns/names
- [ ] `ArmenianConjugator` service for generating verb paradigms
- [ ] Public deployment