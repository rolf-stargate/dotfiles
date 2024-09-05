
for A in 1 2 3 A
do
  echo $A
done

B=( a b c )

for (( i=0; i < ${#B[@]}; i++ ))
do
  echo ${B[i]}
done
