class Word < ActiveRecord::Base
    enum part_of_speech: { "[N]": 0, "[Pron]": 1, "[V]": 2, "[Adj]": 3, "[Adv]":4, "[Aux]":5, "[Conj]":6, "[Other]":9 }
    enum verbal_system: { "口語": 0, "文語": 1, "口語/文語":9 }
    acts_as_ordered_taggable_on :tags
end