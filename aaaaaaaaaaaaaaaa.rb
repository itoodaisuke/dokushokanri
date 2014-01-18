@goal = {"title"=>"ウルトラバリュー スパイダーマン ブルーレイセット [Blu-ray]", "asin"=>"B00HVB8REW", "isbn"=>"dfsds", "publishers_attributes"=>{"0"=>{"name"=>"aaaaaaaaaaaaaaaaaa"}, "1"=>{"name"=>"bbbbbbbbbbbbbbb"}}, "authors_attributes"=>{"0"=>{"name"=>"温故知新倶楽部,三遊亭 円朝"}}}

@book = {"title"=>"aaaaa", "asin"=>"B00FQ6GMJG", "isbn"=>"ff", "publishers_attributes"=>{"0"=>{"name"=>"aaaaaaaaaaaaaaaaaa,bbbbbbbbbbbbbbbb"}}, "authors_attributes"=>{"0"=>{"name"=>"温故知新倶楽部,三遊亭 円朝"}}}

book = @book

ary = book["publishers_attributes"]["0"]["name"].split(',')

if ary.size > 1
  youso = {}
  ary.size.times do |n|
    youso.merge!({"#{n}" => {"name" => "#{ary[n]}"}})
  end
end
book["publishers_attributes"].merge!(youso)

p book
