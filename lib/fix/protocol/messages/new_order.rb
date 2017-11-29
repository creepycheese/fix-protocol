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

        unordered :body do
          field :account,             tag: 1
          field :cl_ord_id,           tag: 11, required: true
          field :handl_inst,          tag: 21, mapping: HANDL_INST_TYPES
          field :symbol,              tag: 55, required: true
          field :side,                tag: 54, required: true, mapping: SIDE
        end
      end
    end
  end
end
