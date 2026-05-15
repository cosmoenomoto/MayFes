class Sale < ApplicationRecord
  enum item_type: { item_a: 0, item_b: 1 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum age_group: { young: 0, adult: 1 }

  # 日本語表示用のメソッド（Viewをスッキリさせるため）
  def item_type_jp
    { 'item_a' => '大サイズ', 'item_b' => '小サイズ' }[item_type]
  end

  def gender_jp
    { 'male' => '男', 'female' => '女', 'other' => '他' }[gender]
  end

  def age_group_jp
    { 'young' => '10-20代', 'adult' => '30代〜' }[age_group]
  end

  validates :item_type, :gender, :age_group, :price, presence: true
end