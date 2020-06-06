# Iris - Faculty Dashboard ([Link](http://nostalgic-mccarthy-58e272.netlify.com/))

Project done as a part of Software Engineering course 15CSE313

## Introduction

In higher education institutions, people managing academic programs may require to monitor and check the progress of data regarding program offerings, course offerings, class attendance, etc.. Implementing a faculty dashboard could improve efficiency in data retrieval and optimize data storage. The dashboard implementation utilized database structure, faculty data was organized and stored in an AWS database and managed with SQL queries to retrieve data for the dashboard. The prototype data dashboard shows different types of functionalities and tables, even though there were some moderate limitations on the overall design due to time and implementation complexities. Future work could focus on streamlining the data preparation and automating the dashboard visualizations for even better efficiency in the faculty dashboard management system.

## Need & Motivation

With the large number of courses offered every year and over 10+ academic programs, managing course details, class and faculty attendance, schedules of faculties and respective classes are quite labor-intensive. As in traditional universities, faculty members work with the department or individual to monitor and generate various student/faculty reports.  Additionally, at universities, faculty serve as program leads and are responsible for managing the scheduling, staffing, and assessment of the monthly courses in their academic program. Assisting and mentoring students in a cohort is also a responsibility of the program lead. Thus a lot of work has to be integrated to achieve an efficient and optimized method to store and retrieve the information, we came up with an idea to develop a faculty dashboard which will offer specific functionalities to faculties to monitor their required tasks quickly. The proposed functionalities are limited to very basic requirements.

## Technology Stack

* Developing  
  * Frontend - Nuxt.JS, Vue.JS  
  * Backend - NodeJS, ExpressJS  
  * Database - AWS RDS, AWS S3, Firestore  
  * Server Host - AWS EC2  
  * SCM - Git  
  
* Testing  
  * Unit testing - Mocha, Chai, Istanbul, NYC
  * Static Code analysis - SonarQube
  * UI testing - SeleniumJS
  
* Continuous Integration and Development  
  * Webapp hosting - Netlify  
  * Tool - Jenkins  
  
## Software Engineering practices 

* **Scalable Websites**    
    Usage of AWS EC2 instances, we have hosted our backend codes, which allows scalability and takes cares of performance issues
* **Normalized and Scalable Database**  
    Usage of AWS RDS instances, we have hosted using MySQL database with normalized schemas
* **Modularized code**  
    All the backend and frontend codes are modularized for right reuse of codes avoiding duplications
* **API**  
    We have created separated APIs for each functionality, which ensures good code quality with effective usage of function calls
* **Coverage Static code analysis**  
    Developing the codes only on static code analysis with overall coverage results above 75%, to ensure less bugs, code smells and less vulnerabilities
* **Daily Online Stand up meetings**  
    Conducted Developer standup meetings through Zoom calls
* **Jenkins successful build**  
    Email notifications after successfully build


## Build Setup

``` bash
# install dependencies
$ npm install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start

# generate static project
$ npm run generate
```

For detailed explanation on how things work, check out [Nuxt.js docs](https://nuxtjs.org).

## YouTube Demo

[YouTube Link](https://youtu.be/AJwXi6cXysY)

## Roles and Contributions

[Saiharsha B](https://github.com/cyberShaw) - Frontend Design and Routing  
[Srishilesh P S](https://github.com/srishilesh) - Backend functionality, Unit testing, Static code analysis, CI/CD  
[Sanjay Tharagesh R S](https://github.com/sanjaytharagesh31) - Backend functionality, Unit testing, Static code analysis, Database  
[Gayathri E](https://github.com/gayu-thri) - UI testing  
[Prathyusha S](https://github.com/prathyu0398) - UI testing  
[Neeraj Kumar Reddy P](https://github.com/Neeraj441) - Unit testing  
