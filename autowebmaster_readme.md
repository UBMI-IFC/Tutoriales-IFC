# autowebmaster.sh

## Automatic GitHub Pages Documentation Handler 

### What it does

__autoassetsmaster.sh__ is a script that parses the structure of a GitHub repository to be published as a GitHub Pages assetssite. Is meant to be used in cases where a repository contains multiple __markdown__ documents that are wanted to be published on the assetssite. 

___

### How to use it


#### Dependencies

tree

#### Requirements

The script requires the following. 

- A locally stored repo on a MacOS / Linux / Unix machine linked with github repository 
- A directory placed in `/` in the repo named __assets__
- A __README.md__ file placed in `/assets`   (see recommended format below)
- At least one directory named anything but "assets" with markdown files that will be posted as pages in your site
- A txt file placed in `/assets` named url.txt containing __only__ the URL of your GitHub page 
- Optionally a markdown file with the name of every directory to be published can be stored on the `/assets` directory following the recommended format for the README.md, if such file is not present a generic one will be created with the name of the directory

#### README.md file format

__README.md__that is commonly located at `/`  file is taken by default as the frontpage of GitHub Pages, so the __README.md__ file at `/assets` is going to be taken as the template for that. __CAUTION:__ the script will delete the original README.md file at root replacing it with the one in `/assets`.

We recommend that __README.md__ at `/assets` be formatted as following:

- A markdown top level header "#" followed with the name of your GitHub page

- A brief description of what your site is about or anything you want people want to see when find your page

- A lower level header "##..." with something like "Content" "Categories" or a descriptor of the links that __Autoassetsmaster.sh__ will place below

``` markdown
# Your title here

A description of your site 

## Categories

```

#### Usage 

1. Follow the official [instructions](https://pages.github.com/) to publish a GitHub Page

2. Place `/assets` directory and its contents have been created place them on the root directory of your repo as well with the __autoassetsmaster.sh__ script

3. Run the script

``` bash
$ bash ./autoassetsmaster.sh
```
4. Push the changes to GitHub

5. Whenever you add or remove directories or markdown files within repeat steps 3 and 4, also if you change the top level header of the markdown files within `/assets`


