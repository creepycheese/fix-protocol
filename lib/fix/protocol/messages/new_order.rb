module Fix
  module Protocol
    module Messages

      #
      # A FIX new order message
      #
      class NewOrder < Message
        HANDL_INST_TYPES = {
          private: 1,
          public: 2
        }

        SIDE = {
          buy: 1,
          sell: 2
        }

        ORD_TYPES = {
          market: 1,
          limit: 2,
          shop: 3
        }

        TIME_IN_FORCE_TYPES = {
          good_till_cancel: 1,
          immidiate_or_cancel:   2,
          good_till_time: 'A',
          good_during_time: 'B'
        }

        unordered :body do
          field :account,             tag: 1
          field :cl_ord_id,           tag: 11, required: true
          field :handl_inst,          tag: 21, mapping: HANDL_INST_TYPES
          field :symbol,              tag: 55, required: true
          field :side,                tag: 54, required: true, mapping: SIDE
          field :transact_time,       tag: 60, required: true, type: :timestamp, default: proc { Time.now }
          field :order_qty,           tag: 38, required: true, type: :integer
          field :ord_type,            tag: 40, required: true, mapping: ORD_TYPES
          field :price,               tag: 40, required: true, type: :integer
          field :time_in_force,       tag: 59, required: true, type: :integer, mapping: TIME_IN_FORCE_TYPES
          field :expire_time,         tag: 126, type: :timestamp, default: proc { Time.now }
          field :max_show,            tag: 210, type: :integer
          field :ref_price,           tag: 11030, type: :integer
          field :currency,            tag: 15, type: :integer
        end
      end
    end
  end
end
