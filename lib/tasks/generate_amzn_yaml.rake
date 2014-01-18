namespace :amzn do
  desc "amzn.yamlの作成"
  task generate: :environment do
    AMAZON = <<EOS
associate_tag: XXXXXXXXXXXXXXXXXXX-22
AWS_access_key_id: XXXXXXXXXXXXXXXXXX
AWS_secret_key: XXXXXXXXXXXXXXXXXXXXX
EOS
    File.open 'amzn.yaml', 'w' do |f|
      f.write AMAZON
    end
  end
end
