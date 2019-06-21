json.array! @children do |cateChild|
  json.id cateChild.id
  json.name cateChild.name
end

# json.array! @grandchildren do |cateGrandChild|
#   json.id cateGrandChild.id
#   json.name cateGrandChild.name
# end