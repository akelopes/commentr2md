# commentr2md
A personal and simple R Package that allows you to convert comments from R, Python or any other files that use the `#'` standard for comments to markdown.

This allows you to develop a detailed documentation during your coding, and simply export the text part of it into *ready to read* **.md** and **.html** documents.

This was intended to be used for shiny apps documentation, since the tools available at the time this package was created were not very oriented for shiny. This allows your to write your documentation as you develop the shiny app. The alternative would be to use **roxygen2** and **knitr**, but neither work well with shiny's default structure. **Roxygen2** depends on your building a modulized shiny app, which is not always optimal, in my opinion, and **knitr** doesn't interpret comments inside of the server() function, which is a nuisance for me.

# Details
 * Use this if you want to extract the comments of your code and save as a **.md** and **.html** file.
 * It extracts only comments that use the `#'` symbol standard, ignoring comments that have only a `#` in your code, allowing you to keep private comments in your code.
 * By default, it uses github's css stylesheet, but you can use any .css file you want for styling.

#  How to install

Simply type the line bellow in Rstudio:  
`devtools::install_github("automa7/commentr2md")`

# How to use
Default syntax is:  
`Commentr2md::make_md(file, output_name, encoding = 'UTF-8', style = NULL, ...)`

Parameters:
* *file*: path to file that will have its comments extracted;
* *output_name*: a string containing name that will be given to the files that are written by the package;
* *encoding*: a string containing the encoding used by your environment. This parameter will be passed on to the `markdownToHTML()` and `read.delim()` functions used inside the package. By default it is set as 'UTF-8';
* *style*: a string containing the path to a custom stylesheet *.css* file, if none given it will use github's stylesheet. If you want to have no style, simply insert `'none'` value to the parameter.
* ...: you can pass any argument that would be accepted by `markdownToHTML()`.


# Considerations 

 The idea is that you will develop a detailed documentation inside your code, and once the development is finished, you simply export the comments to a .md and .html file. 
 This requires that you write your commentary as if referencing an external document, which is your code. So, for example, a comment that would normally be written like this: 
 ``` 
 # Function to say hello
 # name is a string
 hello <- function(name) {
     # I had to attribute the parameter to a variable because company standard demands it
     param_name <- name
     print("Hello", param_name)
    }
 }
 ```
 
 Should instead be describing the code in a more formal manner: 
 ```
 #' * Function: **hello()**  
 #'    * objective: say hello to a person  
 #'    * parameters:  
 #'        * *name*: a string containing the  name that will be greeted  
  hello <- function(name) {
     #'    * Notes:  
     #'        * Variable *param_name* was created to store the parameter as per standard protocol **xx.zz.123**.
     param_name <- name
     print("Hello", param_name)
    }
 }
 ```
 Your final result would be a **html** file and an **.md** file containing the following lines:
   * Function: **hello()**  
     * objective: say hello to a person  
     * parameters:  
        * *name*: a string containing the  name that will be greeted  
     * Notes:  
        * Variable *param_name* was created to store the parameter as per standard protocol **xx.zz.123**.

# Notes

* Use double space before new lines.

# Future plans
* I would like to improve this package to use the code as well, in order to make a notebook-like final document.
