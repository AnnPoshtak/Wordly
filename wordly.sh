#!/usr/bin/bash
words=("apple" "brave" "cloud" "dream" "eagle" "flame" "grass" "happy" "image" "joker"
       "kneel" "lemon" "magic" "night" "ocean" "piano" "queen" "river" "stone" "tiger"
       "unity" "viper" "world" "xenon" "yacht" "zebra" "angel" "block" "charm" "dense"
       "eager" "fancy" "ghost" "haste" "ideal" "joint" "karma" "linen" "mercy" "noble"
       "orbit" "prize" "quiet" "rally" "sense" "trust" "upper" "vivid" "watch" "xerox"
       "yield" "zoney" "afire" "blaze" "crisp" "dairy" "flora" "gleam" "humor" "inlet"
       "jolly" "knead" "lover" "modal" "never" "optic" "plead" "quite" "rogue" "scrap"
       "truth" "utter" "valet" "widen" "youth" "amaze" "blink" "crush" "drown" "exile"
       "forge" "groan" "intro" "jewel" "kayak" "laugh" "mount" "nifty" "ounce" "plank"
       "queer" "react" "slick" "trade" "urban" "vapor" "wrung" "yeast" "zonal")
random_word="${words[$((RANDOM % ${#words[@]}))]}"
attempt=1

echo "Welcome to the Wordly game! You need to guess the word in 10 attempts, otherwise you lose."
read -p "Enter the first word: " word

while [[ "$word" != "$random_word" ]]; do
    if ((attempt>10)); then
        echo "You lost! The hidden word was: $random_word"
        break
    fi
    attempt=$((attempt+1))

    echo "Incorrect! Here is your sequence: "
    for ((i=0;i<${#random_word};i++)); do
        char="${word:i:1}"
        target="${random_word:i:1}"
        if [[ "$char" == "$target" ]]; then
            echo -n "g "
        elif [[ "$random_word" == *"$char"* ]]; then
            echo -n "y "
        else
            echo -n "r "
        fi
    done
    echo ""
    read -p "Continue: " word
done

if [[ "$word" == "$random_word" ]]; then
    echo "You won!"
fi
