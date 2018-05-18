json.array! @prototypes do |prototype|
  json.id            prototype.id
  json.title         prototype.title
  json.user          prototype.user.name
  json.posted_date   prototype.posted_date
  json.image         prototype.set_main_thumbnail
end
