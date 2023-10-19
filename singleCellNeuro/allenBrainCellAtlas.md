
![header](/Tutoriales-IFC/assets/header.png)

# Accessing and visualizing public Single-cell data using Allen Brain Cell Atlas

___

## Interactive Visualization

- Open a web browser and navigate to: [https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas)

![abca_home](/Tutoriales-IFC/assets/scneuropics/abca1.png)

- Navigate down to the **Mouse whole-brain transcriptomic cell type atlas**, then read all the important information regarding such datasets.

![abca_mouseTranscriptomicInfo](/Tutoriales-IFC/assets/scneuropics/abca2.png)

- Now, before clicking into the "Explore the data in the ABC Atlas" section take a moment to follow the [link](https://alleninstitute.github.io/abc_atlas_access/intro.html) that provide more information on the composition and methods to accessing datasets. By following said link you can access a very complete documentation on the data available on the website and Allen Institute servers. We are going to use such links on a upcomming step of this tutorial.

- Enjoy the interactive experience on the [online data visualizer](https://knowledge.brain-map.org/data/LVDBJAW8BI5YSS1QUBG/explore).

![abca_mouseAltasFirstTime](/Tutoriales-IFC/assets/scneuropics/abca-warning.png)

- Play changing the parameters for visualization on the tool bar at the left of the screen, however if this is confusing for you, you might want to take a look on the [General User Guide](https://community.brain-map.org/t/introducing-the-allen-brain-cell-atlas/2444)

![abca_mouseTranscriptomicHelp](/Tutoriales-IFC/assets/scneuropics/abca3.png)

## Downloading specific datasets.

The web interface, however amazing and very useful, it can be either too simple or too complicated when we are trying to explore very specific data, and it can result more easy to deal if we download only the specific data that we need.

The Allen Institute provides a [comprehensive guide](https://alleninstitute.github.io/abc_atlas_access/notebooks/getting_started.html) to access the data, the following lines uses web links that are listed on such guide. We encorage you to explore thoroughly the official guide.

Being such gigantic datasets, we cannot simply download all the files at once, for that purposes in this guide we will use direct download links to access data, however there is a [recommended procedure] (https://alleninstitute.github.io/abc_atlas_access/notebooks/getting_started.html) to navigate datasets content using a Python Notebook.

- To get data we can start our search at the getting started [webpage](https://alleninstitute.github.io/abc_atlas_access/notebooks/getting_started.html) for the Allen Institute github repository. 

![abca_mouseDataAccess1](/Tutoriales-IFC/assets/scneuropics/data1.png)

- On the left side of the screen we can see listed different links to information for the datasets (**1**), by following such links we can also find the data to download. (**2**)

![abca_mouseDataAccess2](/Tutoriales-IFC/assets/scneuropics/data2.png)

- For this guide we will download both the Expression matrices and the associated metadata. (see above screenshot), by clicking into their respective links we can finally find the download link for such dataset. For this particular example (see picture below) we can download both raw data matrices or matrices that have been transformed using log2. 


![abca_mouseDataAccess3](/Tutoriales-IFC/assets/scneuropics/data3.png)


![abca_mouseDataAccess4](/Tutoriales-IFC/assets/scneuropics/data4.png)

- The downloaded data files are in H5 format, which can be opened and visualized using programming languages such R or Python.



![header](/Tutoriales-IFC/assets/header.png)
