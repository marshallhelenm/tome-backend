User.destroy_all
World.destroy_all
Story.destroy_all
Character.destroy_all
Location.destroy_all
StoryNote.destroy_all


helen = User.create(username: 'helen', password: 'helen')
rosie = User.create(username: 'rosie', password: 'rosie')
puts 'created users'

wellspring = World.create(name: 'Wellspring')
crusade = World.create(name: "Peasant's Crusade")
helen.worlds << wellspring << crusade 
vigil = World.create(name: 'Vigil')
rosie.worlds << vigil
puts 'created worlds and assigned to users'

well1 = Story.create(title: 'a title')
wellspring.stories << well1
crusade1 = Story.create(title: 'a title')
crusade.stories << crusade1
crusade2 = Story.create(title: 'a title')
crusade.stories << crusade2
vigil1 = Story.create(title: 'a title')
vigil.stories << vigil1
puts 'created stories and assigned to worlds'


c1 = Character.create(name: 'Bob')
c2 = Character.create(name: 'Sally')
c3 = Character.create(name: 'Frank')
c4 = Character.create(name: 'George')
wellspring.characters << c1 << c2 << c3 << c4

c5 = Character.create(name: 'Frank')
c6 = Character.create(name: 'George')
crusade.characters << c5 << c6

c7 = Character.create(name: 'Frank')
c8 = Character.create(name: 'George')
vigil.characters << c7 << c8
puts 'created characters and added to worlds'

loc1 = Location.create(name: 'Temple')
loc2 = Location.create(name: 'City')
loc3 = Location.create(name: 'Ruins')
loc4 = Location.create(name: 'Castle')
wellspring.locations << loc1 << loc2 << loc3 << loc4

loc5 = Location.create(name: 'Ruins')
loc6 = Location.create(name: 'Castle')
crusade.locations << loc5 << loc6

loc7 = Location.create(name: 'Ruins')
loc8 = Location.create(name: 'Castle')
vigil.locations << loc7 << loc8
puts 'created locations and added to worlds'

well1.characters << c2 << c3
well1.locations << loc2 << loc3
