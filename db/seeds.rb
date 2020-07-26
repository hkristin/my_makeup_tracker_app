brandon = User.new(
  id: 1,
  username: "Brandon",
  email: "brandon@example.com",
  password: "password"
  )
  
brandon.save
  
brandon_brand_1 = Brand.new(
  id: 1,
  name: "Tarte",
  palettes: "Beach Babe",
  age: 10, 
  clean: true,
  user_id: brandon.id
  )
  

  brandon_brand_1.save
  