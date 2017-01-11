
csplit -z -f split teste '/evento/' '{*}'



csplit prog.c '/^}/+1' {100} 

# splits prog.c into different
# routines where it is assumed
# that each routine ends with a
# '}' at the start of a line

