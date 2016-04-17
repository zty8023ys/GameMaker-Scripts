###A collection of scripts that wrap built in DS functions.
With the exception of the DS Object scripts., the point of these scripts is not to be useful, but streamlined and easier/faster to type out. E.g. DSLIST() is faster to type out than ds_list_create().

NOTE: The `clone` and `copy` scripts return the destination `ds-object` or `data structure` whereas ds_*_copy() does not.

--
#####DS Object
NOTE: DS Object relies on the rest of the DS wrapper scripts and the macros in the `dsobject_macros.txt` file.

The DS Object is an array encapsulation of the built in data structures in order to build a generic holder for the encapsulated data structure. The array is a length of two where `index-0` is the data structure and `index-1` is the type of the data structure.

Uses:
 - Generic data structure integrity checking.
 - Data structure comparison.
 - Generic operations such as: copy, destroy, clone, etc.

--
#####DSOBJECT(type, width[undefined], height[undefined])
Constructs a DS Object of the specified type encapsulated in an array with the stored type. If a DS Grid is created the optional `width` and `height` parameters become mandatory.
  
--
#####DSTYPE(ds-object)
Returns the specified type of the `ds-object` unless the passed object is not a `valid ds-object`, in which case `undefined` is returned.
  
--
#####DSGET(ds-object)
Returns the specified data structure of the `ds-object` unless the passed object is not a `valid ds-object`, in which case `undefined` is returned.

--
#####DSISVALID(ds-object)
Returns true if the `ds-object` is a valid `DS Object` else false.

--
#####DSCOPY(ds-obj-srce, ds-obj-dest)
Copies the contents of one data structure from one `ds-object` to the next. The `dest` or destination DS Object will be returned. If the types of the `ds-objects` do not match, the script will silently not clone the object.

--
#####DSCLONE(ds-object)
Creates a new clone from the passed `DS Object`.

--
#####DSFREE(ds-object)
Destroys--frees from memory--the data structure encapsulated in the `DS Object`.
