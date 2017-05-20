# Search Hashtag Keywords in files
This tool is to search all the hashtag keywords in the files.
The usual ag or grep search are searching keywords by "OR" options when you supply multiple keywords.
This tool provides an "AND" search for keywords.

# Setup

1. Install ag (the_silver_searcher)
  ```
  brew install ag
  ```

2. Clone the repository
  ```
  git clone git@github.com:adelinelim/search_file_by_tag.git
  ```

3. Set up the shell shortcut alias key, example set it in zshrc
Set the st path to where you cloned the repository, example like below:
  ```
  alias st="/Users/adelinelim/search_file_by_tag/st"
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

2. To check the usage of st
  ```
  st --help
  ```

  will returns the output like this:
  ```
  Usage: st keywords [options]
      examples:
      st word1 word2 --depth=20
      st word1 word2 -t DESC -c
    -d, --depth=COUNT                Display depth COUNT of content, default depth is 8; example --depth=5
    -i, --include=FILETYPES          Include file type; the FILETYPES will be from --list_file_types; example --include='ruby,sass,js'
    -t, --sort-by-date[=ASC]         Sort result by date, default is sort by ascending; example -sd desc --sort=desc
    -f, --sort-by-file[=ASC]         Sort result by filename, default is sort by ascending; example -sf desc --sort=desc
    -c, --color                      Display result in color
    -n, --show-line-number           Display line number with content
    -l, --list-file-types            Display all the list of supported file types
    -h, --help                       Prints this help
  ```

3. Run the below command; **st** is the search file key, which the keyword1 and keyword2 are the hashtag keywords that you want to search in the directory.
  ```
  st keyword1 keyword2
  ```

4.  The above command `st keyword1 keyword2` will returns all the search results with hashtag keywords of **#keyword1** and **#keyword2**.

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

5. You can set the search result display depth by using **-d**
It will display the search result based on the depth level that you set, e.g. depth=10 will display 10 lines contents.
Default depth value is 8.
  ```
  st keyword1 keyword2 -d 10
  ```

6. You can search with certain file extensions, by using **-i**
  ```
  st keyword1 -i'ruby,sass,js'
  ```
