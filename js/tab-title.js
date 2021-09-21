var url = window.location.pathname; // gets the pathname of the file
var str = url.substring(url.lastIndexOf('/')+1); // removes everything before the filename
str = str.substring(0, str.length - 5); // removes the extension
var filename = str.replace(/%20/g, " "); // if the filename has multiple words separated by spaces, browsers do not like that and replace each space with a %20. This replace %20 with a space.
document.getElementById("title").innerHTML = filename;
