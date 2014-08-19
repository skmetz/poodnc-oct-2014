using Article

class Farm
  attr_reader :animals

  def initialize(animals)
    @animals = as_reliable_animals(animals)
  end

  def lyrics
    animals.collect {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    animal = NullAnimal.new if animal.nil?

    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{animal.species.articlize}, E-I-E-I-O,\n" +
    "With #{animal.sound.articlize} #{animal.sound} here " +
      "and #{animal.sound.articlize} #{animal.sound} there,\n" +
    "Here #{animal.sound.articlize}, there #{animal.sound.articlize}, " +
      "everywhere #{animal.sound.articlize} #{animal.sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end

  private
  def as_reliable_animals(animals)
    animals.collect {|animal| animal.nil? ? NullAnimal.new : animal}
  end
end

class ReliableAnimal
  def self.all(ids)
    Animal.all(ids).collect {|animal| animal.nil? ? NullAnimal.new : animal}
  end
end

class NullAnimal
  def species
    '<silence>'
  end

  def sound
    '<silence>'
  end
end
