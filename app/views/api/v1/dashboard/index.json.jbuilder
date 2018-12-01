json.array! @features do |feature|
    json.id feature
    json.name feature.name
    json.is_active feature.is_active
    json.code feature.code
end