# == Schema Information
#
# Table name: words
#
#  id             :integer          not null, primary key
#  japanese       :string
#  thai           :string
#  english        :string
#  part_of_speech :integer
#  verbal_system  :integer
#  remarks        :text
#  favorits       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'csv'

class Word < ActiveRecord::Base
    acts_as_taggable
    
    enum part_of_speech: { "[Noun]": 0, "[Pronoun]": 1, "[Verb]": 2, "[Adjective]": 3, "[Adverb]":4, "[Auxiliary]":5, "[Conjunction]":6, "[Preposition]":7,"[Other]":9 }
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
