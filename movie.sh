#!bin/bash
curl "http://www.omdbapi.com/?t=Godfather&y=&plot=short&r=xml" > mov.txt
grep -o imdbRating=".*" mov.txt > submov.txt
input="submov.txt" 
echo ""
ctr=0
rating=""
while IFS= read -r -n1 var
do
  if [ $ctr -eq 2 ]
  then 
  	break
  elif [ $var == '"' ]
  then
  	ctr=$(( $ctr + 1 ))
  elif [ $ctr -eq 1 ]
  then
 	rating="$rating$var"
  else 
	continue
  fi
done < "$input"
echo $rating
