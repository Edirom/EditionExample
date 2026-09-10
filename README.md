# Edirom-Online Edition Example
This example edition is to build a sample edition data set that can be installed in [eXist-db](https://github.com/eXist-db/exist) alongside [Edirom-Online](https://github.com/Edirom/Edirom-Online). The data set is to provide two perspectives on Edirom Online:

1. A feature based perspective providing test respective sample data for single features available in _Edirom-Online_ that can be used to:
  - test the implementation of certain features
  - explore the steps necessary to provide a certain feature in the context of your edition's data
2. A user or content based perspective illustrating the capabilities of _Edirom-Online_ in an annotated manner


# Starting in Edirom Online

Prerequisite: [Docker Desktop](https://www.docker.com/products/docker-desktop/) must be installed. The command "docker" must be available in the terminal.


**Step 1**: Clone the Git repository.

Create a new directory on your computer for the Edition Example and navigate to the directory. 
Then open your computer's command line prompt (also known as Shell, PowerShell, or Terminal) and clone the Git repository of the Edition Example to your computer with the following command:

```bash
git clone https://github.com/Edirom/EditionExample.git .
```

&ast; If you do not use Git, you can download a ZIP or TAR archive from the [Releases](https://github.com/Edirom/EditionExample/releases) page, extract the archive, and then navigate to the directory.


**Step 2**: Start Edirom Online.

Edirom Online is started by entering the following commands in the command line.

(a) Create Docker container:

```bash
docker build -t edition-example:latest .
```

(b) Run Docker container:

```bash
docker run --name edition-example -p 8080:8080 -v exist-data:/var/lib/exist edition-example:latest
```

Alternatively, you can start in "detached mode" (the process then runs in the background, so the terminal is writable again after starting) by using the "-d" flag after "docker run" in the above command. 

After the environment is set up (which may take a few minutes), the Edition Example is available in Edirom Online at the following address:

[http://localhost:8080/](http://localhost:8080/)

If the page does not appear immediately, please refresh it.


**Step 3**: Stop Edirom Online.

You can stop the environment by pressing Ctrl+C in the command line where the Docker process is running. 

If you have used detached mode, you can stop the environment with the following command:

```bash
docker stop edition-example
``` 

To start the Docker container again (without recreating it), enter the following command:

```bash
docker start edition-example
```


# Build Edition Example XAR package 

If you have an Edirom Online instance running, you can build the Edition Example as an [EXPath Package](http://exist-db.org/exist/apps/doc/repo.xml) and upload it to your _eXist-db_ instance.

**Step 1** 
Download the code of the Edition Example, clone it via git or fork it.

**Step 2**
Then open your command line prompt and navigate to the folder of the Edition-Example, e.g.
```terminal
cd /Users/User/GitHub/edirom-online-edition-example
```

**Step 3**
Now you want to build an [EXPath Package](http://exist-db.org/exist/apps/doc/repo.xml). In order to do so, Apache Ant is needed. 
- if you have Apache Ant installed on your system, you can execute it manually: `ant`
- alternatively: open build.xml with oXygen XML-Editor and click the run-button, oXygen will do the rest automatically 

This will automatically generate a folder "dist" in the Repository containing `EditionExample-VERSION.xar` e.g. `EditionExample-0.1.xar`. This file can be uploaded to your _eXist-db_ instance.


# License Information
This project is generally licensed under the terms of [Creative Commons Attribution 4.0 International (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/) except for files stating otherwise.

[![CC-BY-4.0](https://i.creativecommons.org/l/by/4.0/88x31.png "Creative Commons Attribution 4.0 International License")](http://creativecommons.org/licenses/by/4.0/)
