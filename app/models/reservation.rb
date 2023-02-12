class Reservation < ApplicationRecord
  validate :check_in_out_check, :new_nil_check
  validates :check_in, :check_out, :guest, presence: true

  belongs_to :user
  belongs_to :room

  def check_in_out_check
    if self.check_in && self.check_out && self.check_in > self.check_out
      errors.add(:check_out, "はチェックイン日より前の日付を指定出来ません")
    end
  end

  def new_nil_check
    if self.check_in.nil? || self.check_out.nil? || self.guest.nil?
      errors.add(:check_out || :check_out || :guest, "はチェックイン日より前の日付を指定出来ません")
    end
  end

  def stay_day
    # チェックインとチェックアウトの差分をstay_dayへ代入
    stay_day = check_in - check_out
    # 有理数を整数にして、-を取るために絶対値を求める
    stay_day.to_i.abs
  end

  def total_price
    guest * stay_day * self.room.price
  end
end
