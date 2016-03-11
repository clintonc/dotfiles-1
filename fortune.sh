#!/bin/bash

FORTUNES=(
    "Perfectionism is the fast track to burnout. Let something go."
    "The key to working on several projects is to complete something every day."
    "Spend more time living in the moment."
    "Why do we work hard at failure? The will to fail or die is as strong as the will to live. Fight it."
    "Our conscious mind thinks it's in control, but it isn't. Our subconcious mind doesn't think about anything, but it is in control. --Jen Sincero"

    "Try the anti-fragile system of idea generation.\n1. Get an idea. Fight the idea high.\n2. Instantly and brutally try to defeat the idea. When will it not work? Can you test it? Stress it?\n3. If it survives, it has legs, and should be further implemented and investigated.\n4. If it's implemented and works, great.\n5. If it fails, you can move on without feeling the crash of a failed idea, because it was not your pet, and you didn't obsess over it."

    "How are you feeling right now? If you don't feel good, figure out why, and fix it."
)

#echo ${#FORTUNES[@]}
fortune() {
    echo
    echo -e ${FORTUNES[$(echo -e ${RANDOM} \% ${#FORTUNES[@]} | bc)]} | fold -s -w ${COLUMNS}
}
#echo ${FORTUNES[0]}
