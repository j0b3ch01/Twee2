require 'docx'
require 'rubygems'
require 'nokogiri'
require 'json'

holdin = []
instr = []

doc1 = Docx::Document.open('exam_pt_2.docx')

doc1.paragraphs.each do |p|
	holdin.push p
end

open('exam_instructions.txt', 'r') { |i|
	i.each do |x|
		instr.push x
	end
}

open('runner.tw2', 'w') { |f|

	f.puts "::StoryTitle\n" + holdin[0].text

	f.puts "::Start Here... [instructions]"

	instr.each do |x|
		f.puts x
	end

	f.puts "::Twee2Settings [twee2]"
	f.puts "@story_start_name = 'Start Here...\'"
	f.puts "::Configuration [twee2]"
	f.puts "Twee2::build_config.story_format = \'Snowman\'"
}

=begin
(4..holdin.length).each do |k|

	next if (k + 1) % 5 > 0

	puts holdin[k]
	puts holdin[k+1]
	puts holdin[k+2]
	puts holdin[k+3]
	puts holdin[k+4]
=end