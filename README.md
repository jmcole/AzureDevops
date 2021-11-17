# Overview

This project implements a Python Flask application to serve out predictions for Boston housing prices through an sklearn machine learning model. This model has been trained to predict housing prices based on features such as average rooms in a home, highway access, and teacher-to-pupil ratios. Thiis project will also implement a Continous Delivery and Continuous Integration with Github and MS Azure.

## Project Plan
<TODO: Project Plan

* https://trello.com/b/8bmIWcdN 
* A link to a spreadsheet that includes the original and final project plan>

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

### Generate SSH Keys and load into Github

1. Log into Azure Shell from Azure Portal

![Azure Portal](./screenshots/portal-2.png)

2. Create SSH Keys
```
 ssh-keygen -t rsa

```
3. Use CAT command to view SSH File that you just created. Highlight SSH Key and copy (CTL-C).
```
 cat /home/.ssh/id_rsa.pub

```
4. Go to Github and click on Settings under your image and choose SSH and GPG keys. Click Add New SSH Key
![Github](./screenshots/keys-2.png)

5. Enter Title and Paste (CTL-V) the copied SSH key
![Github](./screenshots/keys-4.png)

6. Clone Project into Azure
```
git clone https://github.com/jmcole/AzureDevops.git

```
![Github](./screenshots/new_clone.PNG)

### Create Project Scaffolding

1. Create a file named `Makefile` within the project folder. This file does not need an extension. Copy the following code into the new file. Makefiles requires tabbed spaces, so as a precaution replaces spaces with tabs and save.
```
install:
    pip install --upgrade pip &&\
        pip install -r requirements.txt

test:
    python -m pytest -vv test_hello.py


lint:
    pylint --disable=R,C hello.py

all: install lint test

```
2. Create a `requirements.txt` file. Add the required libraries.

```
pylint
pytest

```
3. Create Test and Script Files and paste in code.

`hello.py`
```
def toyou(x):
    return "hi %s" % x


def add(x):
    return x + 1


def subtract(x):
    return x - 1
```
`test_hello.py`
```
from hello import toyou, add, subtract


def setup_function(function):
    print("Running Setup: %s" % function.__name__)
    function.x = 10


def teardown_function(function):
    print("Running Teardown: %s" % function.__name__)
    del function.x


### Run to see failed test
#def test_hello_add():
#    assert add(test_hello_add.x) == 12

def test_hello_subtract():
    assert subtract(test_hello_subtract.x) == 9
```
### Perform Test in Azure Cloud
1. Push code from local devlopment to Github. Pull code from Github into Azure Cloud.
2. Create virtual environment in Azure Cloud Shell
```
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
```
3. Run `make all``. This will install, lint, and test the code. Code should pass all tests before proceeding.
![Succesful Test](./screenshots/pass_tests.png)

### Configure Github Actions
1. Click on Actions in Github and Create a new Workflow
2. Choose setup a workflow yourself. Name the `yml` file `pythonapp.yml`
3. This will create a new folder in your repository. Pull code into local repository
4. Open `pythonapp.yml` and replace code with the following and push into Github repo.
```
name: Python application test with Github Actions

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.5
      uses: actions/setup-python@v1
      with:
        python-version: 3.5
    - name: Install dependencies
      run: |
        make install
    - name: Lint with pylint
      run: |
        make lint
    - name: Test with pytest
      run: |
        make test
```
5. Ensure Tests Pass
![Github](./screenshots/actions.PNG)
![Github](./screenshots/actions3.PNG)

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 
## Continuous Integration

![example workflow](https://github.com/jmcole/AzureDevops/actions/workflows/pythonapp.yml/badge.svg)


## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


