class Pokemon
<<<<<<< HEAD
  attr_accessor :id, :name, :type, :db

  def initialize(db, poke_hash = nil)
    if poke_hash
      @id = poke_hash[:id]
      @name = poke_hash[:name]
      @type = poke_hash[:type]
    end
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?);
    SQL

    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon;")[0][0]
  end

  def self.find(id, db)
    attribute_hash = {}
    new_poke = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)[0]
    attribute_hash = {:id => new_poke[0], :name => new_poke[1], :type => new_poke[2]}
    Pokemon.new(@db, attribute_hash)
  end

# =======
#   attr_accessor :id, :name, :type
#
#   def self.initialize(id,name, type, db)
#     @name = name
#     @type = type
#     @id = id
#   end
# >>>>>>> 43160f398a1775733b423d908d8107808bb0f481
end
