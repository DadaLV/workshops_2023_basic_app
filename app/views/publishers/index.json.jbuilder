# frozen_string_literal: true

json.array! @publishers, partial: 'publishers/publisher', as: :publisher
