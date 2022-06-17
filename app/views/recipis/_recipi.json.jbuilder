json.extract! recipi, :id, :title, :cook_time, :prep_time, :ingredients, :ratings, :cuisine, :category, :author, :image, :created_at, :updated_at
json.url recipi_url(recipi, format: :json)
