require 'pry'

class Pokemon
    def initialize(id:, name:, type:, db:)
        @name = name
        @type= type
        @id = id
        @db = db
    end

    attr_accessor :id, :name, :type, :db

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?,?);
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL

        pokemon_data = db.execute(sql, id).flatten
        pokemon = Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], db:db)
    end
end
