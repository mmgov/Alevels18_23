library("DT")
library("tidyverse")
library("shinycustomloader")
library("shinythemes")

shinythemes::themeSelector()

navbarPage(
  
"A level Attainment in England 2018/19, 2021/22 and 2022/23",
# tabPanel(
#   "App Info",
#   fluidPage(
#     #theme = shinythemes::shinytheme("united"),
#     #theme = shinythemes::shinytheme("yeti"),
#     #theme = shinythemes::shinytheme("cerulean"),
#     #theme = shinythemes::shinytheme("readable"),
#     #theme = shinythemes::shinytheme("paper"),
#     theme = shinythemes::shinytheme("flatly"),
# 
# 
#     mainPanel(
#       # Display your text here
# 
# 
# 
#       h1("A level Attainment in England 2018/19,2021/22 and 2022/23"),
# 
#       br(),
#       p("This app presents the highlights, of an analysis more fully explored within this notebook:" ),
# 
#       a("A level attainment differences by school type", href = "https://www.kaggle.com/code/mmcgovern/a-level-attainment-differences-by-school-types"),
#       br(),
#       br(),
#       #p("Both the notebook and app examine attainment at A level in England, from the 2022/23 examination diet(as this was the last year before the covid 19 pandemic) and how it differs between"), strong( "different school types."),
#       p(
#         "which examines attainment at A level in England, from the 2022/23 examination diet (as this was the last year before the Covid 19 pandemic) and how it differs between",
#         HTML(paste("<strong>different school types.</strong>"))
#       ),
# 
# 
#       br(),  # Line break
#       p("The data analysed is from the Department for Education (DfE) England, and is available to download from its website dedicated to exploring attainment data
# 
#         (https://www.compare-school-performance.service.gov.uk/)" ),
#         strong("Download data for all of England or a local authority (1991-2023)"),
#       a("Link", href = "https://www.compare-school-performance.service.gov.uk/"),
#       br(),
#       br(),
# 
# 
# 
# 
#   )
# ),

# 
#   
#   
# 
# 
# tabPanel(
#   "Mean A level Performance",
#   mainPanel(
#     strong("Mean A level Performance", style = "font-size: 30px;"),
#     br(),
#     br(),
#     # Display your text here
#     p("The below charts the TALLPPE_ALEV_1618 of each individual school, including  all school types. The TALLPPE_ALEV_1618 score that each individual 
#     school attained is shown on the horizontal axis, and the number of schools scoring that is displayed on the vertical axis."),  
#     
#     p("The mean TALLPPE_ALEV_1618 of all schools, during this exam diet, was 31.8. 
#       The upper standard deviation was 35.9 and the lower was 27.4. The chart shows that the distribution of TALLPPE_ALEV_1618 was
#       roughly normally distributed. There was bunching around the mean and relatively few schools 
#       had a TALLPPE_ALEV_1618 score of over 50 or below 10."),
#     
#   
#     br(),
#   ),
#   fluidPage(
#     
#     
#     sliderInput(inputId = "n_breaks",
#                 label = "Number of bins in histogram (approximate):",
#                 min = 5, max = 100, value = 35),
# 
#     
#     plotOutput("bell") 
#   )
#   
# ),


# tabPanel(
#   "Mean A level Performance by Different School Types",
#   mainPanel(
#     strong("Mean A level Performance by Different School Types", style = "font-size: 30px;"),
#     br(),
#     br(),
#     p(" The below chart displays the mean TALLPPE_ALEV_1618 for each school type, as recorded during the during the 22/23 examination diet.
#     As shown on the previous panel, the mean TALLPPE_ALEV_1618 for all schools, during this exam diet, was 31.8.
#     "),
#     br(),
#     strong("Mean A level Performance by Different School Types"),
#   ),
#   fluidPage(
#     plotOutput("chart"),
#   ),
#   br(),
#   br(),
#   br(),
#   br(),
#   br(),
#   br(),
#   br(),
#   br(),
# 
#     mainPanel(
#       # Display your text here
#       p("The IND (Independent) school group has the highest mean attainment, with F1619 (Free School - 16-19) being second (38.1, 36.5). 
#       However, it should be kept in mind that the F1619 group contains relatively few pupils, as shown on the Proportion of Pupils at Different School Types tab."),
#       
# p("Behind these two school/college types there are five types with a similar mean TALLPPE_ALEV_1618 score of around 32 or 31. 
# These are ACC (Academy Converter) and Sixth Form College (32.2, 32.1), and then VC (Voluntary Controlled School),ACC16-19 (Academy 16-19 Converter) and VA (Voluntary Aided School) (31.3, 31.1, 31.0)."),
# 
# p("The ACC school type actually contains more puplils than any other, and the Sixth Form College group comes in second in terms of pupil size. All the other school types in this group are relatively small. Once again, these sizes should be kept in mind when interpreting their mean A level attainment."),
# 
# p("Then there is another group of 3 types, FD (Foundation School),CY (Community School) and F (Free School - Mainstream), who all have a mean TALLPPE_ALEV_1618 of 29 (29.4, 29.3, 29.1). Again these vary significantly in terms of the number of pupils attending."),
# 
# p("Following that, AC (Academy Sponsor Led), General Further Education College and UTC (University Technical College) make up the lowest three mean TALLPPE_ALEV_1618 scores (26.4, 25.7, 22.5). AC and General Further Education College are relatively large in terms of pupils size but UTC is one of the smaller school types, which should cautiion us in interpreting its mean."),
#   ),
# ),


tabPanel(
  "Mean A Level Attainment",
  mainPanel(
    strong("Mean A Level Attainment 18/19,21/22 and 22/23", style = "font-size: 30px;"),
    br(),
    br(),
    
    p("
    The specific attainment measure used is TALLPPE_ALEV_1618, which is the average point score per A level entry, which I understand to be a score
      which represents the attainment for each person/pupil who sat A level examinations that academic year. The analysis presented here uses the mean (or average) TALLPPE_ALEV_1618 for
        each indvidual school/college, which is then grouped up and averaged for each of the different school types. 
        In other words, the DfE publishes the mean TALLPPE_ALEV_1618 of all the pupils attending a particular school. I then have taken that average
        and grouped up all the individual mean school scores by their category/type and made a new average based on that school type. The end result is actually an average of an average.
      The below table shows the mean TALLPPE_ALEV_1618 for all schools/colleges for each of the years 18/19,21/22 and 22/23
      
      "),

    br(),
    strong("Mean A Level Attainment 18/19,21/22 and 22/23"),
    br(),
    br(),
  ),
  fluidPage(
    theme = shinythemes::shinytheme("cerulean"),
    tableOutput("tb")
 
  )

),




tabPanel(
  "A Level Attainment By School",
  mainPanel(
    strong("A Level Attainment By School", style = "font-size: 30px;"),
    br(),
    br(),
    p("The below allows you to search for the mean TALLPPE_ALEV_1618 of any individual school, from the 18/19,21/22 and  22/23 exam diet. 
    You can also download the entire DfE dataset from the 22/23 exam diet from the Download Data button."),  
    p("Please read the notebook exploring the data and this topic in more detail at the below link"),
    a("A level attainment differences by school type", href = "https://www.kaggle.com/code/mmcgovern/a-level-attainment-differences-by-school-types"),
    br(),
    br(),
    br(),
    strong("TALLPPE_ALEV_1618 Score by Individual School 18/19,21/22 and 22/23"),
    br(),
    br(),
    br(),
  ),
  fluidPage(
    downloadButton("download_scores",
                   label= "Download data"),
    ##withLoader(
      DTOutput("Search")
      ##)
  )
),

collapsible = TRUE
)


