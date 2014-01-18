@goal = {"title"=>"ウルトラバリュー スパイダーマン ブルーレイセット [Blu-ray]", "asin"=>"B00HVB8REW", "isbn"=>"dfsds", "publishers_attributes"=>{"0"=>{"name"=>"aaaaaaaaaaaaaaaaaa"}, "1"=>{"name"=>"bbbbbbbbbbbbbbb"}}, "authors_attributes"=>{"0"=>{"name"=>"温故知新倶楽部,三遊亭 円朝"}}}

@book = {"title"=>"aaaaa", "asin"=>"B00FQ6GMJG", "isbn"=>"ff", "publishers_attributes"=>{"0"=>{"name"=>"aaaaaaaaaaaaaaaaaa,bbbbbbbbbbbbbbbb"}}, "authors_attributes"=>{"0"=>{"name"=>"温故知新倶楽部,三遊亭 円朝"}}}

book = @book

hoge =  []
@book.keys.map do |e|
  e.scan(/_attributes$/)
  hoge << $` if $`
end

hoge.map do |f|

  ary = book["#{f}_attributes"]["0"]["name"].split(',')

  if ary.size > 1
    youso = {}
    ary.size.times do |n|
      youso.merge!({"#{n}" => {"name" => "#{ary[n]}"}})
    end
  end
  book["#{f}_attributes"].merge!(youso)
end
  p book
