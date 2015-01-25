# getdataProject

##Cleaning the Data

* Took only the columns ending with -mean() or -std().
* Removed the characters -,( and ).
* Used gsub() on the vector of names to replace things like the t and f at the start with time or frequency.
* Fixed the names, replaced Acc with Accelerometer and Mag with Magnitude, for example.
* Used camelCase to improve readability of long variables names.
* Changed activities numerical values to factors with corresponding names.
* dg
* 
