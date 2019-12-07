# Installation
    ## Visual studio code
        1. Install visual studio code at https://code.visualstudio.com/download
        2. Install plugins
            2.1 robot framework language
            2.2 Robot Framework Intellisense
    ## Git
        1. https://git-scm.com/downloads
        2. Clone code git clone https://kolekto.visualstudio.com/Kolekto%20Huur/_git/Kolekto%20Huur

    ## Robot framework
        1. Install python 3.x https://www.python.org/downloads/
            IMPORTANT NOTE: Copy the install location path
        2. Install robot framework and other dependencies library
            pip install -r requirements.txt
        3. Verify
            python --version
            robot --version
        4. Web drivers
            Download: 
                Chrome: http://chromedriver.chromium.org/downloads (make sure google chrome version is matched)
                Firefox: https://github.com/mozilla/geckodriver/releases
            Configure web drivers' path
                Windows:    
                    Copy 2 web drivers to folder <Installed Python location>/Scripts
                    In my case the folder is located in C:\Users\toan-huu.nguyen\AppData\Local\Programs\Python\Python37-32\Scripts
                Mac: unknown :)

# Execute test suite(s)
    robot --console verbose --outputdir .\reports .\suites\<path.robot>

    OR to run all test suites 
        run.ps1
    OR  run.sh

# Robot framework info
1. Offical site: https://robotframework.org/
2. Robot framework Guide: https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst
3. Do and Don't: https://www.slideshare.net/pekkaklarck/robot-framework-dos-and-donts?from_action=save
4. Selenium library keywords: http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
5. How to Structure a Scalable And Maintainable Acceptance Test Suite https://blog.codecentric.de/en/2010/07/how-to-structure-a-scalable-and-maintainable-acceptance-test-suite/

*** More details
6. Implementation doc https://github.com/robotframework/robotframework/tree/master/doc/userguide/src/CreatingTestData
7. Library supported: http://robotframework.org/robotframework/

# Common Issues:
1. 

# Run test suites only => TBD
1. Install docker
2. Build image
3. Execute test suites