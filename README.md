# Edition Example
This example edition is to build a sample edition data set that can be installed in [eXist-db](https://github.com/eXist-db/exist) alongside [_Edirom Online_](https://github.com/Edirom/Edirom-Online). The data set is to provide two perspectives on Edirom Online:

1. A feature based perspective providing test respective sample data for single features available in _Edirom Online_ that can be used to:
  1. test the implementation of certain features
  2. explore the steps necessary to provide a certain feature in the context of your edition's data
2. A user or content based perspective illustrating the capabilities of _Edirom Online_ in an annotated manner

# License Information
This project is generally licensed und the terms of [Creative Commons Attribution 4.0 International (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/) except for files stating otherwise.

[![CC-BY-4.0](https://i.creativecommons.org/l/by/4.0/88x31.png "Creative Commons Attribution 4.0 International License")](http://creativecommons.org/licenses/by/4.0/)

# Building

1. In order to build a [EXPath Package](http://exist-db.org/exist/apps/doc/repo.xml) you need Apache ANT installed on your system.
2. Download the EditionExample code or clone it via git.
3. Then open your command line prompt and navigate to the EditionExample folder, e.g.
```terminal
cd /Users/User/GitHub/EditionExample
```
4. Then launch the build process by executing
```terminal
ant
```
The default build target `xar` of `build.xml` will generate a folder "dist" in the Repository containing `EditionExample-VERSION.xar` e.g. `EditionExample-0.1.xar`. This file can be uploaded to your _eXist-db_ instance.
