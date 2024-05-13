.386                                    ; 386 Processor Instruction Set
 
.model     flat, stdcall
option     casemap:none
 
include    \masm32\include\windows.inc
include    \masm32\include\kernel32.inc
include    \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
 

.data

 newLine           db 10,0
 fiveDashSpace     db 45,45,45,45,45,0
 fourDashSpace     db 45,45,45,45,0
 tableBoundary     db 124,0
 tableIntersection db 43,0
 oneEmptySpace     db 45,0
 twoEmptySpace     db 45,45,0
 threeEmptySpace   db 45,45,45,0
 fourEmptySpace    db 45,45,45,45,0
 fiveEmptySpace    db 45,45,45,45,45,0

 ProspectusHeader db "BACHELOR OF SECONDARY EDUCATION MAJOR IN MATHEMATICS",10,0
 firstYearHeader  db "First Year",10,0
 secondYearHeader db "Second Year",10,0
 thirdYearHeader  db "Third Year",10,0
 fourthYearHeader db "Fourth Year",10,0

 topBorder            db "+---------------+-----------------------------------------------------------+--------+---------+-------+----------+",10, 0
 firstSemesterHeader  db "|First Semester                                                             |     Unit Distributtion   |          |",10, 0
 secondSemesterHeader db "|Second Semester                                                            |     Unit Distributtion   |          |",10, 0
 secondaryHeader      db "+---------------+-----------------------------------------------------------+--------+---------+-------+  Pre Req |",10, 0
 thirdHeader          db "|Subj Code      |                   Subject Title                           |Lec     |Lab      |Total  |          |",10, 0
 bottomBorder         db "+---------------+-----------------------------------------------------------+--------+---------+-------+----------+",10, 0

 ;first year first sem
 fYearFiSem1     db "[1]|GE 1        | Understanding the Self                                    |3       |0        |3      |NONE      |",10, 0
 fYearFiSem2     db "[2]|GE 2        | Purposive Communication w/ Interactive Learning           |6       |0        |6      |NONE      |",10, 0
 fYearFiSem3     db "[3]|GE 4        | Mathematics in the Modern World                           |3       |0        |3      |NONE      |",10, 0
 fYearFiSem4     db "[4]|EDUC 101    | The Child and Adolescent Learners and Learning Principles |3       |0        |3      |NONE      |",10, 0
 fYearFiSem5     db "[5]|MTH 111     | History of Mathematics                                    |3       |0        |3      |NONE      |",10, 0
 fYearFiSem6     db "[6]|MTH 112     | College & Adcanced Algebra                                |3       |0        |3      |NONE      |",10, 0
 fYearFiSem7     db "[7]|PAHF 1      | Movement Competency Training                              |3       |0        |3      |NONE      |",10, 0
 fYearFiSem8     db "[8]|NSTP 1      | National Service Training Program 1                       |2       |0        |2      |NONE      |",10, 0
 fYearFiSemUnits db "|                                                               Total Units |26      |0        |26     |          |",10, 0

 ;first year second sem
 fYearSeSem1     db "[1]|UGE 1       | Reading Comprehension                                     |6       |0        |6      |GE 2      |",10, 0
 fYearSeSem2     db "[2]|LP 100      | Strategic Lesson Planning and Design                      |3       |0        |3      |NONE      |",10, 0
 fYearSeSem3     db "[3]|EDUC 102    | Technology for Teaching and Learning 1                    |3       |0        |3      |NONE      |",10, 0
 fYearSeSem4     db "[4]|EDUC 103    | Facilitating Learner-Centered Teaching                    |3       |0        |3      |EDUC 101  |",10, 0
 fYearSeSem5     db "[5]|MTH 121     | Trigonometry (1st)                                        |3       |0        |3      |MTH 112   |",10, 0
 fYearSeSem6     db "[6]|MTH 122     | Plane and Solid Geometry (2nd)                            |3       |0        |3      |MTH 112   |",10, 0
 fYearSeSem7     db "[7]|PAHF 2      | Exercise-Based Fitness Activities                         |2       |0        |2      |PAHF 1    |",10, 0
 fYearSeSem8     db "[8]|NSTP 2      | National Service Training Program 1                       |3       |0        |3      |NSTP 1    |",10, 0
 fYearSeSemUnits db "|                                                               Total Units |26      |0        |26     |          |",10, 0

  ;second year first sem
 sYearFiSem1     db "[1]|GE 6        | Rizal's Life and Works                                    |3       |0        |3      |NONE      |",10, 0
 sYearFiSem2     db "[2]|EDUC 104    | Foundation of Special and Inclusive Education             |3       |0        |3      |NONE      |",10, 0
 sYearFiSem3     db "[3]|EDUC 105    | Assessment of Learnign 1                                  |3       |0        |3      |EDUC 103  |",10, 0
 sYearFiSem4     db "[4]|MTH 212     | Logic & Set Theory                                        |3       |0        |3      |NONE      |",10, 0
 sYearFiSem5     db "[5]|MTH 213     | Elementary Statistics & Probability                       |3       |0        |3      |NONE      |",10, 0
 sYearFiSem6     db "[6]|MTH 214     | Calculus 1 with Analytic Geometry                         |4       |0        |4      |MTH 122   |",10, 0
 sYearFiSem7     db "[7]|MTH 215     | Mathematics of Investment                                 |3       |0        |3      |MTH 112   |",10, 0
 sYearFiSem8     db "[8]|PAHF3       | Dance and Sports 1                                        |2       |0        |2      |PAFH 2    |",10, 0
 sYearFiSemUnits db "|                                                               Total Units |24      |0        |24     |          |",10, 0


 ;second year second sem
 sYearSeSem1     db "[1]|GE 8        | Reading in Philippine History                             |3       |0        |3      |NONE      |",10, 0
 sYearSeSem2     db "[2]|GE 5        | Science, Technology, and Society                          |3       |0        |3      |NONE      |",10, 0
 sYearSeSem3     db "[3]|EDUC 106    | The Teacher and the School Curriculum                     |3       |0        |3      |NONE      |",10, 0
 sYearSeSem4     db "[4]|EDUC 107    | Assessment of Learning 2                                  |3       |0        |3      |EDUC 105  |",10, 0
 sYearSeSem5     db "[5]|MTH 221     | Calculus 2                                                |4       |0        |4      |MTH 214   |",10, 0
 sYearSeSem6     db "[6]|MTH 222     | Number Theory                                             |3       |0        |3      |MTH 212   |",10, 0
 sYearSeSem7     db "[7]|MTH 223     | Modern Geometry                                           |3       |0        |3      |MTH 212,  |",10, 0
 sYearSeSem7Ext  db "|               |                                                           |        |         |       |MTH 122   |",10, 0
 sYearSeSem8     db "[8]|PAFH 4      | Dance and Sports 2                                        |2       |0        |2      |PAHF 3    |",10, 0
 sYearSeSemUnits db "|                                                               Total Units |24      |0        |24     |          |",10, 0


;second year summer
 secondYearSummerHeader       db "+---------------+------------------------------------SUMMER-----------------------------------+--------+---------+-------+----------+",10, 0
 secondYearSummerTopBorder    db "+---------------+-----------------------------------------------------------------------------+--------+---------+-------+----------+",10, 0
 secondYearSummer1            db "[1]|EDUC 110    | The Teacher and the Community, School Culture and Organizational Leadership |3       |0        |3      |NONE      |",10, 0
 secondYearSummer2            db "[2]|GE 9        | Ethics (Disciplinal)                                                        |3       |0        |3      |NONE      |",10, 0
 secondYearSummer3            db "[3]|GE 7        | Art Appreciation                                                            |3       |0        |3      |NONE      |",10, 0
 secondYearSummercenterBorder db "+---------------+-----------------------------------------------------------------------------+--------+---------+-------+----------+",10, 0
 secondYearSummerUnits        db "|                                                                               Total Units   |9       |0        |9      |          |",10, 0
 secondYearSummerbottomBorder db "+---------------+-----------------------------------------------------------------------------+--------+---------+-------+----------+",10, 0


  ;third year first sem
 tYearFiSem1     db "[1]|GE 20       | Reading Visual Arts                                       |3       |0        |3      |NONE      |",10, 0
 tYearFiSem2     db "[2]|GE 15       | Environment Science                                       |6       |0        |6      |NONE      |",10, 0
 tYearFiSem3     db "[3]|EDUC 108    | Building & Enhancing New Literacies Across the Curriculum |3       |0        |3      |NONE      |",10, 0
 tYearFiSem4     db "[4]|MTH 412     | Reasearch in Mathematics 1                                |3       |0        |3      |EDUC 107  |",10, 0
 tYearFiSem5     db "[5]|MTH 311     | Calculus 3                                                |4       |0        |4      |MTH 221   |",10, 0
 tYearFiSem6     db "[6]|MTH 312     | Linear Algebra                                            |3       |0        |3      |MTH 212   |",10, 0
 tYearFiSem7     db "[7]|MTH 313     | Advanced Statistics                                       |3       |0        |3      |MTH 212,  |",10, 0
 tYearFiSem7Ext  db "|               |                                                           |        |         |       |MTH 213   |",10, 0
 tYearFiSem8     db "[8]|MTH 314     | Principles & Strategies in Teaching Mathematics           |3       |0        |3      |EDUC 103  |",10, 0
 tYearFiSemUnits db "|                                                               Total Units |25      |0        |25     |          |",10, 0

 ;third year second sem
 tYearSeSem1     db "[1]|EDUC 109    | The Teaching Profession                                   |3       |0        |3      |NONE      |",10, 0
 tYearSeSem2     db "[2]|CAED 500c   | Career and Personality Development                        |3       |0        |3      |3rd yr    |",10, 0
 tYearSeSem2Ext  db "|                                                                                                      |Standing  |",10, 0
 tYearSeSem3     db "[3]|MTH 413     | Research in Mathematics 2                                 |3       |0        |3      |MTH 412   |",10, 0
 tYearSeSem4     db "[4]|MTH 321     | Problem Solving, Mathematical Investegation & Modeling    |3       |0        |3      |MTH 212   |",10, 0
 tYearSeSem5     db "[5]|MTH 322     | Abstract Algebra                                          |3       |0        |3      |MTH212    |",10, 0
 tYearSeSem6     db "[6]|MTH 323/L   | Instrumentation & Evaluation in Mathematics               |2       |1        |3      |EDUC 102, |",10, 0
 tYearSeSem6Ext  db "|               |                                                           |        |         |       |EDUC 105  |",10, 0
 tYearSeSem7     db "[7]|MTH 324     | Assesment & Evaluation in Mathematics                     |3       |0        |3      |EDUC 106  |",10, 0
 tYearSeSem8     db "[8]|MTH 325     | Differential Equations                                    |3       |0        |3      |MTH 311   |",10, 0
 tYearSeSemUnits db "|                                                               Total Units |23      |1        |24     |          |",10, 0

 ;thid year summer
 thirdYearSummerHeader       db "+---------------+---------------------------SUMMER--------------------------+--------+---------+-------+----------+",10, 0
 thirdYearSummerTopBorder    db "+---------------+-----------------------------------------------------------+--------+---------+-------+----------+",10, 0
 thirdYearSummer1            db "[1]|FIL 215     | Malayuning Komounikasyon sa Wikang Filipino               |3       |0        |3      |NONE      |",10, 0
 thirdYearSummer2            db "[2]|GE 11       | The Entrepreneurial Mind                                  |3       |0        |3      |NONE      |",10, 0
 thirdYearSummer3            db "[3]|GE 3        | The Contemporary World                                    |3       |0        |3      |NONE      |",10, 0
 thirdYearSummercenterBorder db "+---------------+-----------------------------------------------------------+--------+---------+-------+----------+",10, 0
 thirdYearSummerUnits        db "|                                                               Total Units |9       |0        |9      |          |",10, 0
 thirdYearSummerbottomBorder db "+---------------+-----------------------------------------------------------+--------+---------+-------+----------+",10, 0



  ;fourth year first sem
 fourthYearFiSem1      db "[1]|FS 1        | Field Study 1 (1st T)                                     |3       |0        |3      |MTH 413   |",10, 0
 fourthYearFiSem2      db "[2]|FS 2        | Field Study 2 (2nd T)                                     |3       |0        |3      |MTH 413   |",10, 0
 fourthYearFiSem3      db "[3]|CA 501      | General Education                                         |5       |0        |5      |MTH 413   |",10, 0
 fourthYearFiSem4      db "[4]|CA 502      | Professional Education                                    |5       |0        |5      |MTH 413   |",10, 0
 fourthYearSeSemUnits1 db "|                                                               Total Units |16      |0        |16     |          |",10, 0

 ;fourth year second sem
 fourthYearSeSem1      db "[1]|ED 421      | Teaching Internship                                       |6       |0        |6      |FS 1, FS 2|",10, 0
 fourthYearSeSem2      db "[2]|CA 503      | Specialization                                            |5       |0        |5      |FS 1, FS 2|",10, 0
 fourthYearSeSemUnits2 db "|                                                               Total Units |11      |0        |11     |          |",10, 0

 menuheader   db 10,10,"*****University of Mindanao BS in Secondary Education Major in Mathematics Prospectus Viewer*****",10,10,0
 menuprompt1  db "[1] View Complete Prospectus",10,0
 menuprompt2  db "[2] View Prospectus by Year and Sem",10,0
 menuprompt3  db "[3] Enroll a Course",10,0
 menuprompt4  db "[4] Exit",10,10,0
 menuDivider  db "*****************************************************",10,10,0
 choiceprompt db "Pick an Option:",10,"=>",32,32,0

 yearPrompt     db 10,"Enter year: ",10,0
 semesterPrompt db 10,"Enter semester: ",10,0

 namePrompt     db 10,"Enter Your Name: ",0
 idNumberPrompt db 10,"Enter Your ID Number: ",0

 enrolledHeader  db 10,"YOU ARE NOW ENROLLED IN THE FOLLOWING COURSES",0
 nameDisplay     db 10,"Student Name:   ",0
 idNumberDisplay db 10,"Student ID:     ",0
 
 chooseYearPrompt        db 10,"Enter a year to enroll (Choose 1-4): ",0
 chooseYearOptionsFirst  db 10,"(1) 1st Year",0
 chooseYearOptionsSecond db 10,"(2) 2nd Year",0
 chooseYearOptionsThird  db 10,"(3) 3rd Year",0
 chooseYearOptionsFourth db 10,"(4) 4th Year",0

 chooseSemesterPrompt       db 10,"Enter a semester to enroll (Choose 1-3): ",0
 chooseSemesterPrompt2      db 10,"Enter a semester to enroll (Choose 1-2): ",0
 chooseSemesterOptionFirst  db 10,"(1) 1st Semester",0
 chooseSemesterOptionSecond db 10,"(2) 2nd Semester",0
 chooseSemesterOptionThird  db 10,"(3) summer",0

 chooseEightSubjectPrompt db 10,"Select from 1-8 subjects one by one: ",0
 chooseTwoSubjectPrompt   db 10,"Select from 1-2 subjects one by one: ",0
 chooseThreeSubjectPrompt db 10,"Select from 1-3 subjects one by one: ",0
 chooseFourSubjectPrompt  db 10,"Select from 1-4 subjects one by one: ",0

 enterValidPrompt db 10,"Enter Valid Input",0

 totalUnitsDisplay db 10,"Total Number of Units Taken: ",0

 errorMessage db 10,"Invalid Input!",0

 blankMessage db 10,"Input is Empty!",0

 .data?
    optionInput   db 1 dup(?)
    yearInput     db 1 dup(?)
    semesterInput db 1 dup(?)

    nameInput     db 40 dup(?)
    idNumberInput db 40 dup(?)

    yearEnrollInput     db 40 dup(?)
    semesterEnrollInput db 40 dup(?)

    courseInput db 40 dup(?)

    totalUnits DWORD ?
    totalUnitsBuffer db 50 dup (?)

    selectedSemesterPlaceholder db 256 dup(0)
    firstCoursePlaceholder      db 256 dup(0)
    secondCoursePlaceholder     db 256 dup(0)
    thirdCoursePlaceholder      db 256 dup(0)
    fourthCoursePlaceholder     db 256 dup(0)
    fifthCoursePlaceholder      db 256 dup(0)
    sixthCoursePlaceholder      db 256 dup(0)
    seventhCoursePlaceholder    db 256 dup(0)
    eightCoursePlaceholder      db 256 dup(0)

.code  

start:   
display:
invoke StdOut, addr menuheader
invoke StdOut, addr menuprompt1
invoke StdOut, addr menuprompt2
invoke StdOut, addr menuprompt3
invoke StdOut, addr menuprompt4
invoke StdOut, addr menuDivider
invoke StdOut, addr choiceprompt

invoke StdIn, addr optionInput,50

NextSection:
    .if optionInput == "1"

        invoke StdOut, addr firstYearHeader
        ; First year first Semester Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr firstSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; First Year First Sem
        invoke StdOut, addr fYearFiSem1
        invoke StdOut, addr fYearFiSem2
        invoke StdOut, addr fYearFiSem3
        invoke StdOut, addr fYearFiSem4
        invoke StdOut, addr fYearFiSem5
        invoke StdOut, addr fYearFiSem6
        invoke StdOut, addr fYearFiSem7
        invoke StdOut, addr fYearFiSem8
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr fYearFiSemUnits
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        ; first year Second Sem Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr secondSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; First Year Second Sem
        invoke StdOut, addr fYearSeSem1
        invoke StdOut, addr fYearSeSem2
        invoke StdOut, addr fYearSeSem3
        invoke StdOut, addr fYearSeSem4
        invoke StdOut, addr fYearSeSem5
        invoke StdOut, addr fYearSeSem6
        invoke StdOut, addr fYearSeSem7
        invoke StdOut, addr fYearSeSem8
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr fYearSeSemUnits
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        invoke StdOut, addr secondYearHeader
        ; second year First Semester Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr firstSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; Second Year First Sem
        invoke StdOut, addr sYearFiSem1
        invoke StdOut, addr sYearFiSem2
        invoke StdOut, addr sYearFiSem3
        invoke StdOut, addr sYearFiSem4
        invoke StdOut, addr sYearFiSem5
        invoke StdOut, addr sYearFiSem6
        invoke StdOut, addr sYearFiSem7
        invoke StdOut, addr sYearFiSem8
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr sYearFiSemUnits
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        ; Second Sem Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr secondSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; Second Year Second Sem
        invoke StdOut, addr sYearSeSem1
        invoke StdOut, addr sYearSeSem2
        invoke StdOut, addr sYearSeSem3
        invoke StdOut, addr sYearSeSem4
        invoke StdOut, addr sYearSeSem5
        invoke StdOut, addr sYearSeSem6
        invoke StdOut, addr sYearSeSem7
        invoke StdOut, addr sYearSeSem7Ext
        invoke StdOut, addr sYearSeSem8
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr sYearSeSemUnits
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        ; Second Year Summer
        invoke StdOut, addr secondYearSummerHeader
        invoke StdOut, addr secondYearSummerTopBorder
        invoke StdOut, addr secondYearSummer1
        invoke StdOut, addr secondYearSummer2
        invoke StdOut, addr secondYearSummer3
        invoke StdOut, addr secondYearSummercenterBorder
        invoke StdOut, addr secondYearSummerUnits
        invoke StdOut, addr secondYearSummerbottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine

        invoke StdOut, addr thirdYearHeader
        ; First Semester Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr firstSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; Third Year First Sem
        invoke StdOut, addr tYearFiSem1
        invoke StdOut, addr tYearFiSem2
        invoke StdOut, addr tYearFiSem3
        invoke StdOut, addr tYearFiSem4
        invoke StdOut, addr tYearFiSem5
        invoke StdOut, addr tYearFiSem6
        invoke StdOut, addr tYearFiSem7
        invoke StdOut, addr tYearFiSem7Ext
        invoke StdOut, addr tYearFiSem8
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr tYearFiSemUnits
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        ; Second Sem Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr secondSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; Third Year Second Sem
        invoke StdOut, addr tYearSeSem1
        invoke StdOut, addr tYearSeSem2
        invoke StdOut, addr tYearSeSem2Ext
        invoke StdOut, addr tYearSeSem3
        invoke StdOut, addr tYearSeSem4
        invoke StdOut, addr tYearSeSem5
        invoke StdOut, addr tYearSeSem6
        invoke StdOut, addr tYearSeSem6Ext
        invoke StdOut, addr tYearSeSem7
        invoke StdOut, addr tYearSeSem8
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr tYearSeSemUnits
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        ; Third Year Summer
        invoke StdOut, addr thirdYearSummerHeader
        invoke StdOut, addr thirdYearSummerTopBorder
        invoke StdOut, addr thirdYearSummer1
        invoke StdOut, addr thirdYearSummer2
        invoke StdOut, addr thirdYearSummer3
        invoke StdOut, addr thirdYearSummercenterBorder
        invoke StdOut, addr thirdYearSummerUnits
        invoke StdOut, addr thirdYearSummerbottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine

        invoke StdOut, addr fourthYearHeader
        ; First Semester Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr firstSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; Fourth Year First Sem
        invoke StdOut, addr fourthYearFiSem1
        invoke StdOut, addr fourthYearFiSem2
        invoke StdOut, addr fourthYearFiSem3
        invoke StdOut, addr fourthYearFiSem4
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr fourthYearSeSemUnits1
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr newLine
        invoke StdOut, addr newLine
        ; Second Sem Headers
        invoke StdOut, addr topBorder
        invoke StdOut, addr secondSemesterHeader
        invoke StdOut, addr secondaryHeader
        invoke StdOut, addr thirdHeader
        invoke StdOut, addr bottomBorder
        ; Fourth Year Second Sem
        invoke StdOut, addr fourthYearSeSem1
        invoke StdOut, addr fourthYearSeSem2
        invoke StdOut, addr bottomBorder
        invoke StdOut, addr fourthYearSeSemUnits2
        invoke StdOut, addr bottomBorder
    
    .elseif optionInput == "2"

        invoke StdOut, addr yearPrompt
        invoke StdIn, addr yearInput,50

        .if yearInput == "1"
            invoke StdOut, addr semesterPrompt
            invoke StdIn, addr semesterInput,50

            .if semesterInput == "1"
                ; First year first Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr fYearFiSem1
                invoke StdOut, addr fYearFiSem2
                invoke StdOut, addr fYearFiSem3
                invoke StdOut, addr fYearFiSem4
                invoke StdOut, addr fYearFiSem5
                invoke StdOut, addr fYearFiSem6
                invoke StdOut, addr fYearFiSem7
                invoke StdOut, addr fYearFiSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

            .elseif semesterInput == "2"
                ; first year Second Sem Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year Second Sem
                invoke StdOut, addr fYearSeSem1
                invoke StdOut, addr fYearSeSem2
                invoke StdOut, addr fYearSeSem3
                invoke StdOut, addr fYearSeSem4
                invoke StdOut, addr fYearSeSem5
                invoke StdOut, addr fYearSeSem6
                invoke StdOut, addr fYearSeSem7
                invoke StdOut, addr fYearSeSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fYearSeSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                invoke StdOut, addr secondYearHeader
            .endif

        .elseif yearInput == "2"
            invoke StdOut, addr semesterPrompt
            invoke StdIn, addr semesterInput,50

            .if semesterInput == "1"
                ; second year First Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; Second Year First Sem
                invoke StdOut, addr sYearFiSem1
                invoke StdOut, addr sYearFiSem2
                invoke StdOut, addr sYearFiSem3
                invoke StdOut, addr sYearFiSem4
                invoke StdOut, addr sYearFiSem5
                invoke StdOut, addr sYearFiSem6
                invoke StdOut, addr sYearFiSem7
                invoke StdOut, addr sYearFiSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr sYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
        

            .elseif semesterInput == "2"
                ; Second Sem Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; Second Year Second Sem
                invoke StdOut, addr sYearSeSem1
                invoke StdOut, addr sYearSeSem2
                invoke StdOut, addr sYearSeSem3
                invoke StdOut, addr sYearSeSem4
                invoke StdOut, addr sYearSeSem5
                invoke StdOut, addr sYearSeSem6
                invoke StdOut, addr sYearSeSem7
                invoke StdOut, addr sYearSeSem7Ext
                invoke StdOut, addr sYearSeSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr sYearSeSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine


            .elseif semesterInput == "3"
                ; Second Year Summer
                invoke StdOut, addr secondYearSummerHeader
                invoke StdOut, addr secondYearSummerTopBorder
                invoke StdOut, addr secondYearSummer1
                invoke StdOut, addr secondYearSummer2
                invoke StdOut, addr secondYearSummer3
                invoke StdOut, addr secondYearSummercenterBorder
                invoke StdOut, addr secondYearSummerUnits
                invoke StdOut, addr secondYearSummerbottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                invoke StdOut, addr thirdYearHeader
            .endif

        .elseif yearInput == "3"
            invoke StdOut, addr semesterPrompt
            invoke StdIn, addr semesterInput,50

            .if semesterInput == "1"
                ; First Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; Third Year First Sem
                invoke StdOut, addr tYearFiSem1
                invoke StdOut, addr tYearFiSem2
                invoke StdOut, addr tYearFiSem3
                invoke StdOut, addr tYearFiSem4
                invoke StdOut, addr tYearFiSem5
                invoke StdOut, addr tYearFiSem6
                invoke StdOut, addr tYearFiSem7
                invoke StdOut, addr tYearFiSem7Ext
                invoke StdOut, addr tYearFiSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr tYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine


            .elseif semesterInput == "2"
                ; Second Sem Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; Third Year Second Sem
                invoke StdOut, addr tYearSeSem1
                invoke StdOut, addr tYearSeSem2
                invoke StdOut, addr tYearSeSem2Ext
                invoke StdOut, addr tYearSeSem3
                invoke StdOut, addr tYearSeSem4
                invoke StdOut, addr tYearSeSem5
                invoke StdOut, addr tYearSeSem6
                invoke StdOut, addr tYearSeSem6Ext
                invoke StdOut, addr tYearSeSem7
                invoke StdOut, addr tYearSeSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr tYearSeSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

            .elseif semesterInput == "3"
                ; Third Year Summer
                invoke StdOut, addr thirdYearSummerHeader
                invoke StdOut, addr thirdYearSummerTopBorder
                invoke StdOut, addr thirdYearSummer1
                invoke StdOut, addr thirdYearSummer2
                invoke StdOut, addr thirdYearSummer3
                invoke StdOut, addr thirdYearSummercenterBorder
                invoke StdOut, addr thirdYearSummerUnits
                invoke StdOut, addr thirdYearSummerbottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
            .endif

        .elseif yearInput == "4"
            invoke StdOut, addr semesterPrompt
            invoke StdIn, addr semesterInput,50

            .if semesterInput == "1"
                ; First Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; Fourth Year First Sem
                invoke StdOut, addr fourthYearFiSem1
                invoke StdOut, addr fourthYearFiSem2
                invoke StdOut, addr fourthYearFiSem3
                invoke StdOut, addr fourthYearFiSem4
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fourthYearSeSemUnits1
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine


            .elseif semesterInput == "2"
                ; Second Sem Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; Fourth Year Second Sem
                invoke StdOut, addr fourthYearSeSem1
                invoke StdOut, addr fourthYearSeSem2
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fourthYearSeSemUnits2
                invoke StdOut, addr bottomBorder
            .endif
        .endif

    .elseif optionInput == "3"

    NameInput:
        ; Display name prompt
        invoke StdOut, addr namePrompt

        ; Read name input
        invoke StdIn, addr nameInput, 50

        ; Check if name input is empty
        cmp byte ptr [nameInput], 0  ; Compare with null terminator
        je EmptyNameInput            ; If equal, input is empty

        ; Check if input contains only alphabets or spaces
        lea esi, [nameInput]  ; Load effective address of nameInput into esi
        mov ecx, 0            ; Initialize counter for characters not alphabets or spaces
        .while byte ptr [esi] != 0  ; Loop until null terminator is reached
        cmp byte ptr [esi], ' ' ; Check if it's a space
        je SpaceDetected   ; If it's a space, skip to SpaceDetected
        cmp byte ptr [esi], 'a' ; Compare with 'a'
        jl CheckUppercase  ; If less than 'a', check uppercase
        cmp byte ptr [esi], 'z' ; Compare with 'z'
        jg CheckUppercase  ; If greater than 'z', check uppercase
        jmp NameInputContinue   ; It's a lowercase letter, continue the loop
        
        CheckUppercase:
        cmp byte ptr [esi], 'A' ; Compare with 'A'
        jl NotAlphabet     ; If less than 'A', it's not an alphabet
        cmp byte ptr [esi], 'Z' ; Compare with 'Z'
        jg NotAlphabet     ; If greater than 'Z', it's not an alphabet
        
        NameInputContinue:
        inc esi            ; Move to the next character
        .endw
        jmp NameInputContinueLower ; Input contains only alphabets (both lowercase and uppercase) and spaces, continue execution

        SpaceDetected:
        inc esi            ; Move to the next character
        jmp NameInputContinueLower   ; Continue the loop

        NotAlphabet:
        ; Display error message
        invoke StdOut, addr errorMessage
        ; Jump back to re-entering the name input
        jmp NameInput

        EmptyNameInput:
        ; Display error message for empty input
        invoke StdOut, addr blankMessage
        ; Jump back to re-entering the name input
        jmp NameInput

        NameInputContinueLower:
        jmp IdNumberInput

        IdNumberInput:
        ; Display id number prompt
        invoke StdOut, addr idNumberPrompt

        ; Read id number input
        invoke StdIn, addr idNumberInput, 50

        ; Check if id number input is empty
        cmp byte ptr [idNumberInput], 0  ; Compare with null terminator
        je EmptyIdNumberInput            ; If equal, input is empty

        ; Check if input contains only numbers
        lea esi, [idNumberInput]  ; Load effective address of idNumberInput into esi
        mov ecx, 0                ; Initialize counter for characters not numbers
        .while byte ptr [esi] != 0  ; Loop until null terminator is reached
            cmp byte ptr [esi], '0' ; Compare with '0'
            jl NotNumber           ; If less than '0', it's not a number
            cmp byte ptr [esi], '9' ; Compare with '9'
            jg NotNumber           ; If greater than '9', it's not a number
            inc esi                ; Move to the next character
        .endw
        jmp EnrollOption ; Input contains only numbers, continue execution

        NotNumber:
        ; Display error message
        invoke StdOut, addr errorMessage
        ; Jump back to re-entering the id number input
        jmp IdNumberInput

        EmptyIdNumberInput:
        ; Display error message for empty input
        invoke StdOut, addr blankMessage
        ; Jump back to re-entering the id number input
        jmp IdNumberInput

        EnrollOption:
        invoke StdOut, addr newLine
        invoke StdOut, addr chooseYearOptionsFirst
        invoke StdOut, addr chooseYearOptionsSecond
        invoke StdOut, addr chooseYearOptionsThird
        invoke StdOut, addr chooseYearOptionsFourth
        invoke StdOut, addr chooseYearPrompt
        invoke StdIn, addr yearEnrollInput,50

        ; Error handling for invalid input
        cmp byte ptr [yearEnrollInput], '1' 
        jl InvalidYearInput ; Jump if less than 1
        cmp byte ptr [yearEnrollInput], '4' 
        jg InvalidYearInput ; Jump if greater than 4

        jmp SecondOption

        InvalidYearInput:
        invoke StdOut, addr errorMessage
        jmp EnrollOption

        SecondOption:
        invoke StdOut, addr chooseSemesterOptionFirst
        invoke StdOut, addr chooseSemesterOptionSecond
        .if yearEnrollInput != '1' && yearEnrollInput != '4'
            invoke StdOut, addr chooseSemesterOptionThird
        .endif
        .if yearEnrollInput == '1' || yearEnrollInput == '4'
            invoke StdOut, addr chooseSemesterPrompt2  
        .else
            invoke StdOut, addr chooseSemesterPrompt   
        .endif
        invoke StdIn, addr semesterEnrollInput,50
        invoke StdOut, addr newLine

        ; Error handling for invalid input
        .if yearEnrollInput == '1' || yearEnrollInput == '4'
            ; Check if the input is not 1 or 2
            cmp byte ptr [semesterEnrollInput], '1'
            jl  InvalidInput
            cmp byte ptr [semesterEnrollInput], '2'
            jg  InvalidInput
        .else
            ; Check if the input is not 1, 2, or 3
            cmp byte ptr [semesterEnrollInput], '1'
            jl  InvalidInput
            cmp byte ptr [semesterEnrollInput], '3'
            jg  InvalidInput
        .endif

        ; Valid input, continue execution
        jmp ContinueExecution

        InvalidInput:
        invoke StdOut, addr errorMessage
        jmp EnrollOption

    ContinueExecution:
        .if yearEnrollInput == '1'
            .if semesterEnrollInput == '1'

                ; First year first Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr fYearFiSem1
                invoke StdOut, addr fYearFiSem2
                invoke StdOut, addr fYearFiSem3
                invoke StdOut, addr fYearFiSem4
                invoke StdOut, addr fYearFiSem5
                invoke StdOut, addr fYearFiSem6
                invoke StdOut, addr fYearFiSem7
                invoke StdOut, addr fYearFiSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                jmp FirstYearFirstSemester

            .elseif semesterEnrollInput == '2'

                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr fYearSeSem1
                invoke StdOut, addr fYearSeSem2
                invoke StdOut, addr fYearSeSem3
                invoke StdOut, addr fYearSeSem4
                invoke StdOut, addr fYearSeSem5
                invoke StdOut, addr fYearSeSem6
                invoke StdOut, addr fYearSeSem7
                invoke StdOut, addr fYearSeSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fYearSeSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

                jmp FirstYearSecondSemester
            .endif
        .elseif yearEnrollInput == '2'
            .if semesterEnrollInput == '1'
            
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr sYearFiSem1
                invoke StdOut, addr sYearFiSem2
                invoke StdOut, addr sYearFiSem3
                invoke StdOut, addr sYearFiSem4
                invoke StdOut, addr sYearFiSem5
                invoke StdOut, addr sYearFiSem6
                invoke StdOut, addr sYearFiSem7
                invoke StdOut, addr sYearFiSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr sYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

                jmp SecondYearFirstSemester

            .elseif semesterEnrollInput == '2'

                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr sYearSeSem1
                invoke StdOut, addr sYearSeSem2
                invoke StdOut, addr sYearSeSem3
                invoke StdOut, addr sYearSeSem4
                invoke StdOut, addr sYearSeSem5
                invoke StdOut, addr sYearSeSem6
                invoke StdOut, addr sYearSeSem7
                invoke StdOut, addr sYearSeSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr sYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

                jmp SecondYearSecondSemester
                
            .elseif semesterEnrollInput == '3'

                invoke StdOut, addr secondYearSummerHeader
                invoke StdOut, addr secondYearSummerTopBorder
                ; First Year First Sem
                invoke StdOut, addr secondYearSummer1
                invoke StdOut, addr secondYearSummer2
                invoke StdOut, addr secondYearSummer3
                invoke StdOut, addr secondYearSummercenterBorder
                invoke StdOut, addr secondYearSummerUnits
                invoke StdOut, addr secondYearSummerbottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

                jmp SecondYearSummer
                
            .endif
        .elseif yearEnrollInput == '3'
            .if semesterEnrollInput == '1'

                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr tYearFiSem1
                invoke StdOut, addr tYearFiSem2
                invoke StdOut, addr tYearFiSem3
                invoke StdOut, addr tYearFiSem4
                invoke StdOut, addr tYearFiSem5
                invoke StdOut, addr tYearFiSem6
                invoke StdOut, addr tYearFiSem7
                invoke StdOut, addr tYearFiSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr tYearFiSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine

                jmp ThirdYearFirstSemester

            .elseif semesterEnrollInput == '2'

                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr tYearSeSem1
                invoke StdOut, addr tYearSeSem2
                invoke StdOut, addr tYearSeSem3
                invoke StdOut, addr tYearSeSem4
                invoke StdOut, addr tYearSeSem5
                invoke StdOut, addr tYearSeSem6
                invoke StdOut, addr tYearSeSem7
                invoke StdOut, addr tYearSeSem8
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr tYearSeSemUnits
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                jmp ThirdYearSecondSemester

            .elseif semesterEnrollInput == '3'

                invoke StdOut, addr thirdYearSummerHeader
                invoke StdOut, addr thirdYearSummerTopBorder
                invoke StdOut, addr thirdYearSummer1
                invoke StdOut, addr thirdYearSummer2
                invoke StdOut, addr thirdYearSummer3
                invoke StdOut, addr thirdYearSummercenterBorder
                invoke StdOut, addr thirdYearSummerUnits
                invoke StdOut, addr thirdYearSummerbottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                jmp ThirdYearSummer

            .endif
        .elseif yearEnrollInput == '4'
            .if semesterEnrollInput == '1'

                ; First year first Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr firstSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr fourthYearFiSem1
                invoke StdOut, addr fourthYearFiSem2
                invoke StdOut, addr fourthYearFiSem3
                invoke StdOut, addr fourthYearFiSem4
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fourthYearSeSemUnits1
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                jmp FourthYearFirstSemester

            .elseif semesterEnrollInput == '2'

                ; First year first Semester Headers
                invoke StdOut, addr topBorder
                invoke StdOut, addr secondSemesterHeader
                invoke StdOut, addr secondaryHeader
                invoke StdOut, addr thirdHeader
                invoke StdOut, addr bottomBorder
                ; First Year First Sem
                invoke StdOut, addr fourthYearSeSem1
                invoke StdOut, addr fourthYearSeSem2
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr fourthYearSeSemUnits2
                invoke StdOut, addr bottomBorder
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                jmp FourthYearSecondSemester

            .endif
        .endif

        FirstYearFirstSemester:

            mov       esi, offset firstSemesterHeader         ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof firstSemesterHeader         ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseEightSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add       eax,        2
                    add       totalUnits, eax
                    mov       esi,        offset fYearFiSem1            ; Source string
                    mov       edi,        offset firstCoursePlaceholder ; Destination string
                    mov       ecx,        sizeof fYearFiSem1            ; Number of bytes to copy
                    cld                                                 ; Clear direction flag to move forward
                    rep movsb                                           ; Copy byte by byte
            .elseif courseInput == '2'
                    add eax,        5
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem2             ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem2             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem3            ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem3            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem4             ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem4             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '5'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem5            ; Source string
                    mov edi,        offset fifthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem5            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '6'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem6            ; Source string
                    mov edi,        offset sixthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem6            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '7'
                    add eax,        1
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem7              ; Source string
                    mov edi,        offset seventhCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem7              ; Number of bytes to copy
                    cld                                             ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '8'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearFiSem8            ; Source string
                    mov edi,        offset eightCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearFiSem8            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder
            
            jmp FirstYearFirstSemester

        FirstYearSecondSemester:
            mov       esi, offset secondSemesterHeader        ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof secondSemesterHeader        ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseEightSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        5
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset fYearSeSem1            ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof fYearSeSem1            ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem2             ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem2             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem3            ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem3            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem4             ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem4             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '5'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem5            ; Source string
                    mov edi,        offset fifthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem5            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '6'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem6            ; Source string
                    mov edi,        offset sixthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem6            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '7'
                    add eax,        1
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem7              ; Source string
                    mov edi,        offset seventhCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem7              ; Number of bytes to copy
                    cld                                             ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '8'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fYearSeSem8            ; Source string
                    mov edi,        offset eightCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fYearSeSem8            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder
            
            jmp FirstYearSecondSemester
        
        SecondYearFirstSemester:

            mov       esi, offset firstSemesterHeader         ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof firstSemesterHeader         ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseEightSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset sYearFiSem1            ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof sYearFiSem1            ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem2             ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem2             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem3            ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem3            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem4             ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem4             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '5'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem5            ; Source string
                    mov edi,        offset fifthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem5            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '6'
                    add eax,        3
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem6            ; Source string
                    mov edi,        offset sixthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem6            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '7'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem7              ; Source string
                    mov edi,        offset seventhCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem7              ; Number of bytes to copy
                    cld                                             ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '8'
                    add eax,        1
                    add totalUnits, eax
                    mov esi,        offset sYearFiSem8            ; Source string
                    mov edi,        offset eightCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearFiSem8            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder
            
            jmp SecondYearFirstSemester

        SecondYearSecondSemester:
            mov       esi, offset firstSemesterHeader         ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof firstSemesterHeader         ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseEightSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset sYearSeSem1            ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof sYearSeSem1            ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem2             ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem2             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem3            ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem3            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem4             ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem4             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '5'
                    add eax,        3
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem5            ; Source string
                    mov edi,        offset fifthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem5            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '6'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem6            ; Source string
                    mov edi,        offset sixthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem6            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '7'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem7              ; Source string
                    mov edi,        offset seventhCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem7              ; Number of bytes to copy
                    cld                                             ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '8'
                    add eax,        1
                    add totalUnits, eax
                    mov esi,        offset sYearSeSem8            ; Source string
                    mov edi,        offset eightCoursePlaceholder ; Destination string
                    mov ecx,        sizeof sYearSeSem8            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder

            jmp SecondYearSecondSemester

        SecondYearSummer:

            mov       esi, offset secondYearSummerHeader      ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof secondYearSummerHeader      ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseThreeSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset secondYearSummer1      ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof secondYearSummer1      ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset secondYearSummer2       ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof secondYearSummer2       ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset secondYearSummer3      ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof secondYearSummer3      ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else

                invoke StdOut, addr nameDisplay
                invoke StdOut, addr nameInput
                invoke StdOut, addr idNumberDisplay
                invoke StdOut, addr idNumberInput

                invoke StdOut, addr enrolledHeader
                invoke StdOut, addr newLine
                invoke StdOut, addr secondYearSummerHeader
                invoke StdOut, addr secondYearSummerTopBorder
                invoke StdOut, addr firstCoursePlaceholder
                invoke StdOut, addr secondCoursePlaceholder
                invoke StdOut, addr thirdCoursePlaceholder
                invoke StdOut, addr secondYearSummerbottomBorder

                ; total units
                mov    eax,    totalUnits
                invoke dwtoa, eax, addr totalUnitsBuffer
                invoke StdOut, addr totalUnitsDisplay
                invoke StdOut, addr totalUnitsBuffer
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                invoke ExitProcess, 0

            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr secondYearSummerHeader
            invoke StdOut, addr secondYearSummerTopBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr secondYearSummerbottomBorder

            jmp SecondYearSummer


        ThirdYearFirstSemester:
            mov       esi, offset firstSemesterHeader         ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof firstSemesterHeader         ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseEightSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset tYearFiSem1            ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof tYearFiSem1            ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem2             ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem2             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem3            ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem3            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem4             ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem4             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '5'
                    add eax,        3
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem5            ; Source string
                    mov edi,        offset fifthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem5            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '6'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem6            ; Source string
                    mov edi,        offset sixthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem6            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '7'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem7              ; Source string
                    mov edi,        offset seventhCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem7              ; Number of bytes to copy
                    cld                                             ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '8'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearFiSem8            ; Source string
                    mov edi,        offset eightCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearFiSem8            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder

            jmp ThirdYearFirstSemester

        ThirdYearSecondSemester:

            mov       esi, offset secondSemesterHeader        ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof secondSemesterHeader        ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseEightSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset tYearSeSem1            ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof tYearSeSem1            ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem2             ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem2             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem3            ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem3            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem4             ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem4             ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '5'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem5            ; Source string
                    mov edi,        offset fifthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem5            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '6'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem6            ; Source string
                    mov edi,        offset sixthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem6            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '7'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem7              ; Source string
                    mov edi,        offset seventhCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem7              ; Number of bytes to copy
                    cld                                             ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '8'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset tYearSeSem8            ; Source string
                    mov edi,        offset eightCoursePlaceholder ; Destination string
                    mov ecx,        sizeof tYearSeSem8            ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder

            jmp ThirdYearSecondSemester

        ThirdYearSummer:

            mov       esi, offset thirdYearSummerHeader       ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof thirdYearSummerHeader       ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseThreeSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset thirdYearSummer1       ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof thirdYearSummer1       ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset thirdYearSummer2        ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof thirdYearSummer2        ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset thirdYearSummer3       ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof thirdYearSummer3       ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .else

                invoke StdOut, addr nameDisplay
                invoke StdOut, addr nameInput
                invoke StdOut, addr idNumberDisplay
                invoke StdOut, addr idNumberInput

                invoke StdOut, addr enrolledHeader
                invoke StdOut, addr newLine
                invoke StdOut, addr thirdYearSummerHeader
                invoke StdOut, addr thirdYearSummerTopBorder
                invoke StdOut, addr firstCoursePlaceholder
                invoke StdOut, addr secondCoursePlaceholder
                invoke StdOut, addr thirdCoursePlaceholder
                invoke StdOut, addr thirdYearSummerbottomBorder

                ; total units
                mov    eax,    totalUnits
                invoke dwtoa, eax, addr totalUnitsBuffer
                invoke StdOut, addr totalUnitsDisplay
                invoke StdOut, addr totalUnitsBuffer
                invoke StdOut, addr newLine
                invoke StdOut, addr newLine
                
                invoke ExitProcess, 0

            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr thirdYearSummerHeader
            invoke StdOut, addr thirdYearSummerTopBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr thirdYearSummerbottomBorder

            jmp ThirdYearSummer
        
        FourthYearFirstSemester:


            mov       esi, offset secondSemesterHeader        ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof secondSemesterHeader        ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseFourSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        2
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset fourthYearFiSem1       ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof fourthYearFiSem1       ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        2
                    add totalUnits, eax
                    mov esi,        offset fourthYearFiSem2        ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fourthYearFiSem2        ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '3'
                    add eax,        4
                    add totalUnits, eax
                    mov esi,        offset fourthYearFiSem3       ; Source string
                    mov edi,        offset thirdCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fourthYearFiSem3       ; Number of bytes to copy
                    cld                                           ; Clear direction flag to move forward
                    rep movsb   
            .elseif courseInput == '4'
                    add eax,        4
                    add totalUnits, eax
                    mov esi,        offset fourthYearFiSem4        ; Source string
                    mov edi,        offset fourthCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fourthYearFiSem4        ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder

            jmp FourthYearFirstSemester

        FourthYearSecondSemester:


            mov       esi, offset secondSemesterHeader        ; Source string
            mov       edi, offset selectedSemesterPlaceholder ; Destination string
            mov       ecx, sizeof secondSemesterHeader        ; Number of bytes to copy
            cld                                               ; Clear direction flag to move forward
            rep movsb                                         ; Copy byte by byte

            ; choose subject
            invoke StdOut, addr chooseTwoSubjectPrompt
            invoke StdIn, addr courseInput, 10
            .if    courseInput == '1'
                    add eax,        5
                    add totalUnits, eax                           ; Source string
                    mov esi,        offset fourthYearSeSem1       ; Destination string
                    mov edi,        offset firstCoursePlaceholder ; Number of bytes to copy
                    mov ecx,        sizeof fourthYearSeSem1       ; Clear direction flag to move forward
                    cld                                           ; Copy byte by byte
                    rep movsb                                           
            .elseif courseInput == '2'
                    add eax,        4
                    add totalUnits, eax
                    mov esi,        offset fourthYearSeSem2        ; Source string
                    mov edi,        offset secondCoursePlaceholder ; Destination string
                    mov ecx,        sizeof fourthYearSeSem2        ; Number of bytes to copy
                    cld                                            ; Clear direction flag to move forward
                    rep movsb   
            .else
                jmp DisplayEnrolledCourse
            .endif

            ; display selected courses
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr bottomBorder

            jmp FourthYearSecondSemester

        DisplayEnrolledCourse:
            invoke StdOut, addr nameDisplay
            invoke StdOut, addr nameInput
            invoke StdOut, addr idNumberDisplay
            invoke StdOut, addr idNumberInput

            invoke StdOut, addr enrolledHeader
            invoke StdOut, addr newLine
            invoke StdOut, addr topBorder
            invoke StdOut, addr selectedSemesterPlaceholder
            invoke StdOut, addr secondaryHeader
            invoke StdOut, addr thirdHeader
            invoke StdOut, addr bottomBorder
            invoke StdOut, addr firstCoursePlaceholder
            invoke StdOut, addr secondCoursePlaceholder
            invoke StdOut, addr thirdCoursePlaceholder
            invoke StdOut, addr fourthCoursePlaceholder
            invoke StdOut, addr fifthCoursePlaceholder
            invoke StdOut, addr sixthCoursePlaceholder
            invoke StdOut, addr seventhCoursePlaceholder
            invoke StdOut, addr eightCoursePlaceholder
            invoke StdOut, addr bottomBorder

            ; total units
            mov    eax,    totalUnits
            invoke dwtoa, eax, addr totalUnitsBuffer
            invoke StdOut, addr totalUnitsDisplay
            invoke StdOut, addr totalUnitsBuffer
            invoke StdOut, addr newLine
            invoke StdOut, addr newLine
            
            invoke ExitProcess, 0

    .elseif optionInput == "4"
        invoke ExitProcess, 0
    .else
    .endif
    jmp start

exit:
invoke ExitProcess, 0
end    start