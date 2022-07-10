class Order < ApplicationRecord
  enum payment:{
      credit: 1, #クレジットカード
      bank: 2, #銀行振込
    }

  enum order_status:{
      awaiting_payment: 1, #入金待ち
      payment_confirmation: 2, #入金確認
      confectionery: 3, #製作中
      shipping_preparationt: 4, #発送準備中
      shipped: 5, #発送済み
    }
end
