START TRANSACTION;

DROP TABLE IF EXISTS ingredients, ingredientprofile, dietaryfilters;

CREATE TABLE ingredients (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    category varchar(15) NOT NULL);

CREATE TABLE ingredientprofile (
     id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     emoji varchar(2) NULL default '',
     -- fix for decimal - 2 places
     price DECIMAL(3,2) NULL default 0,
          ingredient_id int not null references ingredients(id)
     -- FOREIGN KEY (ingredients_id) REFERENCES ingredients(id)
);

CREATE TABLE dietaryfilters (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    isVegan Boolean null default false,
	hasGluten boolean null default true,
    kidFriendly boolean null default false,
    hasNuts boolean not null,
    hasLactose boolean not null,
    hasShellfish boolean not null,
    hasEgg boolean not null,
    hasSoy boolean not null,
    isHalal boolean null default false,
    isKosher boolean null default false,
    lowSodium boolean null default false,
    diabeticFriendly boolean null default false,
    heartHealthy boolean null default false,
    kidneyFriendly boolean null default false,
    lowFodmap boolean null default false,
	spiceSensitive boolean null default false,
    textureFriendly boolean null default false,
    -- FOREIGN KEY (ingredients_id) REFERENCES ingredients(id)
    ingredient_id int not null references ingredients(id)
);

INSERT INTO ingredients (name, category) VALUES
    ('Burrata', 'protein'),
    ('Chicken', 'protein'),
    ('Sun-Dried Tomatoes', 'veggie'),
    ('Spinach', 'veggie');

INSERT INTO ingredientprofile (emoji, price, ingredient_id) VALUES
     ( '🤍', 3.25, 1),
    ('🍗', 3.50, 2),
    ('🥬',0.80,4),
    ('🌞', 1.50, 3);

INSERT INTO dietaryfilters (isVegan, hasGluten, kidFriendly, hasNuts, hasLactose,
    hasShellfish, hasEgg, hasSoy, isHalal, isKosher, lowSodium, diabeticFriendly,
    heartHealthy, kidneyFriendly, lowFodmap, spiceSensitive, textureFriendly, ingredient_id) VALUES
    (true, false, true, false, false, false,false,false, true, true,true,true,true,
    false,true,true,true,4),
    ( false,
     false,
     true,
    false,
     true,
     false,
     false,
     false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    true,true,1),
    (false,false,true,false,false,false,false,false,
    true,false,true,true,true,true,true,true,true,2),
    ( true,
     false,
     true,
     false,
     false,
     false,
     false,
    false,
     true,
    true,
     true,
     true,
     true,
     true,
     false,
     true,
     true, 3);

commit;

