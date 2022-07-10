class OrderDetail < ApplicationRecord
  enum confectionery:{
        ng: 1, #着手不可
        awaiting_confectionery: 2, #製作待ち
        confectionery: 3, #製作中
        confectionery_end: 4, #製作完了
      }
end
