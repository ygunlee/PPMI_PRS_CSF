## R code for "Effects of Alzheimer's Genetic Risk Scores and CSF Biomarkers in de novo Parkinson's Disease"
## Code authour: Young-gun Lee 
## Code date: Mar, 28, 2022

## variables of the PPMI database 
## age = baseline age of subjects
## sex = sex of subjects
## education = education years of subjects
## GRSAD = computed GRS for AD
## GRSPD = computed GRS for PD
## PC1~4 = principal components of subjects 
## base_ptau_abeta = baseline CSF ptau/abeta ratio of subjects
## base_asyn = baseline CSF asyn of subjects
## ptau_abeta = time-varying CSF ptau/abeta ratio of subjects
## asyn = time-varying CSF asyn of subjects
## cognitive_score = time-varying cognitive scores
## UPDRS3_score = time-varying UPDRS3 score 
## putaminal_DAT_uptake = time-varying putaminal DAT uptake values


library(lme4)


## R code for Table 2. Effect of CSF biomarkers and genetic risk scores on the diaagnosis of PD
## Logistic regressions were conducted in all participats (PD + healthy control)

## Model 1 
glm(data=data, PD ~ GRSAD + GRSPD + age + sex + education + PC1 + PC2 + PC3 + PC4 + 1, family=binomial)

## Model 2
glm(data=data, PD ~ base_ptau_abeta + base_asyn + age + sex + education + PC1 + PC2 + PC3 + PC4 + 1, family=binomial)

## Model 3
glm(data=data, PD ~ GRSAD + GRSPD + base_ptau_abeta + base_asyn + age + sex + education + PC1 + PC2 + PC3 + PC4 + 1, family=binomial)





## R code for Table 3. Association between genetic risk scores and longitudinal CSF biomarkers in PD patients and HCs 
## Linear mixed models were conducted in PD and healthy control groups, respectively 

## Model for p-tau/abeta in PD group 
lmer(data=pd, ptau_abeta ~ asyn + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model for asyn in PD group 
lmer(data=pd, asyn ~ ptau_abeta + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + GRSAD*GRSPD + GRSAD*GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model for p-tau/abeta in HC group 
lmer(data=hc, ptau_abeta ~ asyn + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model for asyn in HC group 
lmer(data=hc, asyn ~ ptau_abeta + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))





## R code for Table 4. Effects of genetic risk scores and CSF biomarkers on longitudinal cognitive changes in PD patients
## Linear mixed models were conducted in PD groups only

## Model 1
lmer(data=pd, cognitive_score ~ GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model 2
lmer(data=pd, cognitive_score ~ base_asyn + base_ptau_abeta + GRSAD + GRSPD + YEAR + base_asyn*YEAR + base_ptau_abeta*YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))





## R code for Table 5. Effects of genetic risk scores and CSF biomarkers on longitudinal motor severity scores in PD patients
## Linear mixed models were conducted in PD groups only

## Model 1
lmer(data=pd, UPDRS3_score ~ GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model 2
lmer(data=pd, UPDRS3_score ~ asyn + ptau_abeta + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model 3
lmer(data=pd, UPDRS3_score ~ putaminal_DAT_uptake + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))

## Model 4
lmer(data=pd, UPDRS3_score ~ putaminal_DAT_uptake+ asyn + ptau_abeta + GRSAD + GRSPD + YEAR + GRSAD*YEAR + GRSPD*YEAR + age + sex + education + PC1 + PC2 + PC3 + PC4 + (YEAR | PATNO))






