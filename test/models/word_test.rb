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

require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
