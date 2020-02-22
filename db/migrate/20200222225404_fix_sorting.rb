class FixSorting < ActiveRecord::Migration[5.2]
  def change
     #Get the list of current characters.
     chars = Character.all
     #loop through each character, getting every normal
     chars.each do |char|
       normal_index = 1
       norms = char.normals.all
       #once you have the normals, loop through every single one, and add a value to its list_order. sequencially.
       norms.each do |norm|
         norm.list_order = normal_index
         norm.save
         normal_index += 1
       end
     end
  end
end
