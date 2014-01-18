module ApplicationHelper
  Time.zone = 'Tokyo'

  # データベースからAmazon商品個別データを取得（無い/古い場合は登録/更新も行う）
  def get_amazon_item_data(asin)
    rec = Amazonitem.where(asin: "#{asin}").first
    if !rec or rec.updated_at < DateTime.now - 0.5 # データがない、もしくは、半日以上経っている場合
      unless rec
        rec = Amazonitem.new() unless rec
        rec.asin = asin
      end

      amazon_res = Amazon::Ecs.item_lookup(asin, response_group: 'Medium')

      if amazon_res and amazon_res.first_item
        item = amazon_res.first_item
        element = item.get_element('ItemAttributes')
        rec.detailpageurl = item.get('DetailPageURL')
        rec.isbn = element.get("ISBN")
        rec.title = element.get("Title")
        rec.author = element.get_array("Author").join(",")
        rec.publisher= element.get("Manufacturer")
        rec.product_group = element.get("ProductGroup")
        rec.publication_date = element.get("PublicationDate")
        rec.s_image_url = item.get("SmallImage/URL")
        rec.m_image_url = item.get("MediumImage/URL")
        rec.l_image_url = item.get("LargeImage/URL")
      else
        rec.detailpageurl = nil
      end
      # レコードの保存
      rec.save
    end
    return rec
  end

  def plural_save(book)
    ary = book["publishers_attributes"]["0"]["name"].split(',')

    if ary.size > 1
      youso = {}
      ary.size.times do |n|
        youso.merge!({"#{n}" => {"name" => "#{ary[n]}"}})
      end
    end
    book["publishers_attributes"].merge!(youso)
    @data = book
    return @data
  end
end
