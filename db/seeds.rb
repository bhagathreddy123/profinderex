# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


FrontEndSkill.find_or_create_by(name: "HTML")
FrontEndSkill.find_or_create_by(name: "JavaScript")
FrontEndSkill.find_or_create_by(name: "CSS")
FrontEndSkill.find_or_create_by(name: "JQuery")
FrontEndSkill.find_or_create_by(name: "ReactJS")
FrontEndSkill.find_or_create_by(name: "AngularJS")
FrontEndSkill.find_or_create_by(name: "VueJS")
FrontEndSkill.find_or_create_by(name: "Bootstrap")


BackEndSkill.find_or_create_by(name: "Ruby")
BackEndSkill.find_or_create_by(name: "Rails")
BackEndSkill.find_or_create_by(name: "MySQL")
BackEndSkill.find_or_create_by(name: "Python")
BackEndSkill.find_or_create_by(name: "Java")
BackEndSkill.find_or_create_by(name: "PHP")
BackEndSkill.find_or_create_by(name: "Node.JS")
BackEndSkill.find_or_create_by(name: "CURL")


UserSkill.create(user: User.first, skill: Skill.find(1), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(3), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(4), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(5), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(8), rating: 8)


UserSkill.create(user: User.last, skill: Skill.find(1), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(4), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(8), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(5), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(6), rating: 8)


