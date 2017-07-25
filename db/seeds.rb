p "Bears, bears, bears. Planting the seeds."

User.destroy_all

p "Destroyed all users"


user_1 = User.create({org_name:"Greenpeace", email:"bearheartsbat@gmail.com", password_digest:"bear", country:"United States", zip_code: "94133"})
