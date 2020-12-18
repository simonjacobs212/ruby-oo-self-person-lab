# your code goes here
require 'pry'

class Person

    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    @@all = []

    def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
        @@all << self
    end

    def happiness=(happiness)
        @happiness = happiness.clamp(0, 10)
    end

    def hygiene=(hygiene)
        @hygiene = hygiene.clamp(0, 10)
    end

    def clean?
        @hygiene > 7
    end

    def happy?
        @happiness > 7
    end

    def self.all
        @@all
    end

    def get_paid(salary)
        @bank_account += salary
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        return "♪ another one bites the dust ♫"
    end

    def call_friend(person)
        self.happiness += 3
        person.happiness += 3
        return "Hi #{person.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(person, topic)
        if topic == "politics"
            self.happiness -= 2
            person.happiness -= 2
            return "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness += 1
            person.happiness += 1
            return "blah blah sun blah rain"
        else
            return "blah blah blah blah blah"
        end
    end
end

simon = Person.new("Simon")
lexi = Person.new("Lexi")

