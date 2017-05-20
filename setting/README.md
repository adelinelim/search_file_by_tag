# Search Hashtag Keywords in files
This tool is to search all the hashtag keywords in the files

# Setup

1. Install ag (the_silver_searcher)
  ```
  brew install ag
  ```

2. Clone the repository
  ```
  example:
  git clone git@github.com:adelinelim/search_file_by_tag.git
  ```

3. Set up the shell shortcut alias key, example set it in zshrc
Set the sf path to where you cloned the repository, example like below:
  ```
  alias sf="/Users/adelinelim/search_file_by_tag/sf"
  ```

4. Setup the color config file in config.json, example:
  It will display the search result based on the color code here for each file extension that you specified.

  ```
  /*
  color codes from 0 to 255
  "file_extension" : "color_code"
  */

  {
    "color": {
      "rb": 1,
      "js": 2,
      "css": 3,
      "scss": 3,
      "yml": 4,
      "bak": 5,
      "html": 6,
      "erb": 7,
      "md": 8
    }
  }
  ```

# How to run

1. Go to the directory in console where you want to search for the hashtag keywords.

2. Run the below command; **sf** is the search file key, which the keyword1 and keyword2 are the hashtag keywords that you want to search for in the directory.
  ```
  sf keyword1 keyword2
  ```

3.  The above command `sf keyword1 keyword2` will returns all the search results with hashtag keywords of **#keyword1** and **#keyword2**.

  Sample search result:
  **filename => search content**
  ```
  test.rb => #keyword1 #lala #keyword2
  def function
    %[
      This is the
      test
      content
      testing 1 2 3
    ]
  end
  ```

4. You can set the search result display depth by using **depth=**
It will display the search result based on the depth level that you set, e.g. depth=10 will display 10 lines contents.
Default depth value is 8.
  ```
  sf keyword1 keyword2 depth=10
  ```

5. You can search with certain file extensions, by using **in=**
  ```
    sf keyword1 in=rb,js,css
  ```

Note: The keywords are highlighted in Bold Cyan color
