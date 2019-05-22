User.destroy_all
Department.destroy_all 
Item.destroy_all

User.create!(
    username: "admin",
    password: "admin",
    access_level: "0",
)

Department.create!(
    name: "test department",
)

Item.create!(
    name: "laptop",
    quantity: "1",
    details: "Sony Vaio",
    department_id: "1"
)

User.first.departments << Department.first
Department.first.items << Item.first