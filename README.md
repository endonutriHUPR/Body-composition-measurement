# FEATURED PROTOCOL FROM NIH IMAGEJ SOFTWARE TO MEASURE BODY COMPOSITION AT L3 LEVEL IN COMPUTED TOMOGRAPHY

We provide a step-by-step protocol to perform body composition measures of muscle and fat tissues in computed tomography images at L3 level. It is customized from an already available protocol of the NIH.

Already published protocol just tuned to be easier: 
+ DOI: 10.1002/jpen.1721
+ https://doi.org/10.1371/journal.pone.0211629

Steps order is essential to semiautomatic protocol.

## 0. Automatically adjust brightness and contrast

Image → Adjust → Brightness and contrast → Auto (emerging window)


![TACS_MUSCLE_FAT_PROTOCOL_1](https://user-images.githubusercontent.com/114569590/193233717-3c459257-e6b9-479a-bada-5b3cae823059.png)

### 1. Define body outline

We define a body outline setting a general threshold (-250, 1000) to fill the section in red. Then, we use the “Wand” tool to click inside. Automatically, the software marks the edge in yellow. Finally, we measure.

**STEP 1**:

Image → Adjust → Threshold → Set (emerging window)

**STEP 2**:

(emerging window)
Lower threshold level: -250
Upper threshold level: 1000

![TACS_MUSCLE_FAT_PROTOCOL_2](https://user-images.githubusercontent.com/114569590/193233914-98c56cd3-670d-473c-b27f-623e8c91ef41.png)


**STEP 3**:

Select the “Wand” tool and click inside the section.

![TACS_MUSCLE_FAT_PROTOCOL_3](https://user-images.githubusercontent.com/114569590/193234001-369ddaff-2ca1-4945-abb5-8b531eb28956.png)


**STEP 4**:

Analyze → Set measurements → Select Area and Perimeter (emerging window)

It is important to unmark “Limit to threshold” in this phase.
![TACS_MUSCLE_FAT_PROTOCOL_4](https://user-images.githubusercontent.com/114569590/193234111-1accdbe7-e021-4210-8ca1-13da47c2f0fc.png)


**STEP 5**: 

Analyze → Measure

It will appear an emerging window with the result as in the example. We must not close it to save them at the end of the protocol.

![TACS_MUSCLE_FAT_PROTOCOL_5](https://user-images.githubusercontent.com/114569590/193234194-adcac639-a5d1-42e5-92c9-e52e3a319331.png)


**STEP 6**:

We measure fat setting its Hounsfield units:

Image → Threshold → Set (ventana emergente)

Lower threshold level: -190
Upper threshold level: -30

![TACS_MUSCLE_FAT_PROTOCOL_6](https://user-images.githubusercontent.com/114569590/193234257-e5a47c6f-ac70-4233-8762-65051376530e.png)


**STEP 7**:

Since this point, we have to change “Set measures” marking “Limit to threshold”. It takes into account the Hounsfield units we establish. Areas will appear in red. 

Analyze → Set measurements → Select Area, Perimeter and Limit to threshold (emerging window)

![TACS_MUSCLE_FAT_PROTOCOL_7](https://user-images.githubusercontent.com/114569590/193234661-04d3fcfd-9024-4626-9427-ee06487d4c1b.png)


**STEP 8**:

We measure total fat: subcutaneous, visceral, intermuscular and the error inside the guts. All of them share Hounsfield units and they are inside the yellow line that establishes the limit. The current measure will be added to the Results window.

Analyze → Measure


## 2. Delimit muscle outline perimeter

**STEP 1**:

Hounsfield units from -250 to -250 for a more comfortable vision. 

Image → Threshold → Set (emerging window)

Lower threshold level: -250
Upper threshold level: -250


**STEP 2**:
We use the “Polygon selections” tool to delimit the perimeter by clicking as in the image below. 

![TACS_MUSCLE_FAT_PROTOCOL_8](https://user-images.githubusercontent.com/114569590/193234722-2354f57a-7438-4c0f-9dba-227e9a286b88.png)


**STEP 3**:

Plugins → Macros → Run 

Automatic:  We run BC_ImageJ_1.imj macro which  sets all the Hounsfield units in terms of guessing different density muscle and fat. It will be important to subtract the areas. Measures will appear in the Results window below the previous ones. 

![TACS_MUSCLE_FAT_PROTOCOL_9](https://user-images.githubusercontent.com/114569590/193234802-12a6270f-06ef-40a1-bf44-7dbd0d16282f.png)


## 3. Delimit muscle inner line

**STEP 1**:

Hounsfield units from -250 to -250 for a more comfortable vision. 

Image → Threshold → Set (emerging window)

Lower threshold level: -250
Upper threshold level: -250


**STEP 2**:

We use the “Polygon selections” tool to delimit the perimeter by clicking as in the image below.

![TACS_MUSCLE_FAT_PROTOCOL_10](https://user-images.githubusercontent.com/114569590/193234891-6aa819fd-ce07-422e-ad17-50c74341dc36.png)

**STEP 3**:

Plugins → Macro → Run 

Automatic:  We run BC_ImageJ_1.imj macro which sets all the Hounsfield units in terms of guessing different density muscle and fat. It will be important to subtract the areas. Measures will appear in the Results window below the previous ones. 

## 4. Delimit vertebra perimeter

**STEP 1**:

Hounsfield units from -250 to -250 for a more comfortable vision. 

Image → Threshold → Set (emerging window)

Lower threshold level: -250
Upper threshold level: -250


**STEP 2**:

We use the “Polygon selections” tool to delimit the vertebra perimeter by clicking as in the image below. 

![TACS_MUSCLE_FAT_PROTOCOL_11](https://user-images.githubusercontent.com/114569590/193234995-c3b78834-2daf-458c-b78b-2d131bd6306e.png)


**STEP 3**:

Plugins → Macro → Run 
Automatic:  We run BC_ImageJ_1.imj macro which  sets all the Hounsfield units in terms of obtaining possible zones that share Hounsfield units with muscle and fat in the vertebra area. It will be important to subtract the areas. Measures will appear in the Results window below the previous ones. 

## 5. Delimit zones inside the guts that share Hounsfield units with fat

**STEP 1**:

Hounsfield units from -250 to -250 for a more comfortable vision. 

Image → Threshold → Set (emerging window)

Lower threshold level: -190
Upper threshold level: -30

**STEP 2**:

We can use “Wand” or “Polygon sections” tools being helped by “Shift” to keep the selections.

Using “Wand”:
![TACS_MUSCLE_FAT_PROTOCOL_12](https://user-images.githubusercontent.com/114569590/193235097-bb8e1b1e-7304-4eee-8b52-51325a6959af.png)

Using “Polygon selection”:
![TACS_MUSCLE_FAT_PROTOCOL_13](https://user-images.githubusercontent.com/114569590/193235131-d5ff6d0e-3cbf-4b42-b5d2-c87059995155.png)
This option is the fastest one.

**STEP 3**:

We measure the area of these selected zones

Analyze → Measure

## 6. We save all the results in a .csv file

Results emerging window → Files → Save as
The order and number of measures (24) have to be accurate to run R code.


