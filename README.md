# Edirom-Online Edition Example
This example edition is to build a sample edition data set that can be installed in [eXist-db](https://github.com/eXist-db/exist) alongside [Edirom-Online](https://github.com/Edirom/Edirom-Online). The data set is to provide two perspectives on Edirom Online:

1. A feature based perspective providing test respective sample data for single features available in _Edirom-Online_ that can be used to:
  - test the implementation of certain features
  - explore the steps necessary to provide a certain feature in the context of your edition's data
2. A user or content based perspective illustrating the capabilities of _Edirom-Online_ in an annotated manner

# Building

1. Download the code of the Edition Example, clone it via git or fork it.
2. Then open your command line prompt and navigate to the folder of the Edition-Example, e.g.
```terminal
cd /Users/User/GitHub/edirom-online-edition-example
```
3. Now you want to build an [EXPath Package](http://exist-db.org/exist/apps/doc/repo.xml), in order to do so, Apache Ant is needed. 
- if you have Apache Ant installed on your system, you can execute it manually: `ant`
- alternatively: open build.xml with oXygen XML-Editor and click the run-button, oXygen will do the rest automatically 

This will automatically generate a folder "dist" in the Repository containing `EditionExample-VERSION.xar` e.g. `EditionExample-0.1.xar`. This file can be uploaded to your _eXist-db_ instance.

# License Information
This project is generally licensed under the terms of [Creative Commons Attribution 4.0 International (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/) except for files stating otherwise.

[![CC-BY-4.0](https://i.creativecommons.org/l/by/4.0/88x31.png "Creative Commons Attribution 4.0 International License")](http://creativecommons.org/licenses/by/4.0/)
