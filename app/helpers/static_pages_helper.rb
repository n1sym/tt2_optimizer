module StaticPagesHelper
  
  def ischeck(x)
    x == "1" ? true : false
  end
  
  def ischeck2(x,s)
    x == s ? true : false
  end
  
  def image_name(x)
    afname = [
   "Book of Shadows",
   "Charged Card",
   "Stone of the Valrunes",
   "Chest of Contentment",
   "Heroic Shield",
   "Book of Prophecy",
   "Khrysos Bowl",
   "Zakynthos Coin",
   "Great Fay Medallion",
   "Neko Sculpture",
   "Coins of Ebizu",
   "The Bronzed Compass",
   "Evergrowing Stack",
   "Flute of the Soloist",
   "Heavenly Sword",
   "Divine Retribution",
   "Drunken Hammer",
   "Samosek Sword",
   "The Retaliator",
   "Stryfe's Peace",
   "Hero's Blade",
   "The Sword of Storms",
   "Furies Bow",
   "Charm of the Ancient",
   "Tiny Titan Tree",
   "Helm of Hermes",
   "Fruit of Eden",
   "Influential Elixir",
   "O'Ryan's Charm",
   "Heart of Storms",
   "Apollo Orb",
   "Earrings of Portara",
   "Avian Feather",
   "Corrupted Rune Heart",
   "Durendal Sword",
   "Helheim Skull",
   "Oath's Burden",
   "Crown of the Constellation",
   "Titania's Sceptre",
   "Fagin's Grip",
   "Ring of Calisto",
   "Blade of Damocles",
   "Helmet of Madness",
   "Titanium Plating",
   "Moonlight Bracelet",
   "Amethyst Staff",
   "Sword of the Royals",
   "Spearit's Vigil",
   "The Cobalt Plate",
   "Sigils of Judgement",
   "Foliage of the Keeper",
   "Invader's Gjalarhorn",
   "Titan's Mask",
   "Royal Toxin",
   "Laborer's Pendant",
   "Bringer of Ragnarok",
   "Parchment of Foresight",
   "Elixir of Eden",
   ]
   afname[x].gsub(/ /, "_") 
  end
end
