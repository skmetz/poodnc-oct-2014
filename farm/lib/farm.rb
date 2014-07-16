using Article

class Farm
  attr_reader :ids

  def initialize(ids)
    @ids = ids
  end

  def lyrics
    Animal.all(ids).collect {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{animal.species.articlize}, E-I-E-I-O,\n" +
    "With #{animal.sound.articlize} #{animal.sound} here " +
      "and #{animal.sound.articlize} #{animal.sound} there,\n" +
    "Here #{animal.sound.articlize}, there #{animal.sound.articlize}, " +
      "everywhere #{animal.sound.articlize} #{animal.sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end
end
