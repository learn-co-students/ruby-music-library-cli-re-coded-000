module Concerns

 module Findable

def find_by_name(name)
  self.all.each do |e|
    if e.name==name
      return e
    end
  end
  return nil
end
def find_or_create_by_name(name)
  if find_by_name(name) !=nil
    return find_by_name(name)
  else
    obj=self.create(name)
    return obj
  end
end
 end


end
