require 'csv'

class Word < ActiveRecord::Base
    acts_as_taggable
    
    enum part_of_speech: { "[N]": 0, "[Pron]": 1, "[V]": 2, "[Adj]": 3, "[Adv]":4, "[Aux]":5, "[Conj]":6, "[Prep]":7,"[Other]":9 }
    enum verbal_system: { "口語": 0, "文語": 1, "口語/文語":9 }
    
    paginates_per 20
    
    def self.import(file)
        CSV.foreach(file.path, headers: true, skip_blanks: true) do |row|
            product = find_by(japanese: row["japanese"], thai: row["thai"]) || new
            product.attributes = row.to_hash.slice(*updatable_attributes)
            product.save!
        end
    end
    
    def self.updatable_attributes
        ["japanese","thai","english","part_of_speech","verbal_system","remarks","favorits","tag_list"]
    end
end