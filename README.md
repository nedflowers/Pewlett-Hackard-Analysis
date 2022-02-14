# Pewlett-Hackard-Analysis

## Overview of Project
As people born between 1946-1964 begin to retire at rapid rates, companies must prepare for a mass vacancy of jobs. With the use of SQL, analyze company data to determine the number of retiring employees per job title. Then, find all employees who are eligible to participate in a mentorship program. Finally, deduce if there are enough retirement-ready employees to mentor eligible employees at each department. 

## Results

#### Unique Retiring Titles
<img width="285" alt="unique_titles" src="https://user-images.githubusercontent.com/95272294/153793801-4768ceb0-1ea9-4228-a297-2d2c6cfffa7c.png">

- People eligible to retire (born between 1952-1955) make up 30% of the company’s workforce

#### Retiring by Title
<img width="130" alt="retiring_titles" src="https://user-images.githubusercontent.com/95272294/153794160-b7dfe59a-577b-45c7-9f55-412533eb19e6.png">

- The two job titles losing the most employees to retirement are both senior positions (Senior Engineer and Senior Staff)

#### Mentorship Eligibility by Title
<img width="134" alt="mentorship_titles" src="https://user-images.githubusercontent.com/95272294/153813487-650e699b-4562-427e-bd3e-3dce91090ae0.png">

- Currently, no managers qualify for the mentorship program.

#### Mentorship Eligible Employees 
<img width="419" alt="mentorship_eligibility" src="https://user-images.githubusercontent.com/95272294/153814072-edd15027-a1ca-4dc6-ad11-1d9eb37c8346.png">

- Senior Staff are the most eligible for the Mentorship Program, with 543 employees. 

## Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  - As mass-retirement begins to make an impact, 72,458 positions will become vacant. 

<img width="198" alt="sum_rt" src="https://user-images.githubusercontent.com/95272294/153795401-45d8f491-87c4-4eb3-9500-ea7d217b0a62.png">


- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
     - Yes, there are enough qualified, retiremnet-ready employees to mentor the next generation. I created a new table to display counts of mentorship-eligible employees and ordered it by title. Then, I compared the new table, "Mentorship Titles" with the "Retiring Titles" table from above. There are at least 70% or more current employees who will retire soon that will be able to mentor the eligible 1,464 employeees. 

<img width="209" alt="mentorship_sum" src="https://user-images.githubusercontent.com/95272294/153813798-92838c43-4528-4669-abdf-fe84a9e6577c.png">




