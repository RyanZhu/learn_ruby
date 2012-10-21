text = ''
File.open('/home/ryan/Desktop/old_man_and_sea'){|f|text = f.read }
class TextProcessor
	WORD = 1
	EMPTY = 0
	Empty_chars=" .,\n\r"
class <<self
	def is_empty(char)
		Empty_chars.include? char
	end
	def text_to_words_array text
		words_array = []
		word = ''
		if !is_empty(text[0])
			state = WORD
		else
			state = EMPTY
		end
		text.each_char{|c|
			if state==WORD
				if !is_empty(c)
					word<<c
				else
					words_array<<word
					word=''
					state=EMPTY
				end
			else
				if !is_empty(c)
					word<<c
					state=WORD
				end
			end

		}
		if state==WORD
			words_array<<word
		end
		words_array
	end
end
end
puts TextProcessor.text_to_words_array text
