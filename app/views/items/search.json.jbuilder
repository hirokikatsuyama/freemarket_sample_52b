json.array! @children do |cateChild|
  json.id cateChild.id
  json.name cateChild.name
end

json.array! @size do |size|
  json.sizing size.sizing
  json.name size.name
end
