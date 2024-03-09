namespace :import do
    desc "Import data from JSON file"
    task :from_json => :environment do
      data = JSON.parse(File.read(Rails.root.join('db', 'data.json'))) 
      
      data["people"].each do |person_data|
        person_info = person_data["info"]  
        
        person = Person.create!(
          name: person_data["name"],
          title: person_info["title"],
          age: person_info["age"],
          phone: person_info["phone"],
          email: person_info["email"]
        )
        
        if person_data["details"]
          detail = Detail.create!(
            person_id: person.id,
            # Assuming details are provided as a hash
            **person_data["details"]
          )
        end
      end
    end
  end
  