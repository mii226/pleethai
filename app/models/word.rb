class Word < ActiveRecord::Base
    enum part_of_speech: { Noun: 0, Pronoun: 1, Verb: 2, Adjective: 3, Adverb:4, Preposition:5, Conjunction:6, Interjection:7, Other:9 }
    enum verbal_system: { Written_language: 0, Spoken_language: 1, Both:9 }
    acts_as_ordered_taggable_on :tags
end
