# autowebmaster.sh

## Automatic GitHub Pages Documentation Handler 

### What it does

__autowebmaster.sh__ is a script that parses the structure of a GitHub repository to be published as a GitHub Pages website. Is meant to be used in cases where a repository contains multiple __markdown__ documents that are wanted to be published on the website. 

___

### How to use it


#### Dependencies

tree

#### Requirements

The script requires the following. 

- A locally stored repo on a MacOS / Linux / Unix machine linked with github repository 
- A directory placed in `/` in the repo named __web__
- A __README.md__ file placed in `/web`   (see recommended format below)
- At least one directory named anything but "web" with markdown files that will be posted as pages in your site
- A txt file placed in `/web` named url.txt containing __only__ the URL of your GitHub page 
- Optionally a markdown file with the name of every directory to be published can be stored on the `/web` directory following the recommended format for the README.md, if such file is not present a generic one will be created with the name of the directory

#### README.md file format

__README.md__that is commonly located at `/`  file is taken by default as the frontpage of GitHub Pages, so the __README.md__ file at `/web` is going to be taken as the template for that. __CAUTION:__the script will delete the original README.md file at root replacing it with the one in `/web`.

We recommend that __README.md__ at `/web` be formatted as following:

- A markdown top level header "#" followed with the name of your GitHub page

- A brief description of what your site is about or anything you want people want to see when find your page

- A lower level header "##..." with something like "Content" "Categories" or a descriptor of the links that __Autowebmaster.sh__ will place below

``` markdown
# Your title here

A description of your site 

## Categories

```

#### Usage 

1. Place `/web` directory and its contents have been created place them on the root directory of your repo as well with the __autowebmaster.sh__ script

2. Run the script

``` bash
$ bash ./autowebmaster.sh
```
3. Push the changes to GitHub

4. Follow the official [instructions](https://pages.github.com/) to publish a GitHub Page

5. Whenever you add or remove directories or markdown files within repeat steps 2 and 3, also if you change the top level header of the markdown files within `/web`


