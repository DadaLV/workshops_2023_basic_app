# frozen_string_literal: true

json.extract! publisher, :id, :name, :created_at, :updated_at
json.url publisher_url(publisher, format: :json)
