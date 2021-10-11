class Contact < ApplicationRecord
  enum subject: { '投稿内容について': 0, 'ユーザーについて': 1, 'サイトご利用について': 2, 'その他ご要望': 3}, _prefix: true
end
