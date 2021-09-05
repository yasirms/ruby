LOCATION_NAMES=[
  "Ljubljana",
  "Maribor",
  "Kranj",
  "Novo Mesto",
  "Celje",
  "Nova Gorica",
  "Ptuj"
].freeze

LOCATION_NAMES.each do |location_name|
  Location.find_or_create_by(name: location_name)
end
