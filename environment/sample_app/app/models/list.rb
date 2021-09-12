class List < ApplicationRecord
  # modelsにアタッチメント追加
  attachment :image

  # バリデーション　presence(存在)trueで必須
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

end
