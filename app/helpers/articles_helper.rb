module ArticlesHelper
	# 改行コードをbrタグへ変換する
  def linebreak_to_br(text)
    text.gsub(/\r\n|\r|\n/, "<br />")
  end
end
